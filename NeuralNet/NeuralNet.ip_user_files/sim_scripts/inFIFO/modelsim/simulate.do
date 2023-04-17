onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc "  -L fifo_generator_v13_2_7 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib xil_defaultlib.inFIFO xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {inFIFO.udo}

run 1000ns

quit -force
