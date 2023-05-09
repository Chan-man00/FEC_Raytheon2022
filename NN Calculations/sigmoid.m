function Y = sigmoid(X)
%sigmoid Sigmoid activation function
%   Returns Y = 1/(1 + exp(-X))
%   Accepts float values only
    Y = 1 ./ (1 + exp(-X));
end
