function [SER] = ser_awgn(EbN0dB,MOD_TYPE,M)
%Theoretical Symbol Error Rate for various modulations over AWGN
%EbN0dB - list of SNR per bit values
%MOD_TYPE - 'BPSK','PSK','QAM','PAM','FSK'
%M - Modulation level for the chosen modulation
%  - For PSK
gamma_b = 10.^(EbN0dB/10); %SNR per bit in linear scale
gamma_s = log2(M)*gamma_b; %SNR per symbol in linear scale
SER = zeros(size(EbN0dB));

switch lower(MOD_TYPE)
    
    case 'bpsk'
    SER=0.5*erfc(sqrt(gamma_b));
    
    case {'psk','mpsk'}
        if M==2 %for BPSK
        SER=0.5*erfc(sqrt(gamma_b));
        else
            if M==4 %for QPSK
            Q=0.5*erfc(sqrt(gamma_b)); 
            SER=2*Q-Q.^2;
            else %for other higher order M-ary PSK
            SER=erfc(sqrt(gamma_s)*sin(pi/M));
            end
        end

    otherwise
    disp 'ser_awgn.m: Invalid modulation (MOD_TYPE) selected'
end

end