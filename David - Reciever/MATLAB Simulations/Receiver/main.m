%% Receiver Simulation
% David Venegas
% ECE 4900
% University of Utah
%
% rev 1.0 (11/11/2022)
clc;clear; 
%% (1). Eb/N0 Vs SER for MPSK over AWGN (complex baseband model)

%---------Input Fields------------------------
EbN0dB = 0:2:24; % Eb/N0 range in dB for simulation
MOD_TYPE='PSK'; %Set 'PSK'
arrayOfM=[2,4,8,16,32]; %array of M values to simulate  -> MPSK

plotColor =["#0072BD","#D95319","#EDB120","#7E2F8E","#77AC30"]; % colors
p=1; %plot colors
legendString = cell(1,length(arrayOfM)*2); %for legend entries

S = cell(5,1);
R = cell(5,1);

for M = arrayOfM
   
    %-----Initialization of various parameters----
    k=log2(M); 
    EsN0dB = 10*log10(k)+EbN0dB; %EsN0dB calculation
    SER_sim = zeros(1,length(EbN0dB));%simulated Symbol error rates
    d = prbs_encoder(M); % symbols from 1:M
    s = modulate(MOD_TYPE,M,d);
    S{p} = s;

    for i=1:length(EsN0dB)
    r = add_awgn_noise(s,EsN0dB(i));%add AWGN noise
    dCap = demodulate(MOD_TYPE,M,r);
    SER_sim(i) = sum((d~=dCap))/length(s);%SER computation
    end
    R{p} = r;
    SER_theory = ser_awgn(EbN0dB,MOD_TYPE,M);%theory SER
    
    semilogy(EbN0dB,SER_sim,"Color",plotColor(p),"Marker",".","MarkerFaceColor", plotColor(p),"MarkerEdgeColor",plotColor(p), "MarkerSize",15); 
    hold on;
    semilogy(EbN0dB,SER_theory,"Color",plotColor(p), "LineWidth",1);
    legendString{2*p-1}=['Sim ',num2str(M),'-',MOD_TYPE];
    legendString{2*p}=['']; 
    %legendString{2*p}=['Theory ',num2str(M),'-',MOD_TYPE]; 

    p=p+1;
end

legend(legendString);
xlabel('Eb/N0 [dB]');
ylabel('Symbol Error Rate (SER) [Ps]');
title(['Probability of Symbol Error for M-',MOD_TYPE,' over AWGN']);
ylim([10^-6 10^-0]);
grid on;

%% Plot of Simulated Constellations for MPSK

figure(2)
hold on;
ylim([-1 1]);
xlim([-1 1]);
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
plot(real(R{1,1}),imag(R{1,1}),".","MarkerSize", 1);
plot(real(S{1,1}),imag(S{1,1}),".","MarkerSize", 20);
grid on;
title("BPSK Constellation with AGWN");
xlabel("Imaginary Q");
ylabel("Real I");
hold off;

figure(3)
hold on;
ylim([-1 1]);
xlim([-1 1]);
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
plot(real(R{2,1}),imag(R{2,1}),".","MarkerSize", 1);
plot(real(S{2,1}),imag(S{2,1}),".","MarkerSize", 20);
grid on;
title("QPSK Constellation with AGWN");
xlabel("Imaginary Q");
ylabel("Real I");
hold off;

figure(4)
hold on;
ylim([-1 1]);
xlim([-1 1]);
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
plot(real(R{3,1}),imag(R{3,1}),".","MarkerSize", 1);
plot(real(S{3,1}),imag(S{3,1}),".","MarkerSize", 20);
grid on;
title("8-PSK Constellation with AGWN");
xlabel("Imaginary Q");
ylabel("Real I");
hold off;

figure(5)
hold on;
ylim([-1 1]);
xlim([-1 1]);
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
plot(real(R{4,1}),imag(R{4,1}),".","MarkerSize", 1);
plot(real(S{4,1}),imag(S{4,1}),".","MarkerSize", 20);
grid on;
title("16-PSK Constellation with AGWN");
xlabel("Imaginary Q");
ylabel("Real I");
hold off;

figure(6)
hold on;
ylim([-1 1]);
xlim([-1 1]);
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
plot(real(R{5,1}),imag(R{5,1}),".","MarkerSize", 1);
plot(real(S{5,1}),imag(S{5,1}),".","MarkerSize", 20);
grid on;
title("32-PSK Constellation with AGWN");
xlabel("Imaginary Q");
ylabel("Real I");
hold off;

%% Visualize receiver impairments 

