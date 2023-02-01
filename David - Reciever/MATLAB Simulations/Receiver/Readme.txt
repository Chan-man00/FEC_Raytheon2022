#####################################################################################
# David Venegas
# University of Utah
# Training files
# rev 1.0
#
# - S-complex values of the IQ plane with Additive Gaussian White Noise (AWGN)
# - MPSK constellation values (s-complex)
# - BPRS function: https://www.mathworks.com/help/serdes/ref/prbs.html
# - BPRS is padded with zeros to match the simulation (multiples of k = log2(M) 
#   where M is M-PSK. So, k = number of bits per codeword, example:
#   
#			BPSK ----> k = log2(2) = 1 (1-bit per codeword)	
#  			QPSK ----> k = log2(4) = 2 (2-bits per codeword)
#			8PSK ----> k = log2(8) = 3 (3-bits per codeword)
#			etc...
# 
# - CSV files are generated as a order (O = 20) or 20-PRBS with maximum length 
#   sequnece of N = 2^0 - 1 (N = 2) for binary sequence.
#
# - Original sequence prsb(O,N) ----> 1048575 double values (1's and 0's)
#   padded to multiples of k.