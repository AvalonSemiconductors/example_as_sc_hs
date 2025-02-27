###############################################################################
# Created by write_sdc
# Mon Jan 20 20:39:54 2025
###############################################################################
current_design wrapped_tholin_riscv
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 5.0000 [get_ports {wb_clk_i}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_clock_latency -source -min 4.6500 [get_clocks {clk}]
set_clock_latency -source -max 5.5700 [get_clocks {clk}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.1900 [get_ports {io_oeb[33]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[32]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[31]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[30]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[29]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[28]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[27]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[26]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[25]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[24]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[23]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[22]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[21]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[20]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[19]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[18]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[17]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[16]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[15]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[14]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[13]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[12]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[11]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[10]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[9]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[8]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[7]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[6]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[5]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[4]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[3]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[2]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[1]}]
set_load -pin_load 0.1900 [get_ports {io_oeb[0]}]
set_load -pin_load 0.1900 [get_ports {io_out[32]}]
set_load -pin_load 0.1900 [get_ports {io_out[31]}]
set_load -pin_load 0.1900 [get_ports {io_out[30]}]
set_load -pin_load 0.1900 [get_ports {io_out[29]}]
set_load -pin_load 0.1900 [get_ports {io_out[28]}]
set_load -pin_load 0.1900 [get_ports {io_out[27]}]
set_load -pin_load 0.1900 [get_ports {io_out[26]}]
set_load -pin_load 0.1900 [get_ports {io_out[25]}]
set_load -pin_load 0.1900 [get_ports {io_out[24]}]
set_load -pin_load 0.1900 [get_ports {io_out[23]}]
set_load -pin_load 0.1900 [get_ports {io_out[22]}]
set_load -pin_load 0.1900 [get_ports {io_out[21]}]
set_load -pin_load 0.1900 [get_ports {io_out[20]}]
set_load -pin_load 0.1900 [get_ports {io_out[19]}]
set_load -pin_load 0.1900 [get_ports {io_out[18]}]
set_load -pin_load 0.1900 [get_ports {io_out[17]}]
set_load -pin_load 0.1900 [get_ports {io_out[16]}]
set_load -pin_load 0.1900 [get_ports {io_out[15]}]
set_load -pin_load 0.1900 [get_ports {io_out[14]}]
set_load -pin_load 0.1900 [get_ports {io_out[13]}]
set_load -pin_load 0.1900 [get_ports {io_out[12]}]
set_load -pin_load 0.1900 [get_ports {io_out[11]}]
set_load -pin_load 0.1900 [get_ports {io_out[10]}]
set_load -pin_load 0.1900 [get_ports {io_out[9]}]
set_load -pin_load 0.1900 [get_ports {io_out[8]}]
set_load -pin_load 0.1900 [get_ports {io_out[7]}]
set_load -pin_load 0.1900 [get_ports {io_out[6]}]
set_load -pin_load 0.1900 [get_ports {io_out[5]}]
set_load -pin_load 0.1900 [get_ports {io_out[4]}]
set_load -pin_load 0.1900 [get_ports {io_out[3]}]
set_load -pin_load 0.1900 [get_ports {io_out[2]}]
set_load -pin_load 0.1900 [get_ports {io_out[1]}]
set_load -pin_load 0.1900 [get_ports {io_out[0]}]
set_input_transition 0.6100 [get_ports {wb_clk_i}]
set_input_transition -min 0.0500 [get_ports {io_in[32]}]
set_input_transition -max 0.3800 [get_ports {io_in[32]}]
set_input_transition -min 0.0500 [get_ports {io_in[31]}]
set_input_transition -max 0.3800 [get_ports {io_in[31]}]
set_input_transition -min 0.0500 [get_ports {io_in[30]}]
set_input_transition -max 0.3800 [get_ports {io_in[30]}]
set_input_transition -min 0.0500 [get_ports {io_in[29]}]
set_input_transition -max 0.3800 [get_ports {io_in[29]}]
set_input_transition -min 0.0500 [get_ports {io_in[28]}]
set_input_transition -max 0.3800 [get_ports {io_in[28]}]
set_input_transition -min 0.0500 [get_ports {io_in[27]}]
set_input_transition -max 0.3800 [get_ports {io_in[27]}]
set_input_transition -min 0.0500 [get_ports {io_in[26]}]
set_input_transition -max 0.3800 [get_ports {io_in[26]}]
set_input_transition -min 0.0500 [get_ports {io_in[25]}]
set_input_transition -max 0.3800 [get_ports {io_in[25]}]
set_input_transition -min 0.0500 [get_ports {io_in[24]}]
set_input_transition -max 0.3800 [get_ports {io_in[24]}]
set_input_transition -min 0.0500 [get_ports {io_in[23]}]
set_input_transition -max 0.3800 [get_ports {io_in[23]}]
set_input_transition -min 0.0500 [get_ports {io_in[22]}]
set_input_transition -max 0.3800 [get_ports {io_in[22]}]
set_input_transition -min 0.0500 [get_ports {io_in[21]}]
set_input_transition -max 0.3800 [get_ports {io_in[21]}]
set_input_transition -min 0.0500 [get_ports {io_in[20]}]
set_input_transition -max 0.3800 [get_ports {io_in[20]}]
set_input_transition -min 0.0500 [get_ports {io_in[19]}]
set_input_transition -max 0.3800 [get_ports {io_in[19]}]
set_input_transition -min 0.0500 [get_ports {io_in[18]}]
set_input_transition -max 0.3800 [get_ports {io_in[18]}]
set_input_transition -min 0.0500 [get_ports {io_in[17]}]
set_input_transition -max 0.3800 [get_ports {io_in[17]}]
set_input_transition -min 0.0500 [get_ports {io_in[16]}]
set_input_transition -max 0.3800 [get_ports {io_in[16]}]
set_input_transition -min 0.0500 [get_ports {io_in[15]}]
set_input_transition -max 0.3800 [get_ports {io_in[15]}]
set_input_transition -min 0.0500 [get_ports {io_in[14]}]
set_input_transition -max 0.3800 [get_ports {io_in[14]}]
set_input_transition -min 0.0500 [get_ports {io_in[13]}]
set_input_transition -max 0.3800 [get_ports {io_in[13]}]
set_input_transition -min 0.0500 [get_ports {io_in[12]}]
set_input_transition -max 0.3800 [get_ports {io_in[12]}]
set_input_transition -min 0.0500 [get_ports {io_in[11]}]
set_input_transition -max 0.3800 [get_ports {io_in[11]}]
set_input_transition -min 0.0500 [get_ports {io_in[10]}]
set_input_transition -max 0.3800 [get_ports {io_in[10]}]
set_input_transition -min 0.0500 [get_ports {io_in[9]}]
set_input_transition -max 0.3800 [get_ports {io_in[9]}]
set_input_transition -min 0.0500 [get_ports {io_in[8]}]
set_input_transition -max 0.3800 [get_ports {io_in[8]}]
set_input_transition -min 0.0500 [get_ports {io_in[7]}]
set_input_transition -max 0.3800 [get_ports {io_in[7]}]
set_input_transition -min 0.0500 [get_ports {io_in[6]}]
set_input_transition -max 0.3800 [get_ports {io_in[6]}]
set_input_transition -min 0.0500 [get_ports {io_in[5]}]
set_input_transition -max 0.3800 [get_ports {io_in[5]}]
set_input_transition -min 0.0500 [get_ports {io_in[4]}]
set_input_transition -max 0.3800 [get_ports {io_in[4]}]
set_input_transition -min 0.0500 [get_ports {io_in[3]}]
set_input_transition -max 0.3800 [get_ports {io_in[3]}]
set_input_transition -min 0.0500 [get_ports {io_in[2]}]
set_input_transition -max 0.3800 [get_ports {io_in[2]}]
set_input_transition -min 0.0500 [get_ports {io_in[1]}]
set_input_transition -max 0.3800 [get_ports {io_in[1]}]
set_input_transition -min 0.0500 [get_ports {io_in[0]}]
set_input_transition -max 0.3800 [get_ports {io_in[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 1.0000 [current_design]
set_max_fanout 16.0000 [current_design]
