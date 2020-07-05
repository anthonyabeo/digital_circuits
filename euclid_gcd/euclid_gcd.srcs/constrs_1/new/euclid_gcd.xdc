# Clock Signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -waveform {0 5} [get_ports clk]

# INPUTS
# a
set_property PACKAGE_PIN V17 [get_ports {a[0]}]
set_property PACKAGE_PIN V16 [get_ports {a[1]}]
set_property PACKAGE_PIN W16 [get_ports {a[2]}]
set_property PACKAGE_PIN W17 [get_ports {a[3]}]
set_property PACKAGE_PIN W15 [get_ports {a[4]}]
set_property PACKAGE_PIN V15 [get_ports {a[5]}]
set_property PACKAGE_PIN W14 [get_ports {a[6]}]
set_property PACKAGE_PIN W13 [get_ports {a[7]}]

# b
set_property PACKAGE_PIN V2 [get_ports {b[0]}]
set_property PACKAGE_PIN T3 [get_ports {b[1]}]
set_property PACKAGE_PIN T2 [get_ports {b[2]}]
set_property PACKAGE_PIN R3 [get_ports {b[3]}]
set_property PACKAGE_PIN W2 [get_ports {b[4]}]
set_property PACKAGE_PIN U1 [get_ports {b[5]}]
set_property PACKAGE_PIN T1 [get_ports {b[6]}]
set_property PACKAGE_PIN R2 [get_ports {b[7]}]

# Reset
set_property PACKAGE_PIN U18 [get_ports rst]

# RESULT
set_property PACKAGE_PIN U16 [get_ports {result[0]}]
set_property PACKAGE_PIN E19 [get_ports {result[1]}]
set_property PACKAGE_PIN U19 [get_ports {result[2]}]
set_property PACKAGE_PIN V19 [get_ports {result[3]}]
set_property PACKAGE_PIN W18 [get_ports {result[4]}]
set_property PACKAGE_PIN U15 [get_ports {result[5]}]
set_property PACKAGE_PIN U14 [get_ports {result[6]}]
set_property PACKAGE_PIN V14 [get_ports {result[7]}]


set_property IOSTANDARD LVCMOS33 [get_ports {a b rst result}]