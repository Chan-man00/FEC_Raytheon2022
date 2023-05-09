function output = nn_eval2(nn, input, input_dim)
%nn_eval2 Evaluates the recurrent neural net
    
    [~,ct] = size(input);
    X = input_dim(1);
    T = input_dim(2);
    
    for k = 1:nn.layerCount
        switch nn.layer(k).type
            case 'InputLayer'
                % do nothing
                
            case 'Dropout'
                % do nothing
                
            case 'Dense'
                Y = nn.layer(k).units;
                output = zeros(Y*T, ct);
                for t = 1:T
                    x = input(X*(t-1)+1 : X*t, :);
                    if nn.precision == 0
                        % float calculation
                        y = nn.layer(k).af( nn.layer(k).kernel * x + nn.layer(k).bias );
                    else
                        % fixed-point calculation
                        y = nn.layer(k).af( round(nn.layer(k).kernel * x / nn.bit_scale) + nn.layer(k).bias );
                    end
                    output(Y*(t-1)+1 : Y*t, :) = y;
                end
                
            case 'GRU'
                if nn.layer(k).flip
                    order = T:-1:1;
                else
                    order = 1:T;
                end
                
                Y = nn.layer(k).units;
                output = zeros(Y*T, ct);
                h = zeros(Y, ct);
                t2 = 1;
                for t = order
                    x = input(X*(t-1)+1 : X*t, :);
                    
                    if nn.precision == 0
                        ix = nn.layer(k).kernel * x + nn.layer(k).bias;
                        rx = nn.layer(k).rkernel * h + nn.layer(k).rbias;
                    else
                        ix = round(nn.layer(k).kernel * x / nn.bit_scale) + nn.layer(k).bias;
                        rx = round(nn.layer(k).rkernel * h / nn.bit_scale) + nn.layer(k).rbias;
                    end
                    
                    X_0 =                     1 : nn.layer(k).units;
                    X_1 = nn.layer(k).units  +1 : nn.layer(k).units*2;
                    X_2 = nn.layer(k).units*2+1 : nn.layer(k).units*3;
                    
                    z = nn.layer(k).raf( ix(X_0, :) + rx(X_0, :) );
                    r = nn.layer(k).raf( ix(X_1, :) + rx(X_1, :) );
                    
                    if nn.precision == 0
                        hh = nn.layer(k).af( ix(X_2, :) + rx(X_2, :).*r );
                        h = z.*h + (1 - z).*hh;
                    else
                        hh = nn.layer(k).af( ix(X_2, :) + round(rx(X_2, :).*r / nn.bit_scale) );
                        h = round( (z.*h + (nn.bit_scale - z).*hh) / nn.bit_scale);
                    end
                    
                    output(Y*(t2-1)+1 : Y*t2, :) = h;
                    t2 = t2+1;
                end
                
            case 'LSTM'
                if nn.layer(k).flip
                    order = T:-1:1;
                else
                    order = 1:T;
                end
                
                Y = nn.layer(k).units;
                output = zeros(Y*T, ct);
                c = zeros(Y, ct);
                h = zeros(Y, ct);
                t2 = 1;
                for t = order
                    x = input(X*(t-1)+1 : X*t, :);
                    
                    if nn.precision == 0
                        z = (nn.layer(k).kernel * x) + (nn.layer(k).rkernel * h) + nn.layer(k).bias;
                    else
                        z = round((nn.layer(k).kernel * x + nn.layer(k).rkernel * h) / nn.bit_scale) + nn.layer(k).bias;
                    end
                    
                    X_0 =                     1 : nn.layer(k).units;
                    X_1 = nn.layer(k).units  +1 : nn.layer(k).units*2;
                    X_2 = nn.layer(k).units*2+1 : nn.layer(k).units*3;
                    X_3 = nn.layer(k).units*3+1 : nn.layer(k).units*4;
                    
                    i = nn.layer(k).raf(z(X_0, :));
                    f = nn.layer(k).raf(z(X_1, :));
                    o = nn.layer(k).raf(z(X_3, :));
                    
                    if nn.precision == 0
                        c = f .* c + i .* nn.layer(k).af(z(X_2, :));
                        h = o .* nn.layer(k).af(c);
                    else
                        c = round((f .* c + i .* nn.layer(k).af(z(X_2, :))) / nn.bit_scale);
                        h = round(o .* nn.layer(k).af(c) / nn.bit_scale);
                    end
                    
                    output(Y*(t2-1)+1 : Y*t2, :) = h;
                    t2 = t2+1;
                end
                
            case 'BatchNormalization'
                Y = nn.layer(k).units;
                output = zeros(Y*T, ct);
                for t = 1:T
                    x = input(X*(t-1)+1 : X*t, :);
                    if nn.precision == 0
                        y = nn.layer(k).af( nn.layer(k).kernel .* x + nn.layer(k).bias );
                    else
                        y = nn.layer(k).af( round(nn.layer(k).kernel .* x / nn.bit_scale) + nn.layer(k).bias );
                    end
                    output(Y*(t-1)+1 : Y*t, :) = y;
                end
                
            otherwise
                error(['Unsupported layer type ' type])
        end
        
        input = output;
        X = Y;
    end
    
    output = input(Y*(T-1)+1 : Y*T, :);
    %output = input(1 : Y, :);
end
