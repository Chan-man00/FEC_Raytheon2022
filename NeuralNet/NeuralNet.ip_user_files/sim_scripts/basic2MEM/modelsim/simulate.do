onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc "  -L blk_mem_gen_v8_4_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib xil_defaultlib.basic2MEM xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {basic2MEM.udo}

run 1000ns

quit -force
