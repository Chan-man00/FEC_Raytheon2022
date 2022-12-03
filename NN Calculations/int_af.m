function Y = int_af(X, lut)
%int_af Calculates integer activation function from the specified look-up table
%   Returns Y = f(X)
%   LUT only applies if f(x) is bounded
%   
%Struct fields:
%   low = lowest x value where f(x < low) = f(low) at the given precision
%   high = highest x value where f(x > high) = f(high) at the given precision
%   lut = table of f(x) for every integer from low to high (inclusive)
%
%General way to calculate fields (assuming f(x) is invertible, f^-1(x), and increasing):
%   P_max = 2^precision - 1
%   low = floor( P_max * f^-1( (f_min + 0.5)/P_max ) )
%   high = ceil( P_max * f^-1( (f_max - 0.5)/P_max ) )
%   lut = round( f( (low:high)/P_max )*P_max )
    if nargin ~= 2
        error('invalid number of arguments');
    end
    if ~isstruct(lut)
        error('lut must be a look-up table structure created by an appropriate integer activation function.')
    end
    
    X(X<lut.low) = lut.low;
    X(X>lut.high) = lut.high;
    Y = lut.lut(X - lut.low + 1);
end
