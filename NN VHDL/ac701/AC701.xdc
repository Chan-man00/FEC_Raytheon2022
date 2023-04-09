# Clock
set_property PACKAGE_PIN R3 [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_P]
set_property PACKAGE_PIN P3 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_N]
create_clock -period 10.000 -name sys_clk_pin -add [get_ports SYSCLK_P]

# LEDs
set_property PACKAGE_PIN M26 [get_ports GPIO_LED_0]
set_property IOSTANDARD LVCMOS33 [get_ports GPIO_LED_0]
set_property PACKAGE_PIN T24 [get_ports GPIO_LED_1]
set_property IOSTANDARD LVCMOS33 [get_ports GPIO_LED_1]
set_property PACKAGE_PIN T25 [get_ports GPIO_LED_2]
set_property IOSTANDARD LVCMOS33 [get_ports GPIO_LED_2]
set_property PACKAGE_PIN R26 [get_ports GPIO_LED_3]
set_property IOSTANDARD LVCMOS33 [get_ports GPIO_LED_3]
