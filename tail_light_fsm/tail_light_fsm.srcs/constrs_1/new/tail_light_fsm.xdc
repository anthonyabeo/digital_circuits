# Clock Signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -waveform {0 5} [get_ports clk]

# LEDs
set_property PACKAGE_PIN U14 [get_ports LC] 
set_property PACKAGE_PIN U15 [get_ports LB]
set_property PACKAGE_PIN W18 [get_ports LA]
set_property PACKAGE_PIN U19 [get_ports RA]
set_property PACKAGE_PIN E19 [get_ports RB]
set_property PACKAGE_PIN U16 [get_ports RC]
set_property IOSTANDARD LVCMOS33 [get_ports {LC LB LA RA RB RC}]

# Buttons
set_property PACKAGE_PIN W19 [get_ports L]
set_property PACKAGE_PIN U18 [get_ports rst]
set_property PACKAGE_PIN T17 [get_ports R]
set_property IOSTANDARD LVCMOS33 [get_ports {L rst R}]
