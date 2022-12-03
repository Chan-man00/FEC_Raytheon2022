function [nn] = nn_init(nn)
%nn_init Sets activation functions and initializes any RNN outputs
    
    % generate fixed-point look-up tables
    if nn.precision > 0
        nn.sigmoid_lut = sigmoid_lut(nn.precision - 1);
        nn.tanh_lut = tanh_lut(nn.precision - 1);
    end
    
    for k = 1:nn.layerCount
        % initialize RNN outputs
        switch nn.layer(k).type
            case 'GRU'
                nn.layer(k).h = zeros(nn.layer(k).units, 1);
                
            case 'LSTM'
                nn.layer(k).h = zeros(nn.layer(k).units, 1);
                nn.layer(k).c = zeros(nn.layer(k).units, 1);
                
            otherwise
                % nothing
        end
        
        % get activation functions
        if ~isempty(nn.layer(k).activation)
            nn.layer(k).af = activation_function(nn.layer(k).activation, nn);
        end
        if ~isempty(nn.layer(k).ractivation)
            nn.layer(k).raf = activation_function(nn.layer(k).ractivation, nn);
        end
    end
end

% helper function to load retrieve AF handle
function af = activation_function(name, nn)
    if nargin < 2
        use_lut = false;
    else
        use_lut = (nn.precision > 0);
    end
    switch lower(name)
        case 'linear'
            af = @(x) x;
        
        case 'relu'
            af = @(x) relu(x);
        
        case 'sigmoid'
            if use_lut
                af = @(x) int_af(x, nn.sigmoid_lut);
            else
                af = @(x) sigmoid(x);
            end
        
        case 'tanh'
            if use_lut
                af = @(x) int_af(x, nn.tanh_lut);
            else
                af = @(x) tanh(x);
            end
        
        otherwise
            error(['Unsupported activation function ' name]);
    end
end
