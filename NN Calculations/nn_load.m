function nn = nn_load(filename, precision, verbose)
%load_nn Loads neural net structure and weights specified by an h5 file
    
    if nargin < 3
        verbose = false;
    end
    
    % bit precision for fixed-point calculation
    if nargin < 2
        precision = 0; % 0 is interpreted as float
    end
    if precision > 0
        bit_scale = 2^(precision-1); % 1 fewer bit for sign bit
        max_val = bit_scale - 1;
    else
        bit_scale = 0;
        max_val = 0;
    end
    
    % decode model config data
    model_config = jsondecode(h5readatt(filename, '/', 'model_config'));
    
    %if strcmp(model_config.class_name, 'Sequential') == 0
    %    error(['Unsupported class ' model_config.class_name])
    %end
    
    layers = length(model_config.config.layers);
    
    nn.layerCount = 0;
    nn.layer(1) = struct('type',[], 'kernel',[], 'rkernel',[], 'bias',[], 'rbias',[], 'units',[], 'activation',[], 'ractivation',[], 'af',[], 'raf',[], 'h',[], 'c',[], 'flip',[]);
    nn.precision = precision;
    nn.bit_scale = bit_scale;
    
    if verbose
        fprintf("num  Layer Type          Layer Name                Units\n");
        fprintf("---  ------------------  ------------------------  -----\n");
    end
    
    % Parse model layers
    for k = 1:layers
        name = model_config.config.layers(k).config.name;
        type = model_config.config.layers(k).class_name;
        
        switch type
            case 'InputLayer'
                % doesn't actually do anything ?
                if verbose
                    fprintf("     %-18s  %-24s  \n", type, name);
                end
                
            case 'Dropout'
                % doesn't actually do anything ?
                if verbose
                    fprintf("     %-18s  %-24s  \n", type, name);
                end
                
            case 'Dense'
                units = model_config.config.layers(k).config.units;
                bias = model_config.config.layers(k).config.use_bias;
                
                nn.layerCount = nn.layerCount + 1;
                nn.layer(nn.layerCount).type = type;
                [nn.layer(nn.layerCount).kernel, nn.layer(nn.layerCount).bias] ...
                    = load_dense(filename, name, bias, max_val);
                nn.layer(nn.layerCount).units = units;
                nn.layer(nn.layerCount).activation = model_config.config.layers(k).config.activation;
                
                if verbose
                    fprintf("%3d  %-18s  %-24s  %d\n", nn.layerCount, type, name, units);
                end
                
            case 'GRU'
                if model_config.config.layers(k).config.implementation ~= 2
                    error(['GRU Implementation ' dec2str(model_config.config.layers(k).config.implementation) ' not supported.'])
                end
                
                units = model_config.config.layers(k).config.units;
                bias = model_config.config.layers(k).config.use_bias;
                
                nn.layerCount = nn.layerCount + 1;
                nn.layer(nn.layerCount).type = type;
                [nn.layer(nn.layerCount).kernel, nn.layer(nn.layerCount).rkernel, nn.layer(nn.layerCount).bias, nn.layer(nn.layerCount).rbias] ...
                    = load_GRU(filename, name, bias, max_val);
                nn.layer(nn.layerCount).units = units;
                nn.layer(nn.layerCount).activation = model_config.config.layers(k).config.activation;
                nn.layer(nn.layerCount).ractivation = model_config.config.layers(k).config.recurrent_activation;
                nn.layer(nn.layerCount).flip = (model_config.config.layers(k).config.go_backwards == 1);
                
                if verbose
                    fprintf("%3d  %-18s  %-24s  %d\n", nn.layerCount, type, name, units);
                end
                
            case 'LSTM'
                if model_config.config.layers(k).config.implementation ~= 2
                    error(['GRU Implementation ' dec2str(model_config.config.layers(k).config.implementation) ' not supported.'])
                end
                
                units = model_config.config.layers(k).config.units;
                bias = model_config.config.layers(k).config.use_bias;
                
                nn.layerCount = nn.layerCount + 1;
                nn.layer(nn.layerCount).type = type;
                [nn.layer(nn.layerCount).kernel, nn.layer(nn.layerCount).rkernel, nn.layer(nn.layerCount).bias] ...
                    = load_LSTM(filename, name, bias, max_val);
                nn.layer(nn.layerCount).units = units;
                nn.layer(nn.layerCount).activation = model_config.config.layers(k).config.activation;
                nn.layer(nn.layerCount).ractivation = model_config.config.layers(k).config.recurrent_activation;
                nn.layer(nn.layerCount).flip = (model_config.config.layers(k).config.go_backwards == 1);
                
                if verbose
                    fprintf("%3d  %-18s  %-24s  %d\n", nn.layerCount, type, name, units);
                end
                
            case 'BatchNormalization'
                eps = model_config.config.layers(k).config.epsilon;
                
                nn.layerCount = nn.layerCount + 1;
                nn.layer(nn.layerCount).type = type;
                [nn.layer(nn.layerCount).kernel, nn.layer(nn.layerCount).bias] ...
                    = load_BatchNorm(filename, name, eps, max_val);
                nn.layer(nn.layerCount).units = size(nn.layer(nn.layerCount).kernel, 1);
                
                if verbose
                    fprintf("%3d  %-18s  %-24s  \n", nn.layerCount, type, name);
                end
                
            otherwise
                error(['Unsupported layer type ' type])
        end
        
    end
    
    if verbose
        disp(' ');
    end
