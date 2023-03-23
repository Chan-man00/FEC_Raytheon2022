%% Simulation with Communications Toolbox
clc;clear;
%% Original Message
msg = readmatrix("original_data.csv");

% Convert to bits
fid = fopen("original_data.csv");
txData = double(fread(fid, '*ubit1'));

%% Modulate Signal with QPSK

M = 4;               % Modulation order
EbNo = 10;            % Information bit Eb/No in dB     ====> Modify for other power levels.

% Encoder properties
codeRate = 1/2;          % Code rate of convolutional encoder
constLen = 7;            % Constraint length of encoder
codeGenPoly = [171 133]; % Code generator polynomial of encoder
tblen = 32;              % Traceback depth of Viterbi decoder
trellis = poly2trellis(constLen,codeGenPoly);

enc = comm.ConvolutionalEncoder(trellis);
SNR = convertSNR(EbNo,"ebno","BitsPerSymbol",log2(M),"CodingRate",codeRate);

% Viterbi Decoding
decHard = comm.ViterbiDecoder(trellis,'InputFormat','Hard', ...
    'TracebackDepth',tblen);

decUnquant = comm.ViterbiDecoder(trellis,'InputFormat','Unquantized', ...
    'TracebackDepth',tblen);

decSoft = comm.ViterbiDecoder(trellis,'InputFormat','Soft', ...
    'SoftInputWordLength',3,'TracebackDepth',tblen);

% Error Rates
errHard = comm.ErrorRate('ReceiveDelay',tblen);
errUnquant = comm.ErrorRate('ReceiveDelay',tblen);
errSoft = comm.ErrorRate('ReceiveDelay',tblen);

% Encoded Data
encData = enc(txData);

% Modulate Data
modData = pskmod(encData,M,pi/4,InputType="bit");

% Pass Modulated Data to AWGN Channel
[rxSig,noiseVariance] = awgn(modData,SNR);

demodLLR.Variance = noiseVariance;
partitionPoints = (-1.5:0.5:1.5)/noiseVariance;

% Demodulate Data
hardData = pskdemod(rxSig,M,pi/4,OutputType="bit");
LLRData = pskdemod(rxSig,M,OutputType="llr");


%% Decode Data + Error Stats
    %Hard Decision
rxDataHard = decHard(hardData);
berHard = errHard(txData,rxDataHard);
    %Soft Decision
quantizedValue = quantiz(-LLRData,partitionPoints);
rxDataSoft = decSoft(double(quantizedValue));
berSoft = errSoft(txData,rxDataSoft);


% Errors
numErrs1 = symerr(txData,rxDataHard);
numErrs2 = symerr(txData,rxDataSoft);
