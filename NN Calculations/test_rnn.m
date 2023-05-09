clear; close all; clc

%% Load test data
% files from:
% http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz
% http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz
[test_data, test_labels] = load_test_data('t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte');

% scale output to [0,1]
test_data_f = test_data ./ 255;

% shift label values so they match array indeces
test_labels = test_labels + 1;

%% Read NN data

% Layer 1: GRU
L1_bias    = h5read('test_rnn.h5', '/model_weights/gru/gru/gru_cell/bias:0');
L1_kernel  = h5read('test_rnn.h5', '/model_weights/gru/gru/gru_cell/kernel:0');
L1_rkernel = h5read('test_rnn.h5', '/model_weights/gru/gru/gru_cell/recurrent_kernel:0');

% split biases
L1_rbias = L1_bias(:,2);
L1_bias = L1_bias(:,1);

% get units count
L1_units = size(L1_bias, 1) / 3;

% Layer 2: Normalization
L2_beta    = h5read('test_rnn.h5', '/model_weights/batch_normalization/batch_normalization/beta:0');
L2_gamma   = h5read('test_rnn.h5', '/model_weights/batch_normalization/batch_normalization/gamma:0');
L2_mean    = h5read('test_rnn.h5', '/model_weights/batch_normalization/batch_normalization/moving_mean:0');
L2_var     = h5read('test_rnn.h5', '/model_weights/batch_normalization/batch_normalization/moving_variance:0');

% combine constants
L2_factor  = L2_gamma ./ sqrt(L2_var + 0.001); % L2_epsilon = 0.001
L2_add     = L2_beta - L2_factor .* L2_mean;

% Layer 3: Dense
L3_bias    = h5read('test_rnn.h5', '/model_weights/dense/dense/bias:0');
L3_kernel  = h5read('test_rnn.h5', '/model_weights/dense/dense/kernel:0');

%% Calculate floating-point output

% initialize GRU h_0 = 0
h = zeros(L1_units,1);

% GRU kernels are three sets of weights mashed together
X_z =            1 : L1_units;
X_r = L1_units  +1 : L1_units*2;
X_h = L1_units*2+1 : L1_units*3;

for k = 0:27
    input = test_data_f( (k*28+1) : (k+1)*28, : );
    
    % GRU Layer (implementation 2)
    x = L1_kernel*input + L1_bias;
    %x_z = x(1 : L1_units, :);
    %x_r = x(L1_units+1 : L1_units*2, :);
    %x_h = x(L1_units*2+1 : end, :);
    rx = L1_rkernel*h + L1_rbias;
    %r_z = rx(1 : L1_units, :);
    %r_r = rx(L1_units+1 : L1_units*2, :);
    %r_h = rx(L1_units*2+1 : end, :);
    
    %z = sigmoid(x_z + r_z);
    %r = sigmoid(x_r + r_r);
    %hh = tanh(x_h + r_h.*r);
    z = sigmoid(x(X_z, :) + rx(X_z, :));
    r = sigmoid(x(X_r, :) + rx(X_r, :));
    hh = tanh(x(X_h, :) + rx(X_h, :).*r);
    
    h = z.*h + (1 - z).*hh;
    %pass1 = h;
    
    % Normalization Layer
    pass2 = L2_factor .* h + L2_add;
    
    % Dense Layer
    pass3 = L3_kernel * pass2 + L3_bias;
end

[~, output] = max(pass3);

fpaccuracy = sum((output - test_labels) == 0) ./ 100;
fprintf("Floating point accuracy: %g\n\n", fpaccuracy);


%% Calculate using N bits of precsion (1 bit for sign, N-1 for data)

n_first = 4;
n_last = 20;

bits = zeros(1, n_last-n_first+1);
accuracy = zeros(1, n_last-n_first+1);
fpmatch = zeros(1, n_last-n_first+1);

for N = 1:(n_last-n_first+1)
    n = N + n_first - 1;
    
    bit_scale = 2^(n-1); % 1 fewer bit for sign bit
    max_val = bit_scale - 1;
    
    %*** Bit depths don't necessarily have to all be equal... it may be
    %    possible to squeeze bits by optimizing individual parameters.
    
    % initialize activation function tables
    k_af = tanh_lut(n-1);
    r_af = sigmoid_lut(n-1);
    
    fprintf("Running %d-bit ... (LUT %d entries)\n", [n length(k_af.lut)+length(r_af.lut)]);
    
    % scale layer weights
    i1_bias    = round(L1_bias * max_val);
    i1_kernel  = round(L1_kernel * max_val);
    i1_rbias   = round(L1_rbias * max_val);
    i1_rkernel = round(L1_rkernel * max_val);
    i2_add     = round(L2_add * max_val);
    i2_factor  = round(L2_factor * max_val);
    i3_bias    = round(L3_bias * max_val);
    i3_kernel  = round(L3_kernel * max_val);
    
    % scale test data
    test_data_b = round(test_data_f * max_val);
    
    % initialize GRU h_0 = 0
    h = zeros(L1_units, size(test_data_b, 2));
    
    for k = 0:27
        input = test_data_b( (k*28+1) : (k+1)*28, : );
        
        % GRU Layer (implementation 2)
        x = round(i1_kernel * input / bit_scale) + i1_bias;
        rx = round(i1_rkernel * h / bit_scale) + i1_rbias;
        z = int_af(x(X_z, :) + rx(X_z, :), r_af);
        r = int_af(x(X_r, :) + rx(X_r, :), r_af);
        hh = int_af(x(X_h, :) + round(rx(X_h, :) .* r / bit_scale), k_af);
        
        h = round((z .* h + (bit_scale - z) .* hh) / bit_scale);
        %pass1 = h;
        
        % Normalization Layer
        pass2 = round(i2_factor .* h / bit_scale) + i2_add;
        
        % Dense Layer
        pass3 = round(i3_kernel * pass2 / bit_scale) + i3_bias;
    end
    
    [~, outputi] = max(pass3);
    
    bits(N) = n;
    accuracy(N) = sum((outputi - test_labels) == 0) ./ 100;
    fpmatch(N) = sum(outputi == output) ./ 100;
end

%% Tabulate Results
clc

fprintf("Bits\tAccuracy\tMatches FP/TF\n");
fprintf("----\t--------\t----------\n");
fprintf("%4d\t%6.2f %%\t%7.2f %%\n", [bits; accuracy; fpmatch]);
fprintf("Float\t%6.2f %%\t(100.00 %%)\n", fpaccuracy);

%% Plot Results
figure(1)
plot([n_first-1 n_last+1],[fpaccuracy fpaccuracy],'-', bits,accuracy,'x');
set(gca, 'YGrid', 'off', 'XGrid', 'on')
%ylim([0, 100])
xlim([n_first-1, n_last+1])
xlabel('Integer Bit Depth')
ylabel('Accuracy (%)')
legend({'Floating Point Accuracy', 'Integer Accuracy'}, 'Location','northeast')

figure(2)
plot(bits,fpmatch,'x');
grid on
%ylim([0, 100])
xlim([n_first-1, n_last+1])
xlabel('Integer Bit Depth')
ylabel('Matches Floating Point Results (%)')

