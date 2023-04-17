vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../NeuralNet.gen/sources_1/ip/Mem_Out/sim/Mem_Out.v" \


vlog -work xil_defaultlib \
"glbl.v"

