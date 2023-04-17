######################################################################
#
# File name : tb_mem_simulate.do
# Created on: Tue Mar 28 14:28:56 -0600 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L blk_mem_gen_v8_4_5 -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib xil_defaultlib.tb_mem xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {tb_mem_wave.do}

view wave
view structure
view signals

do {tb_mem.udo}

run 1000ns
