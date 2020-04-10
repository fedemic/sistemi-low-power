gui_start
analyze -library WORK -format vhdl {/home/lp20.9/Desktop/low_power_2020/Lab_2/ese2/syn/dpadder.vhd /home/lp20.9/Desktop/low_power_2020/Lab_2/ese2/syn/fsm1.vhd /home/lp20.9/Desktop/low_power_2020/Lab_2/ese2/syn/FSM_Adder.vhd}
elaborate FSM_ADDER -architecture BEHAVIOR -library WORK
change_selection -name __slctBus18 -type {cell design} _sel426
create_clock -name "CLK" -period 10 {CLK}
report_clock
report_clock > report/report_clock.txt
gui_show_man_page report_clock
compile -exact_map
write -hierarchy -format ddc -output /home/lp20.9/Desktop/low_power_2020/Lab_2/ese2/syn/FSM_Adder_simple.ddc
write -hierarchy -format vhdl -output /home/lp20.9/Desktop/low_power_2020/Lab_2/ese2/syn/prova_vhdl.vhdl
write -format vhdl -output /home/lp20.9/Desktop/low_power_2020/Lab_2/ese2/syn/prova_vhdl.vhdl
report_area > report/report_area_simple.txt
report_fsm > report/report_fsm_simple.txt
report_fsm > report/report_fsm_simple.txt
current_design fsm1
report_fsm > report/report_fsm_simple.txt
current_design FSM_Adder
change_selection -name __slctBus226 -type {cell design} _sel1611
gui_show_man_page set_fsm_encoding_style
report_timing > report/report_timing_simple.txt
current_design fsm1
report_timing > report/report_timing_fsm_simple.txt
current_design FSM_Adder
report_timing-nworst 10 > report/report_timing_top_level_10_worst.txt
report_timing -nworst 10 > report/report_timing_top_level_10_worst.txt
report_power > report/report_power.txt
report_power -hier > report/report_power_hier.txt
report_power -net > report/report_power_net.txt
gui_show_man_page toggle rate
gui_show_man_page report_power
list_designs
current_instance fsm1
current_instance FSM_Adder/fsm1
current_instance FSM
report_power -net > report/report_power_net_FSM.txt
report_power -cell > report/report_power_cell_FSM.txt
create_clock -name "CLK" -period 0.23 {CLK}
gui_show_man_page create_clock
remove_clock
remove_clock -all
create_clock -name CLK -period 0.23 {CLK}
create_clock -name CLK -period 1 {CLK}
report_clock
create_clock -name "Clock" -period 0.23 {CLK}
create_clock -name "CLK" -period 10 {CLK}
current_instance
current_instance FSM_Adder
create_clock -name "CLK" -period 10 {CLK}
create_clock -name "CLK" -period 1 {CLK}
create_clock -name "CLK" -period 0.23 {CLK}
report_power > report/report_power.txt
create_clock -name "CLK" -period 10 {CLK}
set_max_dynamic_power 5
set_max_dynamic_power 5000
set_max_dynamic_power 5u
set_max_dynamic_power 5uW
set_max_dynamic_power 5000000
compile -exact_map
report_power > report/report_power.txt
set_max_dynamic_power 5500000
compile -exact_map
report_power > report/report_power.txt
set_max_dynamic_power 8000000
compile -exact_map
report_power > report/report_power.txt
report_constraints
set_max_dynamic_power 1000000
compile -exact_map
report_power > report/report_power.txt
report_constraints > report/report_constraints_1uW.txt
write -hierarchy -format ddc
write -format vhdl -output /home/lp20.9/Desktop/low_power_2020/Lab_2/ese2/syn/report/constraint__dyn_power/syn_vhdl.vhdl
write -hierarchy -format ddc