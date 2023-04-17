vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../NeuralNet.gen/sources_1/ip/output_2/sim/output_2.v" \


vlog -work xil_defaultlib \
"glbl.v"

