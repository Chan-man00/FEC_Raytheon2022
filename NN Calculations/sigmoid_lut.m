function [lut] = sigmoid_lut(precision)
%sigmoid_lut Returns fixed-point sigmoid activation look-up table
%   Y = 1/(1 + exp(-X))
    pmax = 2^precision - 1;
    
    high = ceil(pmax * log(2*pmax - 1));
    low = -high;
    
    x = (low:high)';
    y = round(sigmoid(x/pmax)*pmax);
    
    lut = struct('precision',precision, 'low',low, 'high',high, 'lut',y);
end

%Derivation for bounds:
%   sigmoid(x) = 1/(1+exp(-x))
%   sigmoid^-1(y) = -ln(1/y - 1)
%
%   high:
%       y = (pmax - 0.5)/pmax
%       1/y - 1 = pmax/(pmax - 0.5) - 1 = 1/(2*pmax - 1)
%       x = -ln(1/(2*pmax - 1)) = ln(2*pmax - 1)
%   
%   low:
%       y = 0.5 / pmax
%       1/y - 1 = 2*pmax - 1
%       x = -ln(2*pmax - 1) = -high
