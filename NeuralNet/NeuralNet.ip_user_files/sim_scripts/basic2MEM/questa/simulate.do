onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib basic2MEM_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {basic2MEM.udo}

run 1000ns

quit -force