end


% helper functions to load individual layer types:

function [kernel, bias] = load_dense(filename, name, use_bias, max_val)
    name = strcat('/model_weights/', name);
    weights = h5readatt(filename, name, 'weight_names');
    
    kernel = h5read(filename, strcat(name, '/', weights(1)));
    if use_bias == 1
        bias = h5read(filename, strcat(name, '/', weights(2)));
    else
        bias = zeros(size(kernel, 1), 1);
    end
    
    if max_val > 0
        kernel = round(kernel * max_val);
        bias = round(bias * max_val);
    end
end


function [kernel, rkernel, bias, rbias] = load_GRU(filename, name, use_bias, max_val)
    name = strcat('/model_weights/', name);
    weights = h5readatt(filename, name, 'weight_names');
    
    kernel = h5read(filename, strcat(name, '/', weights(1)));
    rkernel = h5read(filename, strcat(name, '/', weights(2)));
    if use_bias == 1
        bias_read = h5read(filename, strcat(name, '/', weights(3)));
        bias = bias_read(:, 1);
        rbias = bias_read(:, 2);
    else
        bias = zeros(size(kernel, 1), 1);
        rbias = zeros(size(rkernel, 1), 1);
    end
    
    if max_val > 0
        kernel = round(kernel * max_val);
        rkernel = round(rkernel * max_val);
        bias = round(bias * max_val);
        rbias = round(rbias * max_val);
    end
end


function [kernel, rkernel, bias] = load_LSTM(filename, name, use_bias, max_val)
    name = strcat('/model_weights/', name);
    weights = h5readatt(filename, name, 'weight_names');
    
    kernel = h5read(filename, strcat(name, '/', weights(1)));
    rkernel = h5read(filename, strcat(name, '/', weights(2)));
    if use_bias == 1
        bias = h5read(filename, strcat(name, '/', weights(3)));
    else
        bias = zeros(size(kernel, 1), 1);
    end
    
    if max_val > 0
        kernel = round(kernel * max_val);
        rkernel = round(rkernel * max_val);
        bias = round(bias * max_val);
    end
end


function [kernel, bias] = load_BatchNorm(filename, name, epsilon, max_val)
    name = strcat('/model_weights/', name);
    weights = h5readatt(filename, name, 'weight_names');
    
    gamma = h5read(filename, strcat(name, '/', weights(1)));
    beta = h5read(filename, strcat(name, '/', weights(2)));
    mean = h5read(filename, strcat(name, '/', weights(3)));
    var = h5read(filename, strcat(name, '/', weights(4)));
    
    kernel = gamma ./ sqrt(var + epsilon);
    bias = beta - kernel .* mean;
    
    if max_val > 0
        kernel = round(kernel * max_val);
        bias = round(bias * max_val);
    end
end

