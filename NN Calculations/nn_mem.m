function [nn] = nn_mem(nn, basename)
%nn_mem Exports layer weights and biases for the given neural net
    
    % generate fixed-point look-up tables
    
    for k = 1:nn.layerCount
        switch nn.layer(k).type
            case 'InputLayer'
                % do nothing
                
            case 'Dropout'
                % do nothing
                
            case 'Dense'
                inputs = size(nn.layer(k).kernel, 2);
                units = nn.layer(k).units;
                count = (inputs + 1)*units;
                
                weights = zeros(count,1);
                for n = 1:units
                    for m = 1:inputs
                        weights((inputs+1)*(n-1) + m) = nn.layer(k).kernel(n, m);
                    end
                    weights((inputs+1)*n) = nn.layer(k).bias(n);
                end
                
                if nn.precision == 0
                    % float
                    
                else
                    % fixed-point
                    writeMemHex([basename int2str(k) '.mem'], weights)
                end
                
            case 'GRU'
                inputs = size(nn.layer(k).kernel, 2);
                units = nn.layer(k).units;
                count = ((inputs + units)*3 + 4)*units;
                
                X_0 =                     1 : nn.layer(k).units;
                X_1 = nn.layer(k).units  +1 : nn.layer(k).units*2;
                X_2 = nn.layer(k).units*2+1 : nn.layer(k).units*3;
                
                z = nn.layer(k).kernel(X_0, :);
                r = nn.layer(k).kernel(X_1, :);
                h = nn.layer(k).kernel(X_2, :);
                rz = nn.layer(k).rkernel(X_0, :);
                rr = nn.layer(k).rkernel(X_1, :);
                rh = nn.layer(k).rkernel(X_2, :);
                z_bias = nn.layer(k).bias(X_0, :) + nn.layer(k).rbias(X_0, :);
                r_bias = nn.layer(k).bias(X_1, :) + nn.layer(k).rbias(X_1, :);
                h_bias = nn.layer(k).bias(X_2, :);
                h_rbias = nn.layer(k).rbias(X_2, :);
                
                weights = zeros(count,1);
                for n = 1:units
                    offs = ((inputs+units)*3 + 4)*(n-1) + 1;
                    for m = 1:inputs
                        weights(offs + (m-1)*3 + 0) = z(n, m);
                        weights(offs + (m-1)*3 + 1) = r(n, m);
                        weights(offs + (m-1)*3 + 2) = h(n, m);
                    end
                    offs = offs + 3*inputs;
                    for m = 1:units
                        weights(offs + (m-1)*3 + 0) = rz(n, m);
                        weights(offs + (m-1)*3 + 1) = rr(n, m);
                        weights(offs + (m-1)*3 + 2) = rh(n, m);
                    end
                    offs = offs + 3*units;
                    weights(offs + 0) = z_bias(n);
                    weights(offs + 1) = r_bias(n);
                    weights(offs + 2) = h_bias(n);
                    weights(offs + 3) = h_rbias(n);
                end
                
                if nn.precision == 0
                    % float
                    
                else
                    % fixed-point
                    writeMemHex([basename int2str(k) '.mem'], weights)
                end
                
            case 'LSTM'
                disp 'LSTM export not implemented'
                
            case 'BatchNormalization'
                disp 'BatchNormalization export not implemented'
                
            otherwise
                error(['Unsupported layer type ' type])
        end
    end
end


% helper function to export hex data
function writeMemHex(filename, data)
    out = dec2hex(data, 8);
    fileID = fopen(filename,'w');
    fprintf(fileID, "%c%c%c%c%c%c%c%c\n", out');
    fclose(fileID);
end

