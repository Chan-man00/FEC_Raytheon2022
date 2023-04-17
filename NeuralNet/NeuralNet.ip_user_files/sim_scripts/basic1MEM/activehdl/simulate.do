onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+basic1MEM  -L xpm -L blk_mem_gen_v8_4_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.basic1MEM xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {basic1MEM.udo}

run 1000ns

endsim

quit -force
