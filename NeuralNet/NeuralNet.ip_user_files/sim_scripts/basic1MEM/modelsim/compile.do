vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../NeuralNet.gen/sources_1/ip/basic1MEM/sim/basic1MEM.v" \


vlog -work xil_defaultlib \
"glbl.v"
