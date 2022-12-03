function [lut] = tanh_lut(precision)
%tanh_lut Returns fixed-point hyperbolic tangent activation look-up table
%   Y = tanh(X)
    pmax = 2^precision - 1;
    high = ceil(pmax * atanh(1 - 0.5/pmax));
    low = -high;
    
    x = (low:high)';
    y = round(tanh(x/pmax)*pmax);
    
    lut = struct('precision',precision, 'low',low, 'high',high, 'lut',y);
end