% From S(#) modulates values above

g_1=0.8; phi_1=0; dc_i_1=0; dc_q_1=0; %gain mismatch only
g_2=1;phi_2=12; dc_i_2=0; dc_q_2=0; %phase mismatch only
g_3=1;phi_3=0; dc_i_3=0.5; dc_q_3=0.5; %DC offsets only
g_4=0.8; phi_4=12; dc_i_4=0.5; dc_q_4=0.5; %All impairments

r1=receiver_impairments(S{5,1},g_1,phi_1,dc_i_1,dc_q_1);
r2=receiver_impairments(S{5,1},g_2,phi_2,dc_i_2,dc_q_2);
r3=receiver_impairments(S{5,1},g_3,phi_3,dc_i_3,dc_q_3);
r4=receiver_impairments(S{5,1},g_4,phi_4,dc_i_4,dc_q_4);

subplot(2,2,1);
plot(real(S{5,1}),imag(S{5,1}),'b.');
hold on;
plot(real(r1),imag(r1),'r.'); 
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
grid on;
title('IQ Gain mismatch only');


subplot(2,2,2);
plot(real(S{5,1}),imag(S{5,1}),'b.');
hold on;
plot(real(r2),imag(r2),'r.'); 
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
grid on;
title('IQ Phase mismatch only');

subplot(2,2,3);
plot(real(S{5,1}),imag(S{5,1}),'b.');
hold on;
plot(real(r3),imag(r3),'r.'); 
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
grid on;
title('DC offsets only');

subplot(2,2,4);
plot(real(S{5,1}),imag(S{5,1}),'b.');
hold on;
plot(real(r4),imag(r4),'r.');
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
grid on;
title('IQ impairments & DC offsets');

%% Performance of MPSK modulation with receiver impairments
clc;clear;
%---------Input Fields------------------------
g=0.7; phi=2; dc_i=1.5; dc_q=1.5;%receiver impairments
M = 4;
EbN0dB = 0:2:24; 
%----------------------------------------------
k=log2(M); %Bits per symbol
EsN0dB = 10*log10(k)+EbN0dB; %Converting Eb/N0 to Es/N0
SER1 = zeros(length(EsN0dB),1);%Symbol Error rates (No compensation)
SER2 = SER1;%Symbol Error rates (DC compensation only)
SER3 = SER1;%Symbol Error rates (DC comp & Blind IQ compensation)
SER4 = SER1;%Symbol Error rates (DC comp & Pilot IQ compensation)
d = prbs_encoder(M);%data symbols drawn from [1,2,..,M]
[s,ref]=mpsk_modulator(M,d);%MQAM symbols & reference constellation

%- Complex Baseband Equivalent Models' for function definition
for i=1:length(EsN0dB)
r = add_awgn_noise(s,EsN0dB(i)); %see section 4.1 on chapter 4
z=receiver_impairments(r,g,phi,dc_i,dc_q);%add impairments
v=dc_compensation(z); %DC compensation
y3=blind_iq_compensation(v); %blind IQ compensation
[Kest,Pest]=pilot_iq_imb_est(g,phi,dc_i,dc_q);%Pilot based estimation
y4=iqImb_compensation(v,Kest,Pest);%IQ comp. using estimated values

%Enable this section - if you want to plot constellation diagram -
figure(1);
plot(real(z),imag(z),'rO'); 
ylim([-2.5 2.5]);
xlim([-2.5 2.5]);
hold on;
plot(real(y4),imag(y4),'b*'); 
line([0,0], ylim,'LineStyle','-','Color','k'); % Draw line for Y axis.
line(xlim, [0,0],'LineStyle','-','Color','k'); % Draw line for X axis.
hold off;
title(['Eb/N0=',num2str(EbN0dB(i)),' (dB)']);
grid on;
pause;
%pause;
%-------IQ Detectors - defined in section 3.5.4 chapter 3--------
[estTxSymbols_1,dcap_1]= iqOptDetector(z,ref);%No compensation
[estTxSymbols_2,dcap_2]= iqOptDetector(v,ref);%DC compensation only
[estTxSymbols_3,dcap_3]= iqOptDetector(y3,ref);%DC & blind IQ comp.
[estTxSymbols_4,dcap_4]= iqOptDetector(y4,ref);%DC & pilot IQ comp.

%------ Symbol Error Rate Computation-------
SER1(i)=sum((d~=dcap_1))/length(s); 
SER2(i)=sum((d~=dcap_2))/length(s);
SER3(i)=sum((d~=dcap_3))/length(s); 
SER4(i)=sum((d~=dcap_4))/length(s);
end

theoreticalSER = ser_awgn(EbN0dB,'PSK',M); %theoretical SER

figure(2);
semilogy(EbN0dB,SER1,'r*-'); 
hold on; 
semilogy(EbN0dB,SER2,'bo-'); 
semilogy(EbN0dB,SER3,'g^-');
semilogy(EbN0dB,SER4,'m*-'); 
semilogy(EbN0dB,theoreticalSER,'k');
legend('No compensation','DC comp only',...
    'Sim- DC & blind iq comp','Sim- DC & pilot iq comp','Theoretical');
xlabel('E_b/N_0 (dB)');ylabel('Symbol Error Rate (Ps)');
title('Probability of Symbol Error MPSK signals');
ylim([10^-6 10^0]);
grid on;

%% BER with Soft Descitions (Hamming)   TEST NEED POLISHING

%BPSK over AWGN (complex baseband model) with Hamming coding
clearvars; clc;
nBits =10^6; %number of source bits
EbN0dB = -2:1:12; % Eb/N0 range in dB for simulation
MOD_TYPE='PSK'; %Modulation type
M=2; %For BPSK -> 2-PSK
%Block code definitions
G=[ 1 0 0 0 1 1 0; %generator matrix for (7,4) Hamming code
0 1 0 0 1 0 1;
0 0 1 0 0 1 1;
0 0 0 1 1 1 1];

%G =[1 0 0 0 0 0 0 0 0 0 0 0 0 1 1;%G matrix (15,11) Hamming code
%0 1 0 0 0 0 0 0 0 0 0 0 1 0 1;
%0 0 1 0 0 0 0 0 0 0 0 0 1 1 0;
%0 0 0 1 0 0 0 0 0 0 0 0 1 1 1;
%0 0 0 0 1 0 0 0 0 0 0 1 0 0 1;
%0 0 0 0 0 1 0 0 0 0 0 1 0 1 0;
%0 0 0 0 0 0 1 0 0 0 0 1 0 1 1;
%0 0 0 0 0 0 0 1 0 0 0 1 1 0 0;
%0 0 0 0 0 0 0 0 1 0 0 1 1 0 1;
%0 0 0 0 0 0 0 0 0 1 0 1 1 1 0;
%0 0 0 0 0 0 0 0 0 0 1 1 1 1 1];
[k,n] = size(G); %derive n and k from the G matrix
H = gen2parmat(G); %find the H matrix
syndromeTable = getSyndromeTable(G); %syndrome table for G
m=de2bi(0:1:2^k-1,'left-msb');%list all numbers from 0 to 2ˆk-1
C=mod(m*G,2); %list of all possible codewords (code book)

%EcN0dB calculation to account for overheads
EcN0dB = EbN0dB + 10*log10(log2(M)) + 10*log10(k/n);
BER_Hamming_Hard = zeros(1,length(EbN0dB));%simulated BER (Hard)
BER_Hamming_Soft = zeros(1,length(EbN0dB));%simulated BER (Soft)
for i=1:length(EcN0dB)
%---- Transmitter - Block encoding, BPSK modulation-------
x =rand(1,nBits) > 0.5; %stream of random information bits
%append zeros to account for block size of encoder
x =[x zeros(1,k-mod(nBits,k))];

%reshape information stream to blocks
m = reshape(x,k,length(x)/k).'; %message blocks
cBlocks = mod(m*G,2);%codewords generated by the block encoder
c= cBlocks.'; c = c(:).';%serialize codewords into one stream
y = 2*c-1;%BPSK modulation
%---------AWGN channel --------------------
r= add_awgn_noise(y,EcN0dB(i));%add AWGN noise

%--------Soft decision decoding using unquantized r -------
rBlks = reshape(r,n,length(r)/n).';%blocks of length n
%Compute correlation metric and get index of maximum value
[maxCorrVal,maxCorrIndex]=max((2*C-1)*rBlks.');
cSoftBlks = C(maxCorrIndex,:);%recovered codewords
mSoftBlks = cSoftBlks(:,1:k);%strip off parity bits
%serialize into bit stream
xSoftBlks = mSoftBlks.'; xSoft=xSoftBlks(:).';
BER_Hamming_Soft(i) = sum(sum(x~=xSoft))/numel(xSoft);%BER
end
BER_uncoded_theory=0.5*erfc(sqrt(10.^(EbN0dB/10)));%BPSKBER(uncoded)
figure; semilogy(EbN0dB,BER_Hamming_Hard,'r*-'); hold on;
semilogy(EbN0dB,BER_Hamming_Soft,'bo-');
semilogy(EbN0dB,BER_uncoded_theory,'k-'); grid on;
legend('(7,4) Hamming (Hard)','(7,4) Hamming (Soft)',...
'Uncoded BPSK (Theory)');
xlabel('Eb/N0(dB)');ylabel('Bit Error Rate (Pb)');
title('BER of BPSK system over AWGN');
