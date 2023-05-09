function [nn, output] = nn_eval(nn, input)
%eval_nn Evaluates one step of the specified neural net
    
    % pass input through each layer
    for k = 1:nn.layerCount
        switch nn.layer(k).type
            case 'InputLayer'
                % do nothing
                
            case 'Dropout'
                % do nothing
                
            case 'Dense'
                if nn.precision == 0
                    % float calculation
                    input = nn.layer(k).af( nn.layer(k).kernel * input + nn.layer(k).bias );
                else
                    % fixed-point calculation
                    input = nn.layer(k).af( round(nn.layer(k).kernel * input / nn.bit_scale) + nn.layer(k).bias );
                end
                
            case 'GRU'
                if nn.layer(k).flip
                    %input = flip(input, 1);
                end
                
                if nn.precision == 0
                    x = nn.layer(k).kernel * input + nn.layer(k).bias;
                    rx = nn.layer(k).rkernel * nn.layer(k).h + nn.layer(k).rbias;
                else
                    x = round(nn.layer(k).kernel * input / nn.bit_scale) + nn.layer(k).bias;
                    rx = round(nn.layer(k).rkernel * nn.layer(k).h / nn.bit_scale) + nn.layer(k).rbias;
                end
                
                X_0 =                     1 : nn.layer(k).units;
                X_1 = nn.layer(k).units  +1 : nn.layer(k).units*2;
                X_2 = nn.layer(k).units*2+1 : nn.layer(k).units*3;
                
                z = nn.layer(k).raf( x(X_0, :) + rx(X_0, :) );
                r = nn.layer(k).raf( x(X_1, :) + rx(X_1, :) );
                
                if nn.precision == 0
                    hh = nn.layer(k).af( x(X_2, :) + rx(X_2, :).*r );
                    nn.layer(k).h = z.*nn.layer(k).h + (1 - z).*hh;
                else
                    hh = nn.layer(k).af( x(X_2, :) + round(rx(X_2, :).*r / nn.bit_scale) );
                    nn.layer(k).h = round( (z.*nn.layer(k).h + (nn.bit_scale - z).*hh) / nn.bit_scale);
                end
                input = nn.layer(k).h;
                
            case 'LSTM'
                if nn.layer(k).flip
                    %input = flip(input, 1);
                end
                
                if nn.precision == 0
                    z = (nn.layer(k).kernel * input) + (nn.layer(k).rkernel * nn.layer(k).h) + nn.layer(k).bias;
                else
                    z = round((nn.layer(k).kernel * input + nn.layer(k).rkernel * nn.layer(k).h) / nn.bit_scale) + nn.layer(k).bias;
                end
                
                X_0 =                     1 : nn.layer(k).units;
                X_1 = nn.layer(k).units  +1 : nn.layer(k).units*2;
                X_2 = nn.layer(k).units*2+1 : nn.layer(k).units*3;
                X_3 = nn.layer(k).units*3+1 : nn.layer(k).units*4;
                
                i = nn.layer(k).raf(z(X_0, :));
                f = nn.layer(k).raf(z(X_1, :));
                o = nn.layer(k).raf(z(X_3, :));
                
                if nn.precision == 0
                    nn.layer(k).c = f .* nn.layer(k).c + i .* nn.layer(k).af(z(X_2, :));
                    nn.layer(k).h = o .* nn.layer(k).af(nn.layer(k).c);
                else
                    nn.layer(k).c = round((f .* nn.layer(k).c + i .* nn.layer(k).af(z(X_2, :))) / nn.bit_scale);
                    nn.layer(k).h = round(o .* nn.layer(k).af(nn.layer(k).c) / nn.bit_scale);
                end
                input = nn.layer(k).h;
                
            case 'BatchNormalization'
                if nn.precision == 0
                    input = nn.layer(k).kernel .* input + nn.layer(k).bias;
                else
                    input = round(nn.layer(k).kernel .* input / nn.bit_scale) + nn.layer(k).bias;
                end
                
            otherwise
                error(['Unsupported layer type ' type])
        end
    end
    output = input;
end
