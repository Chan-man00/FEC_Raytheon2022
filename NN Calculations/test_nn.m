clear; close all; clc


%% Read NN data
%filename = 'test_lstm.h5'; % from "test nn model.py"
filename = 'basic_nn.h5';
nn = nn_load(filename);

%% Load test data
% files from:
% http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz
% http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz
[test_data, test_labels] = load_test_data('t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte');

% scale output to [0,1]
test_data_f = test_data ./ 255;

% shift label values so they match array indeces
test_labels = test_labels + 1;

%% Calculate floating-point output

% initialize
nn = nn_init(nn);

for k = 0:27
    input = test_data_f( (k*28+1) : (k+1)*28, : );
    [nn, nnout] = nn_eval(nn, input);
end

[~, output] = max(nnout);
[~, outrank] = sort(nnout);

fpaccuracy = sum((output - test_labels) == 0) ./ 100;
fprintf("Floating point accuracy: %g\n\n", fpaccuracy);
% expected: 98.38%

%% Compare to TF Output

%tf_out = csvread('lstm_output.csv')';
tf_out = csvread('basic_nn.csv')';
diff = abs(tf_out - nnout);
diff_max = max(diff, [], 'all');
diff_mean = mean(diff, 'all');
[~, tf_sel] = max(tf_out);
[~, tfrank] = sort(tf_out);
tf_errors = sum(outrank ~= tfrank, 'all');
fprintf("Average Difference compared to TF Output: %g\nLargest Difference compared to TF Output: %g\nTF Output Mismatches: %g\n", [diff_mean, diff_max, tf_errors]);

%% Calculate using N bits of precsion (1 bit for sign, N-1 for data)

n_first = 17;
n_last = 17;

bits = zeros(1, n_last-n_first+1);
accuracy = zeros(1, n_last-n_first+1);
fpmatch = zeros(1, n_last-n_first+1);
tfmax = zeros(1, n_last-n_first+1);
tfmean = zeros(1, n_last-n_first+1);
tferror = zeros(1, n_last-n_first+1);

for N = 1:(n_last-n_first+1)
    n = N + n_first - 1;
    
    %*** Bit depths don't necessarily have to all be equal... it may be
    %    possible to squeeze bits by optimizing individual parameters.
    
    nn = nn_load(filename, n);
    nn = nn_init(nn);
    
    fprintf("Running %d-bit ... (LUT %d entries)\n", [n length(nn.sigmoid_lut.lut)+length(nn.tanh_lut.lut)]);
    
    % scale test data
    max_val = nn.bit_scale - 1;
    test_data_b = round(test_data_f * max_val);
    test_data_b = test_data_b(:,1);
    
    for k = 0:27
        input = test_data_b( (k*28+1) : (k+1)*28, : );
        [nn, nnout] = nn_eval(nn, input);
    end
    
    [~, outputi] = max(nnout);
    [~, outrank] = sort(nnout);
    
    bits(N) = n;
    accuracy(N) = sum((outputi - test_labels) == 0) ./ 100;
    fpmatch(N) = sum(outputi == output) ./ 100;
    
    diff = abs(tf_out - nnout/max_val);
    tfmax(N) = max(diff, [], 'all');
    tfmean(N) = mean(diff, 'all');
    tferror(N) = sum(outrank ~= tfrank, 'all');
end

%% Tabulate Results
clc

fprintf("Bits\tAccuracy\tMatches FP\tTF Out Errors\tTF Diff Mean\tTF Diff Max\n");
fprintf("----\t--------\t----------\t-------------\t------------\t-----------\n");
fprintf("%4d\t%6.2f %%\t%7.2f %%\t%9d\t\t%-12g\t%g\n", [bits; accuracy; fpmatch; tferror; tfmean; tfmax]);
fprintf("Float\t%6.2f %%\t(100.00 %%)\t%9d\t\t%-12g\t%g\n\n", [fpaccuracy tf_errors diff_mean diff_max]);

