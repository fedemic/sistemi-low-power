gui_start
analyze -format vhdl inccomp.vhd
elaborate inccomp -library work -architecture behavioral
uniquify
gui_show_man_page uniquify
compile -exact_map
change_selection -name __slctBus17 -type {cell design} _sel500
create clock -name ck -period 5 {ck}
create_clock -name ck -period 5 {ck}
report_power -include_input_nets > report/power_report_no_clk_gating
report_power -include_input_nets > report/power_report_no_clk_gating.txt
report_power -net -include_input_nets > report/power_report_net_no_clk_gating.txt
set_switching_activity -static_probability 0.5 -toggle_rate 2 -base_clock ck {ck}
set_switching_activity -static_probability 0 -base_clock ck {rst}
report_power -include_input_nets > report/power_report_no_clk_gating.txt
report_power -net -include_input_nets > report/power_report_net_no_clk_gating.txt
set_switching_activity -static_probability 0.12 -toggle_rate 0.025 -base_clock ck {INCA INCB}
power_report > report/power_report.txt
report_power > report/power_report.txt
report_cell > report/report_cell_realistic_inputs.txt
remove_design -designs
analyze -format vhdl inccomp.vhd
elaborate inccomp -library work
uniquify
compile -exact_map -gate_clock
create_clock -name ck -period 5 {ck}
report_power -include_input_nets > report/report_power.txt
report_power -net -include_input_nets > report/report_power_net.txt
set_switching_activity -static_probability 0.5 -toggle_rate 2 -base_clock ck {ck}
set_switching_activity -static_probability 0 -base_clock ck {rst}
set_switching_activity -static_probability 0.12 -toggle_rate 0.025 -base_clock ck {INCA INCB}
report_power -include_input_nets > report/report_power.txt
report_cell > report/report_cell.txt
change_selection -name __slctBus22 -type {cell design} _sel2183
analyze -format vhdl inccomp.vhd
elaborate inccomp -library work
uniquify
analyze -format vhdl inccomp.vhd
elaborate inccomp -library work -architecture behavioral
uniquify
compile -exact_map
create_clock -name ck -period 5 {ck}
report_power -include_input_nets > report/report_power.txt
report_power -net -include_input_nets > report/report_power_net.txt
set_switching_activity -static_probability 0.5 -toggle_rate 2 -base_clock ck {ck}
set_switching_activity -static_probability 0 -base_clock ck {rst}
report_power -include_input_nets > report/report_power.txt
set_switching_activity -static_probability 0.12 -toggle_rate 0.025 -base_clock ck {INCA INCB}
report_power -include_input_nets > report/report_power_realistic_inputs.txt
report_cell > report/report_cell.txt
remove_design -designs
analyze -format vhdl inccomp.vhd