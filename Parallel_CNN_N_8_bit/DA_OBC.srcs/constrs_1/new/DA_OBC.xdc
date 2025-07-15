set_property PACKAGE_PIN M11 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]
set_property PACKAGE_PIN F23 [get_ports clk_p]
set_property PACKAGE_PIN E23 [get_ports clk_n]
set_property IOSTANDARD LVDS [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_n]
create_clock -name clk -period 8.0 [get_ports clk_p]


#set_property PACKAGE_PIN H14 [get_ports {out[3]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {out[3]}]


#set_property PACKAGE_PIN D7 [get_ports {out[2]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {out[2]}]


#set_property PACKAGE_PIN G13 [get_ports {out[1]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {out[1]}]


#set_property PACKAGE_PIN A9 [get_ports {out[0]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {out[0]}]

set_property use_dsp no [get_cells -hier *]