function [dCap]=demodulate(MOD_TYPE,M,r)
%Wrapper functin to call various digital demodulation techniques
%MOD_TYPE - 'PSK','QAM','PAM','FSK'
%M - modulation order, For BPSK M=2, QPSK M=4, etc..
%r - received modulated symbols
%dCap - demodulated information symbols
%Construct the reference constellation for the selected mod. type
switch lower(MOD_TYPE)
case 'bpsk'
dCap= mpsk_detector(2,r); %M=2
case 'psk'
dCap= mpsk_detector(M,r);
otherwise
error('Invalid Modulation specified');
end