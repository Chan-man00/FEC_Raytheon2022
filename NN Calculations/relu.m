function Y = relu(X)
%relu Rectified Linear Unit activation function
%   Returns X if X > 0, or 0 otherwise
%   Accepts float, fixed-point or integer values
    Y = (X > 0) .* X;
end
