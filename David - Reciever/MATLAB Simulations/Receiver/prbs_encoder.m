function [PRBS_symbols] = prbs_encoder(M)

k=log2(M); 
% Create PRBS Sequence (Encoder)
O = 20; % pattern of order O
N = (2^O) -1; % Maximum length sequence N = 2, k=0 (Binary)
PRBS = prbs(O,N);

switch k
    case 1
    PRBS_padded = [PRBS, zeros(1, mod(-numel(PRBS), k))];  %pad with zeros to multiple of k
    PRBS_symb = double(PRBS_padded); 
    PRBS_symbols = (PRBS_symb + 1); % for MPSK modulation
 
    otherwise
    PRBS_padded = [PRBS, zeros(1, mod(-numel(PRBS), k))];  %pad with zeros the to multiple of k
    PRBS_symb = sum(reshape(PRBS_padded, k, []) .* 2.^(k-1:-1:0)');
    PRBS_symbols = (PRBS_symb + 1); % for MPSK modulation
end

