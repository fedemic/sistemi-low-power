-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 11.0 Build 208 07/03/2011 Service Pack 1 SJ Web Edition"

-- DATE "05/02/2019 17:02:11"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Artificial_Neuron IS
    PORT (
	DONE : OUT std_logic;
	OUTPUT : OUT std_logic_vector(10 DOWNTO 0);
	CLK : IN std_logic;
	START : IN std_logic;
	RST_N : IN std_logic;
	EXT_DATA : IN std_logic_vector(7 DOWNTO 0)
	);
END Artificial_Neuron;

-- Design Ports Information
-- DONE	=>  Location: PIN_K24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[0]	=>  Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[1]	=>  Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[2]	=>  Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[3]	=>  Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[4]	=>  Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[5]	=>  Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[6]	=>  Location: PIN_F17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[7]	=>  Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[8]	=>  Location: PIN_C24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[9]	=>  Location: PIN_J17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OUTPUT[10]	=>  Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLK	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RST_N	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- EXT_DATA[7]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- EXT_DATA[6]	=>  Location: PIN_K21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- EXT_DATA[5]	=>  Location: PIN_K19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- EXT_DATA[4]	=>  Location: PIN_K23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- EXT_DATA[3]	=>  Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- EXT_DATA[1]	=>  Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- EXT_DATA[2]	=>  Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- EXT_DATA[0]	=>  Location: PIN_L20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Artificial_Neuron IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_DONE : std_logic;
SIGNAL ww_OUTPUT : std_logic_vector(10 DOWNTO 0);
SIGNAL ww_CLK : std_logic;
SIGNAL ww_START : std_logic;
SIGNAL ww_RST_N : std_logic;
SIGNAL ww_EXT_DATA : std_logic_vector(7 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RST_N~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \P_S.LD_MEM_B_00~regout\ : std_logic;
SIGNAL \posit~0_combout\ : std_logic;
SIGNAL \N_S.LD_MEM_B_00~0_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[9]~0_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~0_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[9]~1_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[8]~3_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Reg_B|Q~3_combout\ : std_logic;
SIGNAL \Reg_C|Q~3_combout\ : std_logic;
SIGNAL \Reg_C|Q~5_combout\ : std_logic;
SIGNAL \Mem_A|memory~22_combout\ : std_logic;
SIGNAL \Mem_A|memory~26_combout\ : std_logic;
SIGNAL \Reg_Y|Q~24_combout\ : std_logic;
SIGNAL \Reg_Y|Q~28_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0_bypass[1]~feeder_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0_bypass[15]~feeder_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0_bypass[28]~feeder_combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \CLK~clkctrl_outclk\ : std_logic;
SIGNAL \START~combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \RST_N~combout\ : std_logic;
SIGNAL \RST_N~clkctrl_outclk\ : std_logic;
SIGNAL \P_S.RESET~regout\ : std_logic;
SIGNAL \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \P_S.WR_A~regout\ : std_logic;
SIGNAL \WideOr5~1_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \P_S.RD_A~regout\ : std_logic;
SIGNAL \P_S.LD_REG~feeder_combout\ : std_logic;
SIGNAL \P_S.LD_REG~regout\ : std_logic;
SIGNAL \P_S.ADD_Y_NUM2~regout\ : std_logic;
SIGNAL \P_S.SUB_Y_NUM3~regout\ : std_logic;
SIGNAL \P_S.ADD_Y_NUM1~regout\ : std_logic;
SIGNAL \P_S.SUB_Y_NUM4~regout\ : std_logic;
SIGNAL \sub_select~combout\ : std_logic;
SIGNAL \Reg_Y|Q[3]~16_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\ : std_logic;
SIGNAL \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~1_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\ : std_logic;
SIGNAL \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\ : std_logic;
SIGNAL \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\ : std_logic;
SIGNAL \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~1_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\ : std_logic;
SIGNAL \Mem_A|memory~24_combout\ : std_logic;
SIGNAL \Mem_A|memory~20_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0_bypass[11]~feeder_combout\ : std_logic;
SIGNAL \Mem_A|memory~21_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~feeder_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\ : std_logic;
SIGNAL \Mem_A|memory~19_combout\ : std_logic;
SIGNAL \Mem_A|memory~23_combout\ : std_logic;
SIGNAL \Mem_A|memory~25_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \Mem_A|memory~28_combout\ : std_logic;
SIGNAL \Reg_A|Q~2_combout\ : std_logic;
SIGNAL \Reg_C|Q[7]~0_combout\ : std_logic;
SIGNAL \Reg_B|Q~2_combout\ : std_logic;
SIGNAL \Reg_A|Q~0_combout\ : std_logic;
SIGNAL \Reg_B|Q~0_combout\ : std_logic;
SIGNAL \Reg_C|Q~1_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[7]~4_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0_bypass[24]~feeder_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \Mem_A|memory~30_combout\ : std_logic;
SIGNAL \Reg_A|Q~4_combout\ : std_logic;
SIGNAL \Reg_B|Q~4_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \Mem_A|memory~27_combout\ : std_logic;
SIGNAL \Reg_A|Q~1_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[5]~6_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[5]~7_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0_bypass[23]~feeder_combout\ : std_logic;
SIGNAL \Mem_A|memory~32_combout\ : std_logic;
SIGNAL \Reg_A|Q~6_combout\ : std_logic;
SIGNAL \Reg_B|Q~5_combout\ : std_logic;
SIGNAL \Reg_C|Q~4_combout\ : std_logic;
SIGNAL \Reg_B|Q~1_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[4]~8_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[4]~9_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0_bypass[22]~feeder_combout\ : std_logic;
SIGNAL \Mem_A|memory~31_combout\ : std_logic;
SIGNAL \Reg_A|Q~5_combout\ : std_logic;
SIGNAL \Reg_B|Q~6_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a4~portbdataout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0_bypass[25]~feeder_combout\ : std_logic;
SIGNAL \Mem_A|memory~29_combout\ : std_logic;
SIGNAL \Reg_A|Q~3_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[3]~10_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[3]~11_combout\ : std_logic;
SIGNAL \Reg_C|Q~8_combout\ : std_logic;
SIGNAL \Add_Sub_Y|inverting_inputs[1]~0_combout\ : std_logic;
SIGNAL \Add_Sub_Y|inverting_inputs[1]~1_combout\ : std_logic;
SIGNAL \Mem_A|memory_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \Mem_A|memory~33_combout\ : std_logic;
SIGNAL \Reg_A|Q~7_combout\ : std_logic;
SIGNAL \Reg_B|Q~7_combout\ : std_logic;
SIGNAL \Reg_C|Q~7_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[0]~15_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~1_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Reg_Y|Q~29_combout\ : std_logic;
SIGNAL \Reg_Y|Q[3]~18_combout\ : std_logic;
SIGNAL \Reg_Y|Q[3]~19_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[0]~14_combout\ : std_logic;
SIGNAL \Reg_Y|Q~21_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~0_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Reg_C|Q~6_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[2]~12_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[2]~13_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[8]~2_combout\ : std_logic;
SIGNAL \Reg_C|Q~2_combout\ : std_logic;
SIGNAL \Mux_Add_2|output[6]~5_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Reg_Y|Q~22_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Reg_Y|Q~20_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Reg_Y|Q~17_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Reg_Y|Q~27_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Reg_Y|Q~26_combout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Reg_Y|Q~25_combout\ : std_logic;
SIGNAL \posit~1_combout\ : std_logic;
SIGNAL \posit~2_combout\ : std_logic;
SIGNAL \posit~combout\ : std_logic;
SIGNAL \P_S.CHECK~feeder_combout\ : std_logic;
SIGNAL \P_S.CHECK~regout\ : std_logic;
SIGNAL \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Reg_Y|Q~23_combout\ : std_logic;
SIGNAL \ovf~0_combout\ : std_logic;
SIGNAL \N_S.LD_MEM_B_01~0_combout\ : std_logic;
SIGNAL \P_S.LD_MEM_B_01~regout\ : std_logic;
SIGNAL \N_S.LD_MEM_B_10~0_combout\ : std_logic;
SIGNAL \P_S.LD_MEM_B_10~regout\ : std_logic;
SIGNAL \N_S.LD_MEM_B_11~0_combout\ : std_logic;
SIGNAL \P_S.LD_MEM_B_11~regout\ : std_logic;
SIGNAL \WideOr5~0_combout\ : std_logic;
SIGNAL \WideOr6~combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~feeder_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\ : std_logic;
SIGNAL \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\ : std_logic;
SIGNAL \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~0_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~feeder_combout\ : std_logic;
SIGNAL \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ : std_logic;
SIGNAL \tc~1_combout\ : std_logic;
SIGNAL \tc~0_combout\ : std_logic;
SIGNAL \tc~2_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \P_S.DONE_STATE~regout\ : std_logic;
SIGNAL \Reg_Out|Q[0]~0_combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Reg_Out|Q[4]~1_combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\ : std_logic;
SIGNAL \Add_1|RC_Adder_Generation:10:Other_Adders_Generation:Other_Adders|s~combout\ : std_logic;
SIGNAL \EXT_DATA~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Reg_Y|Q\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Reg_A|Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Mem_A|DATA_OUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Counter|FF_toggles\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \Reg_Out|Q\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Reg_C|Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Reg_B|Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Mem_A|memory_rtl_0_bypass\ : std_logic_vector(0 TO 28);
SIGNAL \ALT_INV_P_S.RESET~regout\ : std_logic;
SIGNAL \ALT_INV_RST_N~clkctrl_outclk\ : std_logic;

BEGIN

DONE <= ww_DONE;
OUTPUT <= ww_OUTPUT;
ww_CLK <= CLK;
ww_START <= START;
ww_RST_N <= RST_N;
ww_EXT_DATA <= EXT_DATA;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\ <= (\EXT_DATA~combout\(7) & \EXT_DATA~combout\(6) & \EXT_DATA~combout\(5) & \EXT_DATA~combout\(4));

\Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\ & 
\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\ & 
\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\ & 
\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\);

\Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~1_combout\ & \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~0_combout\ & 
\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~0_combout\ & \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~1_combout\ & \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~0_combout\ & 
\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~0_combout\ & \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~0_combout\ & \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~0_combout\ & 
\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~0_combout\ & \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~0_combout\);

\Mem_A|memory_rtl_0|auto_generated|ram_block1a4~portbdataout\ <= \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);
\Mem_A|memory_rtl_0|auto_generated|ram_block1a5\ <= \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(1);
\Mem_A|memory_rtl_0|auto_generated|ram_block1a6\ <= \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(2);
\Mem_A|memory_rtl_0|auto_generated|ram_block1a7\ <= \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(3);

\Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (\EXT_DATA~combout\(3) & \EXT_DATA~combout\(2) & \EXT_DATA~combout\(1) & \EXT_DATA~combout\(0));

\Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\ & 
\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\ & 
\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\ & 
\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\);

\Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~1_combout\ & \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~0_combout\ & 
\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~0_combout\ & \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~1_combout\ & \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~0_combout\ & 
\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~0_combout\ & \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~0_combout\ & \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~0_combout\ & 
\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~0_combout\ & \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~0_combout\);

\Mem_A|memory_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\Mem_A|memory_rtl_0|auto_generated|ram_block1a1\ <= \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\Mem_A|memory_rtl_0|auto_generated|ram_block1a2\ <= \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\Mem_A|memory_rtl_0|auto_generated|ram_block1a3\ <= \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);

\CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK~combout\);

\RST_N~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \RST_N~combout\);
\ALT_INV_P_S.RESET~regout\ <= NOT \P_S.RESET~regout\;
\ALT_INV_RST_N~clkctrl_outclk\ <= NOT \RST_N~clkctrl_outclk\;

-- Location: M4K_X52_Y25
\Mem_A|memory_rtl_0|auto_generated|ram_block1a4\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "Generic_Memory:Mem_A|altsyncram:memory_rtl_0|altsyncram_utg1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 10,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 4,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 1023,
	port_b_logical_ram_depth => 1024,
	port_b_logical_ram_width => 8,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \P_S.WR_A~regout\,
	portbrewe => VCC,
	clk0 => \CLK~clkctrl_outclk\,
	portadatain => \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \Mem_A|memory_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

-- Location: LCFF_X51_Y25_N7
\P_S.LD_MEM_B_00\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \N_S.LD_MEM_B_00~0_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.LD_MEM_B_00~regout\);

-- Location: LCFF_X54_Y25_N1
\Reg_Y|Q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Y|Q~24_combout\,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(6));

-- Location: LCCOMB_X53_Y25_N24
\posit~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \posit~0_combout\ = (\Reg_Y|Q\(6)) # ((\Reg_Y|Q\(8)) # ((\Reg_Y|Q\(7)) # (\Reg_Y|Q\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(6),
	datab => \Reg_Y|Q\(8),
	datac => \Reg_Y|Q\(7),
	datad => \Reg_Y|Q\(9),
	combout => \posit~0_combout\);

-- Location: LCFF_X54_Y25_N13
\Reg_Y|Q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Y|Q~28_combout\,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(2));

-- Location: LCCOMB_X51_Y25_N6
\N_S.LD_MEM_B_00~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \N_S.LD_MEM_B_00~0_combout\ = (!\posit~combout\ & (\P_S.CHECK~regout\ & \ovf~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \posit~combout\,
	datac => \P_S.CHECK~regout\,
	datad => \ovf~0_combout\,
	combout => \N_S.LD_MEM_B_00~0_combout\);

-- Location: LCCOMB_X58_Y25_N0
\Mux_Add_2|output[9]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[9]~0_combout\ = (\sub_select~combout\ & (((!\Reg_Y|Q[3]~16_combout\ & \Reg_C|Q\(7))))) # (!\sub_select~combout\ & (\Reg_A|Q\(7) & (\Reg_Y|Q[3]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sub_select~combout\,
	datab => \Reg_A|Q\(7),
	datac => \Reg_Y|Q[3]~16_combout\,
	datad => \Reg_C|Q\(7),
	combout => \Mux_Add_2|output[9]~0_combout\);

-- Location: LCCOMB_X58_Y25_N14
\Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~0_combout\ = (\Mux_Add_2|output[9]~0_combout\ & (!\sub_select~combout\)) # (!\Mux_Add_2|output[9]~0_combout\ & ((\Reg_B|Q\(7) & ((!\Reg_Y|Q[3]~16_combout\))) # (!\Reg_B|Q\(7) & 
-- (\sub_select~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sub_select~combout\,
	datab => \Reg_B|Q\(7),
	datac => \Reg_Y|Q[3]~16_combout\,
	datad => \Mux_Add_2|output[9]~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~0_combout\);

-- Location: LCCOMB_X58_Y25_N28
\Mux_Add_2|output[9]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[9]~1_combout\ = (\Mux_Add_2|output[9]~0_combout\) # ((\Reg_B|Q\(7) & (\sub_select~combout\ $ (!\Reg_Y|Q[3]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sub_select~combout\,
	datab => \Reg_B|Q\(7),
	datac => \Reg_Y|Q[3]~16_combout\,
	datad => \Mux_Add_2|output[9]~0_combout\,
	combout => \Mux_Add_2|output[9]~1_combout\);

-- Location: LCCOMB_X57_Y25_N22
\Mux_Add_2|output[8]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[8]~3_combout\ = (\Mux_Add_2|output[8]~2_combout\ & (((\Reg_Y|Q[3]~16_combout\) # (\Reg_C|Q\(7))))) # (!\Mux_Add_2|output[8]~2_combout\ & (\Reg_B|Q\(6) & (!\Reg_Y|Q[3]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux_Add_2|output[8]~2_combout\,
	datab => \Reg_B|Q\(6),
	datac => \Reg_Y|Q[3]~16_combout\,
	datad => \Reg_C|Q\(7),
	combout => \Mux_Add_2|output[8]~3_combout\);

-- Location: LCFF_X56_Y25_N21
\Reg_B|Q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_B|Q~3_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_B|Q\(4));

-- Location: LCFF_X57_Y25_N29
\Reg_C|Q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_C|Q~3_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_C|Q\(5));

-- Location: LCFF_X56_Y25_N15
\Reg_C|Q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_C|Q~5_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_C|Q\(3));

-- Location: LCCOMB_X54_Y25_N16
\Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s~combout\ = \sub_select~combout\ $ (\Reg_Y|Q\(6) $ (\Mux_Add_2|output[6]~5_combout\ $ (\Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sub_select~combout\,
	datab => \Reg_Y|Q\(6),
	datac => \Mux_Add_2|output[6]~5_combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCCOMB_X58_Y25_N6
\Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s~combout\ = \sub_select~combout\ $ (\Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|c_out~0_combout\ $ (\Reg_Y|Q\(2) $ (\Mux_Add_2|output[2]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sub_select~combout\,
	datab => \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datac => \Reg_Y|Q\(2),
	datad => \Mux_Add_2|output[2]~13_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X53_Y25_N27
\Mem_A|DATA_OUT[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory~26_combout\,
	ena => \P_S.RD_A~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|DATA_OUT\(7));

-- Location: LCCOMB_X56_Y25_N20
\Reg_B|Q~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_B|Q~3_combout\ = (\P_S.RESET~regout\ & \Reg_A|Q\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_A|Q\(4),
	combout => \Reg_B|Q~3_combout\);

-- Location: LCCOMB_X57_Y25_N28
\Reg_C|Q~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_C|Q~3_combout\ = (\Reg_B|Q\(5) & \P_S.RESET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reg_B|Q\(5),
	datac => \P_S.RESET~regout\,
	combout => \Reg_C|Q~3_combout\);

-- Location: LCCOMB_X56_Y25_N14
\Reg_C|Q~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_C|Q~5_combout\ = (\P_S.RESET~regout\ & \Reg_B|Q\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_B|Q\(3),
	combout => \Reg_C|Q~5_combout\);

-- Location: LCFF_X53_Y25_N5
\Mem_A|memory_rtl_0_bypass[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory_rtl_0_bypass[28]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(28));

-- Location: LCFF_X53_Y24_N13
\Mem_A|memory_rtl_0_bypass[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory_rtl_0_bypass[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(1));

-- Location: LCFF_X53_Y24_N3
\Mem_A|memory_rtl_0_bypass[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory_rtl_0_bypass[15]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(15));

-- Location: LCFF_X53_Y24_N25
\Mem_A|memory_rtl_0_bypass[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(13));

-- Location: LCCOMB_X53_Y24_N24
\Mem_A|memory~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~22_combout\ = (\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\ & (\Mem_A|memory_rtl_0_bypass\(15) & (\Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\ $ (!\Mem_A|memory_rtl_0_bypass\(13))))) # 
-- (!\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\ & (!\Mem_A|memory_rtl_0_bypass\(15) & (\Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\ $ (!\Mem_A|memory_rtl_0_bypass\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Mem_A|memory_rtl_0_bypass\(13),
	datad => \Mem_A|memory_rtl_0_bypass\(15),
	combout => \Mem_A|memory~22_combout\);

-- Location: LCCOMB_X53_Y25_N26
\Mem_A|memory~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~26_combout\ = (\Mem_A|memory~25_combout\ & (\Mem_A|memory_rtl_0_bypass\(28))) # (!\Mem_A|memory~25_combout\ & ((\Mem_A|memory_rtl_0|auto_generated|ram_block1a7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mem_A|memory~25_combout\,
	datac => \Mem_A|memory_rtl_0_bypass\(28),
	datad => \Mem_A|memory_rtl_0|auto_generated|ram_block1a7\,
	combout => \Mem_A|memory~26_combout\);

-- Location: LCCOMB_X54_Y25_N0
\Reg_Y|Q~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~24_combout\ = (\P_S.RESET~regout\ & (\WideOr5~0_combout\ & \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.RESET~regout\,
	datab => \WideOr5~0_combout\,
	datac => \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s~combout\,
	combout => \Reg_Y|Q~24_combout\);

-- Location: LCCOMB_X54_Y25_N12
\Reg_Y|Q~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~28_combout\ = (\P_S.RESET~regout\ & (\WideOr5~0_combout\ & \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.RESET~regout\,
	datab => \WideOr5~0_combout\,
	datac => \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s~combout\,
	combout => \Reg_Y|Q~28_combout\);

-- Location: LCCOMB_X53_Y24_N12
\Mem_A|memory_rtl_0_bypass[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory_rtl_0_bypass[1]~feeder_combout\ = \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\,
	combout => \Mem_A|memory_rtl_0_bypass[1]~feeder_combout\);

-- Location: LCCOMB_X53_Y24_N2
\Mem_A|memory_rtl_0_bypass[15]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory_rtl_0_bypass[15]~feeder_combout\ = \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\,
	combout => \Mem_A|memory_rtl_0_bypass[15]~feeder_combout\);

-- Location: LCCOMB_X53_Y25_N4
\Mem_A|memory_rtl_0_bypass[28]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory_rtl_0_bypass[28]~feeder_combout\ = \EXT_DATA~combout\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \EXT_DATA~combout\(7),
	combout => \Mem_A|memory_rtl_0_bypass[28]~feeder_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: CLKCTRL_G3
\CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~clkctrl_outclk\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\START~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_START,
	combout => \START~combout\);

-- Location: LCCOMB_X51_Y25_N24
\Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\START~combout\) # ((!\P_S.DONE_STATE~regout\ & \P_S.RESET~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.DONE_STATE~regout\,
	datab => \START~combout\,
	datac => \P_S.RESET~regout\,
	combout => \Selector0~0_combout\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RST_N~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_RST_N,
	combout => \RST_N~combout\);

-- Location: CLKCTRL_G1
\RST_N~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RST_N~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RST_N~clkctrl_outclk\);

-- Location: LCFF_X51_Y25_N25
\P_S.RESET\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector0~0_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.RESET~regout\);

-- Location: LCCOMB_X51_Y24_N16
\Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~0_combout\ = (\P_S.RESET~regout\ & (\Counter|FF_toggles\(2) $ (\Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|FF_toggles\(2),
	datab => \P_S.RESET~regout\,
	datac => \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\,
	combout => \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~0_combout\);

-- Location: LCFF_X51_Y24_N25
\Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\);

-- Location: LCCOMB_X51_Y25_N18
\Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\P_S.RESET~regout\ & (((\P_S.WR_A~regout\ & !\tc~2_combout\)))) # (!\P_S.RESET~regout\ & ((\START~combout\) # ((\P_S.WR_A~regout\ & !\tc~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.RESET~regout\,
	datab => \START~combout\,
	datac => \P_S.WR_A~regout\,
	datad => \tc~2_combout\,
	combout => \Selector1~0_combout\);

-- Location: LCFF_X51_Y25_N19
\P_S.WR_A\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector1~0_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.WR_A~regout\);

-- Location: LCCOMB_X51_Y25_N26
\WideOr5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \WideOr5~1_combout\ = (\P_S.RESET~regout\ & \WideOr5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \WideOr5~0_combout\,
	combout => \WideOr5~1_combout\);

-- Location: LCCOMB_X53_Y25_N6
\Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\tc~2_combout\ & ((\P_S.WR_A~regout\))) # (!\tc~2_combout\ & (!\WideOr5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr5~0_combout\,
	datab => \P_S.WR_A~regout\,
	datac => \tc~2_combout\,
	combout => \Selector2~0_combout\);

-- Location: LCFF_X53_Y25_N7
\P_S.RD_A\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector2~0_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.RD_A~regout\);

-- Location: LCCOMB_X54_Y24_N16
\P_S.LD_REG~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \P_S.LD_REG~feeder_combout\ = \P_S.RD_A~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \P_S.RD_A~regout\,
	combout => \P_S.LD_REG~feeder_combout\);

-- Location: LCFF_X54_Y24_N17
\P_S.LD_REG\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \P_S.LD_REG~feeder_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.LD_REG~regout\);

-- Location: LCFF_X56_Y25_N19
\P_S.ADD_Y_NUM2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \P_S.LD_REG~regout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.ADD_Y_NUM2~regout\);

-- Location: LCFF_X56_Y25_N7
\P_S.SUB_Y_NUM3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \P_S.ADD_Y_NUM2~regout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.SUB_Y_NUM3~regout\);

-- Location: LCFF_X57_Y25_N15
\P_S.ADD_Y_NUM1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \P_S.SUB_Y_NUM3~regout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.ADD_Y_NUM1~regout\);

-- Location: LCFF_X56_Y25_N3
\P_S.SUB_Y_NUM4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \P_S.ADD_Y_NUM1~regout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.SUB_Y_NUM4~regout\);

-- Location: LCCOMB_X56_Y25_N6
sub_select : cycloneii_lcell_comb
-- Equation(s):
-- \sub_select~combout\ = (\P_S.SUB_Y_NUM3~regout\) # (\P_S.SUB_Y_NUM4~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.SUB_Y_NUM3~regout\,
	datad => \P_S.SUB_Y_NUM4~regout\,
	combout => \sub_select~combout\);

-- Location: LCCOMB_X56_Y25_N18
\Reg_Y|Q[3]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q[3]~16_combout\ = (!\P_S.ADD_Y_NUM2~regout\ & !\P_S.SUB_Y_NUM4~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.ADD_Y_NUM2~regout\,
	datad => \P_S.SUB_Y_NUM4~regout\,
	combout => \Reg_Y|Q[3]~16_combout\);

-- Location: LCCOMB_X51_Y24_N10
\Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~0_combout\ = (\P_S.RESET~regout\ & (\Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\ $ (((\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ & 
-- \Counter|FF_toggles\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \P_S.RESET~regout\,
	datac => \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|FF_toggles\(4),
	combout => \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~0_combout\);

-- Location: LCFF_X51_Y24_N11
\Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\);

-- Location: LCCOMB_X51_Y24_N4
\Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~0_combout\ = \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\ $ (((\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ & 
-- (\Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|FF_toggles\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|FF_toggles\(4),
	combout => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~0_combout\);

-- Location: LCCOMB_X51_Y24_N0
\Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~1_combout\ = (\P_S.RESET~regout\ & \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \P_S.RESET~regout\,
	datac => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~0_combout\,
	combout => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~1_combout\);

-- Location: LCFF_X51_Y24_N1
\Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\);

-- Location: LCCOMB_X51_Y24_N22
\Counter|FF_toggles[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|FF_toggles\(7) = (\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ & (\Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\ & (\Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\ & 
-- \Counter|FF_toggles\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|FF_toggles\(4),
	combout => \Counter|FF_toggles\(7));

-- Location: LCCOMB_X51_Y24_N18
\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~0_combout\ = (\P_S.RESET~regout\ & (\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\ $ (\Counter|FF_toggles\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \P_S.RESET~regout\,
	datac => \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|FF_toggles\(7),
	combout => \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~0_combout\);

-- Location: LCFF_X51_Y24_N19
\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\);

-- Location: LCCOMB_X51_Y24_N8
\Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~0_combout\ = (\P_S.RESET~regout\ & (\Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\ $ (((\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\ & 
-- \Counter|FF_toggles\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.RESET~regout\,
	datab => \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|FF_toggles\(7),
	combout => \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~0_combout\);

-- Location: LCFF_X51_Y24_N9
\Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\);

-- Location: LCCOMB_X51_Y24_N28
\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~0_combout\ = \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\ $ (((\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\ & 
-- (\Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|FF_toggles\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|FF_toggles\(7),
	combout => \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~0_combout\);

-- Location: LCCOMB_X51_Y24_N6
\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~1_combout\ = (\P_S.RESET~regout\ & \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \P_S.RESET~regout\,
	datad => \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~0_combout\,
	combout => \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~1_combout\);

-- Location: LCFF_X51_Y24_N7
\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\);

-- Location: LCFF_X53_Y24_N29
\Mem_A|memory_rtl_0_bypass[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(17));

-- Location: LCFF_X53_Y24_N27
\Mem_A|memory_rtl_0_bypass[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(19));

-- Location: LCCOMB_X53_Y24_N28
\Mem_A|memory~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~24_combout\ = (\Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\ & (\Mem_A|memory_rtl_0_bypass\(17) & (\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\ $ (!\Mem_A|memory_rtl_0_bypass\(19))))) # 
-- (!\Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\ & (!\Mem_A|memory_rtl_0_bypass\(17) & (\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\ $ (!\Mem_A|memory_rtl_0_bypass\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Mem_A|memory_rtl_0_bypass\(17),
	datad => \Mem_A|memory_rtl_0_bypass\(19),
	combout => \Mem_A|memory~24_combout\);

-- Location: LCFF_X53_Y24_N1
\Mem_A|memory_rtl_0_bypass[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \P_S.WR_A~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(0));

-- Location: LCFF_X53_Y24_N9
\Mem_A|memory_rtl_0_bypass[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(5));

-- Location: LCFF_X53_Y24_N7
\Mem_A|memory_rtl_0_bypass[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(7));

-- Location: LCCOMB_X53_Y24_N8
\Mem_A|memory~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~20_combout\ = (\Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\ & (\Mem_A|memory_rtl_0_bypass\(5) & (\Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\ $ (!\Mem_A|memory_rtl_0_bypass\(7))))) # 
-- (!\Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\ & (!\Mem_A|memory_rtl_0_bypass\(5) & (\Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\ $ (!\Mem_A|memory_rtl_0_bypass\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Mem_A|memory_rtl_0_bypass\(5),
	datad => \Mem_A|memory_rtl_0_bypass\(7),
	combout => \Mem_A|memory~20_combout\);

-- Location: LCCOMB_X53_Y24_N18
\Mem_A|memory_rtl_0_bypass[11]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory_rtl_0_bypass[11]~feeder_combout\ = \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\,
	combout => \Mem_A|memory_rtl_0_bypass[11]~feeder_combout\);

-- Location: LCFF_X53_Y24_N19
\Mem_A|memory_rtl_0_bypass[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory_rtl_0_bypass[11]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(11));

-- Location: LCFF_X53_Y24_N21
\Mem_A|memory_rtl_0_bypass[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(9));

-- Location: LCCOMB_X53_Y24_N20
\Mem_A|memory~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~21_combout\ = (\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ & (\Mem_A|memory_rtl_0_bypass\(9) & (\Mem_A|memory_rtl_0_bypass\(11) $ (!\Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\)))) # 
-- (!\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ & (!\Mem_A|memory_rtl_0_bypass\(9) & (\Mem_A|memory_rtl_0_bypass\(11) $ (!\Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \Mem_A|memory_rtl_0_bypass\(11),
	datac => \Mem_A|memory_rtl_0_bypass\(9),
	datad => \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\,
	combout => \Mem_A|memory~21_combout\);

-- Location: LCCOMB_X51_Y25_N0
\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~0_combout\ = (\P_S.RESET~regout\ & (\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\ $ (((\Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\ & 
-- \WideOr6~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.RESET~regout\,
	datab => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\,
	datac => \WideOr6~combout\,
	datad => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\,
	combout => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~0_combout\);

-- Location: LCCOMB_X51_Y25_N28
\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~feeder_combout\ = \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~0_combout\,
	combout => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~feeder_combout\);

-- Location: LCFF_X51_Y25_N29
\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\);

-- Location: LCFF_X53_Y24_N11
\Mem_A|memory_rtl_0_bypass[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(3));

-- Location: LCCOMB_X53_Y24_N10
\Mem_A|memory~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~19_combout\ = (\Mem_A|memory_rtl_0_bypass\(1) & (\Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\ & (\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\ $ (!\Mem_A|memory_rtl_0_bypass\(3))))) # 
-- (!\Mem_A|memory_rtl_0_bypass\(1) & (!\Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\ & (\Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\ $ (!\Mem_A|memory_rtl_0_bypass\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mem_A|memory_rtl_0_bypass\(1),
	datab => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Mem_A|memory_rtl_0_bypass\(3),
	datad => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\,
	combout => \Mem_A|memory~19_combout\);

-- Location: LCCOMB_X53_Y24_N30
\Mem_A|memory~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~23_combout\ = (\Mem_A|memory~22_combout\ & (\Mem_A|memory~20_combout\ & (\Mem_A|memory~21_combout\ & \Mem_A|memory~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mem_A|memory~22_combout\,
	datab => \Mem_A|memory~20_combout\,
	datac => \Mem_A|memory~21_combout\,
	datad => \Mem_A|memory~19_combout\,
	combout => \Mem_A|memory~23_combout\);

-- Location: LCCOMB_X53_Y24_N0
\Mem_A|memory~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~25_combout\ = (\Mem_A|memory~24_combout\ & (\Mem_A|memory_rtl_0_bypass\(0) & \Mem_A|memory~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mem_A|memory~24_combout\,
	datac => \Mem_A|memory_rtl_0_bypass\(0),
	datad => \Mem_A|memory~23_combout\,
	combout => \Mem_A|memory~25_combout\);

-- Location: PIN_K19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\EXT_DATA[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_EXT_DATA(5),
	combout => \EXT_DATA~combout\(5));

-- Location: LCFF_X53_Y25_N17
\Mem_A|memory_rtl_0_bypass[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \EXT_DATA~combout\(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(26));

-- Location: PIN_K23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\EXT_DATA[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_EXT_DATA(4),
	combout => \EXT_DATA~combout\(4));

-- Location: PIN_K21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\EXT_DATA[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_EXT_DATA(6),
	combout => \EXT_DATA~combout\(6));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\EXT_DATA[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_EXT_DATA(7),
	combout => \EXT_DATA~combout\(7));

-- Location: LCCOMB_X53_Y25_N10
\Mem_A|memory~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~28_combout\ = (\Mem_A|memory~25_combout\ & (\Mem_A|memory_rtl_0_bypass\(26))) # (!\Mem_A|memory~25_combout\ & ((\Mem_A|memory_rtl_0|auto_generated|ram_block1a5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mem_A|memory~25_combout\,
	datac => \Mem_A|memory_rtl_0_bypass\(26),
	datad => \Mem_A|memory_rtl_0|auto_generated|ram_block1a5\,
	combout => \Mem_A|memory~28_combout\);

-- Location: LCFF_X53_Y25_N11
\Mem_A|DATA_OUT[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory~28_combout\,
	ena => \P_S.RD_A~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|DATA_OUT\(5));

-- Location: LCCOMB_X57_Y25_N6
\Reg_A|Q~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_A|Q~2_combout\ = (\P_S.RESET~regout\ & \Mem_A|DATA_OUT\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Mem_A|DATA_OUT\(5),
	combout => \Reg_A|Q~2_combout\);

-- Location: LCCOMB_X55_Y24_N26
\Reg_C|Q[7]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_C|Q[7]~0_combout\ = (\P_S.LD_REG~regout\) # (!\P_S.RESET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \P_S.LD_REG~regout\,
	combout => \Reg_C|Q[7]~0_combout\);

-- Location: LCFF_X57_Y25_N7
\Reg_A|Q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_A|Q~2_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_A|Q\(5));

-- Location: LCCOMB_X57_Y25_N4
\Reg_B|Q~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_B|Q~2_combout\ = (\P_S.RESET~regout\ & \Reg_A|Q\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_A|Q\(5),
	combout => \Reg_B|Q~2_combout\);

-- Location: LCFF_X57_Y25_N5
\Reg_B|Q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_B|Q~2_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_B|Q\(5));

-- Location: LCCOMB_X57_Y25_N24
\Reg_A|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_A|Q~0_combout\ = (\Mem_A|DATA_OUT\(7) & \P_S.RESET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mem_A|DATA_OUT\(7),
	datac => \P_S.RESET~regout\,
	combout => \Reg_A|Q~0_combout\);

-- Location: LCFF_X57_Y25_N25
\Reg_A|Q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_A|Q~0_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_A|Q\(7));

-- Location: LCCOMB_X58_Y25_N4
\Reg_B|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_B|Q~0_combout\ = (\P_S.RESET~regout\ & \Reg_A|Q\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_A|Q\(7),
	combout => \Reg_B|Q~0_combout\);

-- Location: LCFF_X58_Y25_N5
\Reg_B|Q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_B|Q~0_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_B|Q\(7));

-- Location: LCCOMB_X58_Y25_N30
\Reg_C|Q~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_C|Q~1_combout\ = (\Reg_B|Q\(7) & \P_S.RESET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reg_B|Q\(7),
	datac => \P_S.RESET~regout\,
	combout => \Reg_C|Q~1_combout\);

-- Location: LCFF_X58_Y25_N31
\Reg_C|Q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_C|Q~1_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_C|Q\(7));

-- Location: LCCOMB_X57_Y25_N26
\Mux_Add_2|output[7]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[7]~4_combout\ = (\Mux_Add_2|output[8]~2_combout\ & ((\Reg_Y|Q[3]~16_combout\) # ((\Reg_C|Q\(7))))) # (!\Mux_Add_2|output[8]~2_combout\ & (!\Reg_Y|Q[3]~16_combout\ & (\Reg_B|Q\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux_Add_2|output[8]~2_combout\,
	datab => \Reg_Y|Q[3]~16_combout\,
	datac => \Reg_B|Q\(5),
	datad => \Reg_C|Q\(7),
	combout => \Mux_Add_2|output[7]~4_combout\);

-- Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\EXT_DATA[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_EXT_DATA(3),
	combout => \EXT_DATA~combout\(3));

-- Location: LCCOMB_X53_Y24_N22
\Mem_A|memory_rtl_0_bypass[24]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory_rtl_0_bypass[24]~feeder_combout\ = \EXT_DATA~combout\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \EXT_DATA~combout\(3),
	combout => \Mem_A|memory_rtl_0_bypass[24]~feeder_combout\);

-- Location: LCFF_X53_Y24_N23
\Mem_A|memory_rtl_0_bypass[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory_rtl_0_bypass[24]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(24));

-- Location: PIN_L20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\EXT_DATA[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_EXT_DATA(0),
	combout => \EXT_DATA~combout\(0));

-- Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\EXT_DATA[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_EXT_DATA(1),
	combout => \EXT_DATA~combout\(1));

-- Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\EXT_DATA[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_EXT_DATA(2),
	combout => \EXT_DATA~combout\(2));

-- Location: M4K_X52_Y24
\Mem_A|memory_rtl_0|auto_generated|ram_block1a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "Generic_Memory:Mem_A|altsyncram:memory_rtl_0|altsyncram_utg1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 10,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 4,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 1023,
	port_b_logical_ram_depth => 1024,
	port_b_logical_ram_width => 8,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \P_S.WR_A~regout\,
	portbrewe => VCC,
	clk0 => \CLK~clkctrl_outclk\,
	portadatain => \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \Mem_A|memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X53_Y24_N4
\Mem_A|memory~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~30_combout\ = (\Mem_A|memory~25_combout\ & (\Mem_A|memory_rtl_0_bypass\(24))) # (!\Mem_A|memory~25_combout\ & ((\Mem_A|memory_rtl_0|auto_generated|ram_block1a3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mem_A|memory_rtl_0_bypass\(24),
	datac => \Mem_A|memory~25_combout\,
	datad => \Mem_A|memory_rtl_0|auto_generated|ram_block1a3\,
	combout => \Mem_A|memory~30_combout\);

-- Location: LCFF_X53_Y24_N5
\Mem_A|DATA_OUT[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory~30_combout\,
	ena => \P_S.RD_A~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|DATA_OUT\(3));

-- Location: LCCOMB_X56_Y25_N8
\Reg_A|Q~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_A|Q~4_combout\ = (\P_S.RESET~regout\ & \Mem_A|DATA_OUT\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Mem_A|DATA_OUT\(3),
	combout => \Reg_A|Q~4_combout\);

-- Location: LCFF_X56_Y25_N9
\Reg_A|Q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_A|Q~4_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_A|Q\(3));

-- Location: LCCOMB_X57_Y25_N16
\Reg_B|Q~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_B|Q~4_combout\ = (\P_S.RESET~regout\ & \Reg_A|Q\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_A|Q\(3),
	combout => \Reg_B|Q~4_combout\);

-- Location: LCFF_X56_Y25_N17
\Reg_B|Q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_B|Q~4_combout\,
	sload => VCC,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_B|Q\(3));

-- Location: LCFF_X53_Y25_N15
\Mem_A|memory_rtl_0_bypass[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \EXT_DATA~combout\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(27));

-- Location: LCCOMB_X53_Y25_N8
\Mem_A|memory~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~27_combout\ = (\Mem_A|memory~25_combout\ & (\Mem_A|memory_rtl_0_bypass\(27))) # (!\Mem_A|memory~25_combout\ & ((\Mem_A|memory_rtl_0|auto_generated|ram_block1a6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mem_A|memory~25_combout\,
	datac => \Mem_A|memory_rtl_0_bypass\(27),
	datad => \Mem_A|memory_rtl_0|auto_generated|ram_block1a6\,
	combout => \Mem_A|memory~27_combout\);

-- Location: LCFF_X53_Y25_N9
\Mem_A|DATA_OUT[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory~27_combout\,
	ena => \P_S.RD_A~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|DATA_OUT\(6));

-- Location: LCCOMB_X57_Y25_N8
\Reg_A|Q~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_A|Q~1_combout\ = (\P_S.RESET~regout\ & \Mem_A|DATA_OUT\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Mem_A|DATA_OUT\(6),
	combout => \Reg_A|Q~1_combout\);

-- Location: LCFF_X57_Y25_N9
\Reg_A|Q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_A|Q~1_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_A|Q\(6));

-- Location: LCCOMB_X57_Y25_N18
\Mux_Add_2|output[5]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[5]~6_combout\ = (\Reg_Y|Q[3]~16_combout\ & ((\sub_select~combout\ & (\Reg_B|Q\(7))) # (!\sub_select~combout\ & ((\Reg_A|Q\(6)))))) # (!\Reg_Y|Q[3]~16_combout\ & (((\sub_select~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(7),
	datab => \Reg_A|Q\(6),
	datac => \Reg_Y|Q[3]~16_combout\,
	datad => \sub_select~combout\,
	combout => \Mux_Add_2|output[5]~6_combout\);

-- Location: LCCOMB_X56_Y25_N16
\Mux_Add_2|output[5]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[5]~7_combout\ = (\Reg_Y|Q[3]~16_combout\ & (((\Mux_Add_2|output[5]~6_combout\)))) # (!\Reg_Y|Q[3]~16_combout\ & ((\Mux_Add_2|output[5]~6_combout\ & (\Reg_C|Q\(5))) # (!\Mux_Add_2|output[5]~6_combout\ & ((\Reg_B|Q\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_C|Q\(5),
	datab => \Reg_Y|Q[3]~16_combout\,
	datac => \Reg_B|Q\(3),
	datad => \Mux_Add_2|output[5]~6_combout\,
	combout => \Mux_Add_2|output[5]~7_combout\);

-- Location: LCCOMB_X53_Y24_N14
\Mem_A|memory_rtl_0_bypass[23]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory_rtl_0_bypass[23]~feeder_combout\ = \EXT_DATA~combout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \EXT_DATA~combout\(2),
	combout => \Mem_A|memory_rtl_0_bypass[23]~feeder_combout\);

-- Location: LCFF_X53_Y24_N15
\Mem_A|memory_rtl_0_bypass[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory_rtl_0_bypass[23]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(23));

-- Location: LCCOMB_X54_Y24_N10
\Mem_A|memory~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~32_combout\ = (\Mem_A|memory~25_combout\ & ((\Mem_A|memory_rtl_0_bypass\(23)))) # (!\Mem_A|memory~25_combout\ & (\Mem_A|memory_rtl_0|auto_generated|ram_block1a2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mem_A|memory~25_combout\,
	datac => \Mem_A|memory_rtl_0|auto_generated|ram_block1a2\,
	datad => \Mem_A|memory_rtl_0_bypass\(23),
	combout => \Mem_A|memory~32_combout\);

-- Location: LCFF_X54_Y24_N11
\Mem_A|DATA_OUT[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory~32_combout\,
	ena => \P_S.RD_A~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|DATA_OUT\(2));

-- Location: LCCOMB_X55_Y24_N4
\Reg_A|Q~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_A|Q~6_combout\ = (\P_S.RESET~regout\ & \Mem_A|DATA_OUT\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Mem_A|DATA_OUT\(2),
	combout => \Reg_A|Q~6_combout\);

-- Location: LCFF_X55_Y25_N5
\Reg_A|Q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_A|Q~6_combout\,
	sload => VCC,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_A|Q\(2));

-- Location: LCCOMB_X56_Y25_N28
\Reg_B|Q~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_B|Q~5_combout\ = (\P_S.RESET~regout\ & \Reg_A|Q\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_A|Q\(2),
	combout => \Reg_B|Q~5_combout\);

-- Location: LCFF_X56_Y25_N29
\Reg_B|Q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_B|Q~5_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_B|Q\(2));

-- Location: LCCOMB_X57_Y25_N12
\Reg_C|Q~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_C|Q~4_combout\ = (\Reg_B|Q\(4) & \P_S.RESET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(4),
	datac => \P_S.RESET~regout\,
	combout => \Reg_C|Q~4_combout\);

-- Location: LCFF_X57_Y25_N13
\Reg_C|Q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_C|Q~4_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_C|Q\(4));

-- Location: LCCOMB_X57_Y25_N30
\Reg_B|Q~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_B|Q~1_combout\ = (\Reg_A|Q\(6) & \P_S.RESET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reg_A|Q\(6),
	datac => \P_S.RESET~regout\,
	combout => \Reg_B|Q~1_combout\);

-- Location: LCFF_X57_Y25_N31
\Reg_B|Q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_B|Q~1_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_B|Q\(6));

-- Location: LCCOMB_X56_Y25_N24
\Mux_Add_2|output[4]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[4]~8_combout\ = (\sub_select~combout\ & (((\Reg_B|Q\(6)) # (!\Reg_Y|Q[3]~16_combout\)))) # (!\sub_select~combout\ & (\Reg_A|Q\(5) & ((\Reg_Y|Q[3]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_A|Q\(5),
	datab => \Reg_B|Q\(6),
	datac => \sub_select~combout\,
	datad => \Reg_Y|Q[3]~16_combout\,
	combout => \Mux_Add_2|output[4]~8_combout\);

-- Location: LCCOMB_X56_Y25_N0
\Mux_Add_2|output[4]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[4]~9_combout\ = (\Reg_Y|Q[3]~16_combout\ & (((\Mux_Add_2|output[4]~8_combout\)))) # (!\Reg_Y|Q[3]~16_combout\ & ((\Mux_Add_2|output[4]~8_combout\ & ((\Reg_C|Q\(4)))) # (!\Mux_Add_2|output[4]~8_combout\ & (\Reg_B|Q\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q[3]~16_combout\,
	datab => \Reg_B|Q\(2),
	datac => \Reg_C|Q\(4),
	datad => \Mux_Add_2|output[4]~8_combout\,
	combout => \Mux_Add_2|output[4]~9_combout\);

-- Location: LCCOMB_X53_Y24_N16
\Mem_A|memory_rtl_0_bypass[22]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory_rtl_0_bypass[22]~feeder_combout\ = \EXT_DATA~combout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \EXT_DATA~combout\(1),
	combout => \Mem_A|memory_rtl_0_bypass[22]~feeder_combout\);

-- Location: LCFF_X53_Y24_N17
\Mem_A|memory_rtl_0_bypass[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory_rtl_0_bypass[22]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(22));

-- Location: LCCOMB_X54_Y24_N12
\Mem_A|memory~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~31_combout\ = (\Mem_A|memory~25_combout\ & ((\Mem_A|memory_rtl_0_bypass\(22)))) # (!\Mem_A|memory~25_combout\ & (\Mem_A|memory_rtl_0|auto_generated|ram_block1a1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mem_A|memory~25_combout\,
	datac => \Mem_A|memory_rtl_0|auto_generated|ram_block1a1\,
	datad => \Mem_A|memory_rtl_0_bypass\(22),
	combout => \Mem_A|memory~31_combout\);

-- Location: LCFF_X54_Y24_N13
\Mem_A|DATA_OUT[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory~31_combout\,
	ena => \P_S.RD_A~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|DATA_OUT\(1));

-- Location: LCCOMB_X55_Y24_N20
\Reg_A|Q~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_A|Q~5_combout\ = (\P_S.RESET~regout\ & \Mem_A|DATA_OUT\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Mem_A|DATA_OUT\(1),
	combout => \Reg_A|Q~5_combout\);

-- Location: LCFF_X55_Y25_N13
\Reg_A|Q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_A|Q~5_combout\,
	sload => VCC,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_A|Q\(1));

-- Location: LCCOMB_X53_Y25_N28
\Reg_B|Q~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_B|Q~6_combout\ = (\P_S.RESET~regout\ & \Reg_A|Q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \P_S.RESET~regout\,
	datad => \Reg_A|Q\(1),
	combout => \Reg_B|Q~6_combout\);

-- Location: LCFF_X56_Y25_N11
\Reg_B|Q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_B|Q~6_combout\,
	sload => VCC,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_B|Q\(1));

-- Location: LCCOMB_X54_Y24_N0
\Mem_A|memory_rtl_0_bypass[25]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory_rtl_0_bypass[25]~feeder_combout\ = \EXT_DATA~combout\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \EXT_DATA~combout\(4),
	combout => \Mem_A|memory_rtl_0_bypass[25]~feeder_combout\);

-- Location: LCFF_X54_Y24_N1
\Mem_A|memory_rtl_0_bypass[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory_rtl_0_bypass[25]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(25));

-- Location: LCCOMB_X54_Y24_N14
\Mem_A|memory~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~29_combout\ = (\Mem_A|memory~25_combout\ & ((\Mem_A|memory_rtl_0_bypass\(25)))) # (!\Mem_A|memory~25_combout\ & (\Mem_A|memory_rtl_0|auto_generated|ram_block1a4~portbdataout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mem_A|memory~25_combout\,
	datac => \Mem_A|memory_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	datad => \Mem_A|memory_rtl_0_bypass\(25),
	combout => \Mem_A|memory~29_combout\);

-- Location: LCFF_X54_Y24_N15
\Mem_A|DATA_OUT[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory~29_combout\,
	ena => \P_S.RD_A~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|DATA_OUT\(4));

-- Location: LCCOMB_X55_Y24_N16
\Reg_A|Q~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_A|Q~3_combout\ = (\P_S.RESET~regout\ & \Mem_A|DATA_OUT\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Mem_A|DATA_OUT\(4),
	combout => \Reg_A|Q~3_combout\);

-- Location: LCFF_X56_Y25_N23
\Reg_A|Q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_A|Q~3_combout\,
	sload => VCC,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_A|Q\(4));

-- Location: LCCOMB_X56_Y25_N22
\Mux_Add_2|output[3]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[3]~10_combout\ = (\sub_select~combout\ & ((\Reg_B|Q\(5)) # ((!\Reg_Y|Q[3]~16_combout\)))) # (!\sub_select~combout\ & (((\Reg_A|Q\(4) & \Reg_Y|Q[3]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(5),
	datab => \sub_select~combout\,
	datac => \Reg_A|Q\(4),
	datad => \Reg_Y|Q[3]~16_combout\,
	combout => \Mux_Add_2|output[3]~10_combout\);

-- Location: LCCOMB_X56_Y25_N10
\Mux_Add_2|output[3]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[3]~11_combout\ = (\Reg_Y|Q[3]~16_combout\ & (((\Mux_Add_2|output[3]~10_combout\)))) # (!\Reg_Y|Q[3]~16_combout\ & ((\Mux_Add_2|output[3]~10_combout\ & (\Reg_C|Q\(3))) # (!\Mux_Add_2|output[3]~10_combout\ & ((\Reg_B|Q\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_C|Q\(3),
	datab => \Reg_Y|Q[3]~16_combout\,
	datac => \Reg_B|Q\(1),
	datad => \Mux_Add_2|output[3]~10_combout\,
	combout => \Mux_Add_2|output[3]~11_combout\);

-- Location: LCCOMB_X58_Y25_N16
\Reg_C|Q~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_C|Q~8_combout\ = (\P_S.RESET~regout\ & \Reg_B|Q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_B|Q\(1),
	combout => \Reg_C|Q~8_combout\);

-- Location: LCFF_X55_Y25_N23
\Reg_C|Q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_C|Q~8_combout\,
	sload => VCC,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_C|Q\(1));

-- Location: LCCOMB_X55_Y25_N22
\Add_Sub_Y|inverting_inputs[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|inverting_inputs[1]~0_combout\ = (\sub_select~combout\ & ((\Reg_Y|Q[3]~16_combout\ & (!\Reg_B|Q\(3))) # (!\Reg_Y|Q[3]~16_combout\ & ((!\Reg_C|Q\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(3),
	datab => \Reg_Y|Q[3]~16_combout\,
	datac => \Reg_C|Q\(1),
	datad => \sub_select~combout\,
	combout => \Add_Sub_Y|inverting_inputs[1]~0_combout\);

-- Location: LCCOMB_X55_Y25_N4
\Add_Sub_Y|inverting_inputs[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|inverting_inputs[1]~1_combout\ = (\Add_Sub_Y|inverting_inputs[1]~0_combout\) # ((!\sub_select~combout\ & (\Reg_Y|Q[3]~16_combout\ & \Reg_A|Q\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sub_select~combout\,
	datab => \Reg_Y|Q[3]~16_combout\,
	datac => \Reg_A|Q\(2),
	datad => \Add_Sub_Y|inverting_inputs[1]~0_combout\,
	combout => \Add_Sub_Y|inverting_inputs[1]~1_combout\);

-- Location: LCFF_X54_Y24_N5
\Mem_A|memory_rtl_0_bypass[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \EXT_DATA~combout\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|memory_rtl_0_bypass\(21));

-- Location: LCCOMB_X54_Y24_N26
\Mem_A|memory~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mem_A|memory~33_combout\ = (\Mem_A|memory~25_combout\ & (\Mem_A|memory_rtl_0_bypass\(21))) # (!\Mem_A|memory~25_combout\ & ((\Mem_A|memory_rtl_0|auto_generated|ram_block1a0~portbdataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mem_A|memory_rtl_0_bypass\(21),
	datac => \Mem_A|memory~25_combout\,
	datad => \Mem_A|memory_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	combout => \Mem_A|memory~33_combout\);

-- Location: LCFF_X54_Y24_N27
\Mem_A|DATA_OUT[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Mem_A|memory~33_combout\,
	ena => \P_S.RD_A~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Mem_A|DATA_OUT\(0));

-- Location: LCCOMB_X55_Y24_N18
\Reg_A|Q~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_A|Q~7_combout\ = (\P_S.RESET~regout\ & \Mem_A|DATA_OUT\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Mem_A|DATA_OUT\(0),
	combout => \Reg_A|Q~7_combout\);

-- Location: LCFF_X55_Y24_N19
\Reg_A|Q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_A|Q~7_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_A|Q\(0));

-- Location: LCCOMB_X55_Y24_N12
\Reg_B|Q~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_B|Q~7_combout\ = (\P_S.RESET~regout\ & \Reg_A|Q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_A|Q\(0),
	combout => \Reg_B|Q~7_combout\);

-- Location: LCFF_X55_Y24_N13
\Reg_B|Q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_B|Q~7_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_B|Q\(0));

-- Location: LCCOMB_X55_Y24_N6
\Reg_C|Q~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_C|Q~7_combout\ = (\P_S.RESET~regout\ & \Reg_B|Q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_B|Q\(0),
	combout => \Reg_C|Q~7_combout\);

-- Location: LCFF_X56_Y25_N5
\Reg_C|Q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_C|Q~7_combout\,
	sload => VCC,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_C|Q\(0));

-- Location: LCCOMB_X56_Y25_N4
\Mux_Add_2|output[0]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[0]~15_combout\ = (\Reg_C|Q\(0) & ((\P_S.SUB_Y_NUM4~regout\) # ((\P_S.SUB_Y_NUM3~regout\ & \P_S.ADD_Y_NUM2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.SUB_Y_NUM3~regout\,
	datab => \P_S.SUB_Y_NUM4~regout\,
	datac => \Reg_C|Q\(0),
	datad => \P_S.ADD_Y_NUM2~regout\,
	combout => \Mux_Add_2|output[0]~15_combout\);

-- Location: LCCOMB_X56_Y25_N26
\Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~1_combout\ = (\sub_select~combout\ & (!\Mux_Add_2|output[0]~15_combout\ & ((!\Reg_Y|Q[3]~16_combout\) # (!\Reg_B|Q\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(2),
	datab => \sub_select~combout\,
	datac => \Mux_Add_2|output[0]~15_combout\,
	datad => \Reg_Y|Q[3]~16_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~1_combout\);

-- Location: LCCOMB_X54_Y25_N20
\Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Y|Q\(1) $ (\Add_Sub_Y|inverting_inputs[1]~1_combout\ $ (((\Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~0_combout\) # 
-- (\Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~0_combout\,
	datab => \Reg_Y|Q\(1),
	datac => \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~1_combout\,
	datad => \Add_Sub_Y|inverting_inputs[1]~1_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCCOMB_X53_Y25_N2
\Reg_Y|Q~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~29_combout\ = (\P_S.RESET~regout\ & (\WideOr5~0_combout\ & \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \P_S.RESET~regout\,
	datac => \WideOr5~0_combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s~combout\,
	combout => \Reg_Y|Q~29_combout\);

-- Location: LCCOMB_X56_Y25_N2
\Reg_Y|Q[3]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q[3]~18_combout\ = (!\P_S.ADD_Y_NUM2~regout\ & (!\P_S.ADD_Y_NUM1~regout\ & (!\P_S.SUB_Y_NUM4~regout\ & !\P_S.SUB_Y_NUM3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.ADD_Y_NUM2~regout\,
	datab => \P_S.ADD_Y_NUM1~regout\,
	datac => \P_S.SUB_Y_NUM4~regout\,
	datad => \P_S.SUB_Y_NUM3~regout\,
	combout => \Reg_Y|Q[3]~18_combout\);

-- Location: LCCOMB_X53_Y25_N0
\Reg_Y|Q[3]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q[3]~19_combout\ = ((!\Reg_Y|Q[3]~18_combout\) # (!\WideOr5~0_combout\)) # (!\P_S.RESET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \P_S.RESET~regout\,
	datac => \WideOr5~0_combout\,
	datad => \Reg_Y|Q[3]~18_combout\,
	combout => \Reg_Y|Q[3]~19_combout\);

-- Location: LCFF_X55_Y25_N25
\Reg_Y|Q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_Y|Q~29_combout\,
	sload => VCC,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(1));

-- Location: LCCOMB_X55_Y25_N12
\Mux_Add_2|output[0]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[0]~14_combout\ = (\Reg_Y|Q[3]~16_combout\ & ((\sub_select~combout\ & (\Reg_B|Q\(2))) # (!\sub_select~combout\ & ((\Reg_A|Q\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(2),
	datab => \Reg_Y|Q[3]~16_combout\,
	datac => \Reg_A|Q\(1),
	datad => \sub_select~combout\,
	combout => \Mux_Add_2|output[0]~14_combout\);

-- Location: LCCOMB_X54_Y25_N30
\Reg_Y|Q~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~21_combout\ = (\WideOr5~1_combout\ & (\Reg_Y|Q\(0) $ (((\Mux_Add_2|output[0]~15_combout\) # (\Mux_Add_2|output[0]~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(0),
	datab => \WideOr5~1_combout\,
	datac => \Mux_Add_2|output[0]~15_combout\,
	datad => \Mux_Add_2|output[0]~14_combout\,
	combout => \Reg_Y|Q~21_combout\);

-- Location: LCFF_X55_Y25_N27
\Reg_Y|Q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_Y|Q~21_combout\,
	sload => VCC,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(0));

-- Location: LCCOMB_X55_Y25_N26
\Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~0_combout\ = (\Reg_Y|Q\(0) & ((\Mux_Add_2|output[0]~15_combout\) # ((\sub_select~combout\) # (\Mux_Add_2|output[0]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux_Add_2|output[0]~15_combout\,
	datab => \sub_select~combout\,
	datac => \Reg_Y|Q\(0),
	datad => \Mux_Add_2|output[0]~14_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~0_combout\);

-- Location: LCCOMB_X55_Y25_N24
\Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Add_Sub_Y|inverting_inputs[1]~1_combout\ & ((\Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~1_combout\) # ((\Reg_Y|Q\(1)) # 
-- (\Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~0_combout\)))) # (!\Add_Sub_Y|inverting_inputs[1]~1_combout\ & (\Reg_Y|Q\(1) & ((\Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~1_combout\) # 
-- (\Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~1_combout\,
	datab => \Add_Sub_Y|inverting_inputs[1]~1_combout\,
	datac => \Reg_Y|Q\(1),
	datad => \Add_Sub_Y|RC_Adder_Generation:0:First_One_Generation:FirstAdder|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X57_Y25_N10
\Reg_C|Q~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_C|Q~6_combout\ = (\P_S.RESET~regout\ & \Reg_B|Q\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.RESET~regout\,
	datad => \Reg_B|Q\(2),
	combout => \Reg_C|Q~6_combout\);

-- Location: LCFF_X56_Y25_N31
\Reg_C|Q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Reg_C|Q~6_combout\,
	sload => VCC,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_C|Q\(2));

-- Location: LCCOMB_X56_Y25_N12
\Mux_Add_2|output[2]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[2]~12_combout\ = (\sub_select~combout\ & ((\Reg_B|Q\(4)) # ((!\Reg_Y|Q[3]~16_combout\)))) # (!\sub_select~combout\ & (((\Reg_A|Q\(3) & \Reg_Y|Q[3]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(4),
	datab => \Reg_A|Q\(3),
	datac => \sub_select~combout\,
	datad => \Reg_Y|Q[3]~16_combout\,
	combout => \Mux_Add_2|output[2]~12_combout\);

-- Location: LCCOMB_X56_Y25_N30
\Mux_Add_2|output[2]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[2]~13_combout\ = (\Reg_Y|Q[3]~16_combout\ & (((\Mux_Add_2|output[2]~12_combout\)))) # (!\Reg_Y|Q[3]~16_combout\ & ((\Mux_Add_2|output[2]~12_combout\ & ((\Reg_C|Q\(2)))) # (!\Mux_Add_2|output[2]~12_combout\ & (\Reg_B|Q\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(0),
	datab => \Reg_Y|Q[3]~16_combout\,
	datac => \Reg_C|Q\(2),
	datad => \Mux_Add_2|output[2]~12_combout\,
	combout => \Mux_Add_2|output[2]~13_combout\);

-- Location: LCCOMB_X55_Y25_N2
\Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Y|Q\(2) & ((\Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|c_out~0_combout\) # (\sub_select~combout\ $ 
-- (\Mux_Add_2|output[2]~13_combout\)))) # (!\Reg_Y|Q\(2) & (\Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & (\sub_select~combout\ $ (\Mux_Add_2|output[2]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(2),
	datab => \sub_select~combout\,
	datac => \Add_Sub_Y|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datad => \Mux_Add_2|output[2]~13_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X55_Y25_N0
\Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Y|Q\(3) & ((\Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|c_out~0_combout\) # (\sub_select~combout\ $ 
-- (\Mux_Add_2|output[3]~11_combout\)))) # (!\Reg_Y|Q\(3) & (\Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & (\sub_select~combout\ $ (\Mux_Add_2|output[3]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(3),
	datab => \sub_select~combout\,
	datac => \Mux_Add_2|output[3]~11_combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X55_Y25_N30
\Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Y|Q\(4) & ((\Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\) # (\Mux_Add_2|output[4]~9_combout\ $ 
-- (\sub_select~combout\)))) # (!\Reg_Y|Q\(4) & (\Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & (\Mux_Add_2|output[4]~9_combout\ $ (\sub_select~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(4),
	datab => \Mux_Add_2|output[4]~9_combout\,
	datac => \sub_select~combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X55_Y25_N20
\Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Y|Q\(5) & ((\Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|c_out~0_combout\) # (\sub_select~combout\ $ 
-- (\Mux_Add_2|output[5]~7_combout\)))) # (!\Reg_Y|Q\(5) & (\Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & (\sub_select~combout\ $ (\Mux_Add_2|output[5]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(5),
	datab => \sub_select~combout\,
	datac => \Mux_Add_2|output[5]~7_combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X57_Y25_N20
\Mux_Add_2|output[8]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[8]~2_combout\ = (\Reg_Y|Q[3]~16_combout\ & ((\sub_select~combout\ & (\Reg_B|Q\(7))) # (!\sub_select~combout\ & ((\Reg_A|Q\(7)))))) # (!\Reg_Y|Q[3]~16_combout\ & (((\sub_select~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(7),
	datab => \Reg_Y|Q[3]~16_combout\,
	datac => \Reg_A|Q\(7),
	datad => \sub_select~combout\,
	combout => \Mux_Add_2|output[8]~2_combout\);

-- Location: LCCOMB_X57_Y25_N0
\Reg_C|Q~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_C|Q~2_combout\ = (\P_S.RESET~regout\ & \Reg_B|Q\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P_S.RESET~regout\,
	datad => \Reg_B|Q\(6),
	combout => \Reg_C|Q~2_combout\);

-- Location: LCFF_X57_Y25_N1
\Reg_C|Q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_C|Q~2_combout\,
	ena => \Reg_C|Q[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_C|Q\(6));

-- Location: LCCOMB_X57_Y25_N2
\Mux_Add_2|output[6]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux_Add_2|output[6]~5_combout\ = (\Reg_Y|Q[3]~16_combout\ & (((\Mux_Add_2|output[8]~2_combout\)))) # (!\Reg_Y|Q[3]~16_combout\ & ((\Mux_Add_2|output[8]~2_combout\ & ((\Reg_C|Q\(6)))) # (!\Mux_Add_2|output[8]~2_combout\ & (\Reg_B|Q\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_B|Q\(4),
	datab => \Reg_Y|Q[3]~16_combout\,
	datac => \Mux_Add_2|output[8]~2_combout\,
	datad => \Reg_C|Q\(6),
	combout => \Mux_Add_2|output[6]~5_combout\);

-- Location: LCCOMB_X55_Y25_N10
\Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Y|Q\(6) & ((\Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|c_out~0_combout\) # (\sub_select~combout\ $ 
-- (\Mux_Add_2|output[6]~5_combout\)))) # (!\Reg_Y|Q\(6) & (\Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & (\sub_select~combout\ $ (\Mux_Add_2|output[6]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(6),
	datab => \sub_select~combout\,
	datac => \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datad => \Mux_Add_2|output[6]~5_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X55_Y25_N16
\Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Y|Q\(7) & ((\Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\) # (\sub_select~combout\ $ 
-- (\Mux_Add_2|output[7]~4_combout\)))) # (!\Reg_Y|Q\(7) & (\Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & (\sub_select~combout\ $ (\Mux_Add_2|output[7]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(7),
	datab => \sub_select~combout\,
	datac => \Mux_Add_2|output[7]~4_combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X55_Y25_N6
\Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s~combout\ = \Mux_Add_2|output[8]~3_combout\ $ (\Reg_Y|Q\(8) $ (\Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|c_out~0_combout\ $ (\sub_select~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux_Add_2|output[8]~3_combout\,
	datab => \Reg_Y|Q\(8),
	datac => \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datad => \sub_select~combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCCOMB_X54_Y25_N24
\Reg_Y|Q~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~22_combout\ = (\P_S.RESET~regout\ & (\WideOr5~0_combout\ & \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.RESET~regout\,
	datab => \WideOr5~0_combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s~combout\,
	combout => \Reg_Y|Q~22_combout\);

-- Location: LCFF_X54_Y25_N25
\Reg_Y|Q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Y|Q~22_combout\,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(8));

-- Location: LCCOMB_X55_Y25_N18
\Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Y|Q\(8) & ((\Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|c_out~0_combout\) # (\Mux_Add_2|output[8]~3_combout\ $ 
-- (\sub_select~combout\)))) # (!\Reg_Y|Q\(8) & (\Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & (\Mux_Add_2|output[8]~3_combout\ $ (\sub_select~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux_Add_2|output[8]~3_combout\,
	datab => \Reg_Y|Q\(8),
	datac => \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datad => \sub_select~combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X55_Y25_N14
\Reg_Y|Q~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~20_combout\ = (\WideOr5~1_combout\ & (\Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~0_combout\ $ (\Reg_Y|Q\(9) $ (\Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~0_combout\,
	datab => \WideOr5~1_combout\,
	datac => \Reg_Y|Q\(9),
	datad => \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Reg_Y|Q~20_combout\);

-- Location: LCFF_X55_Y25_N15
\Reg_Y|Q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Y|Q~20_combout\,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(9));

-- Location: LCCOMB_X55_Y25_N28
\Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Y|Q\(9) & ((\Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|c_out~0_combout\) # (\Mux_Add_2|output[9]~1_combout\ $ 
-- (\sub_select~combout\)))) # (!\Reg_Y|Q\(9) & (\Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & (\Mux_Add_2|output[9]~1_combout\ $ (\sub_select~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux_Add_2|output[9]~1_combout\,
	datab => \sub_select~combout\,
	datac => \Reg_Y|Q\(9),
	datad => \Add_Sub_Y|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X55_Y25_N8
\Reg_Y|Q~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~17_combout\ = (\WideOr5~1_combout\ & (\Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~0_combout\ $ (\Reg_Y|Q\(10) $ (\Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~0_combout\,
	datab => \WideOr5~1_combout\,
	datac => \Reg_Y|Q\(10),
	datad => \Add_Sub_Y|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Reg_Y|Q~17_combout\);

-- Location: LCFF_X55_Y25_N9
\Reg_Y|Q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Y|Q~17_combout\,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(10));

-- Location: LCCOMB_X54_Y25_N18
\Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s~combout\ = \Mux_Add_2|output[3]~11_combout\ $ (\Reg_Y|Q\(3) $ (\sub_select~combout\ $ (\Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux_Add_2|output[3]~11_combout\,
	datab => \Reg_Y|Q\(3),
	datac => \sub_select~combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCCOMB_X54_Y25_N2
\Reg_Y|Q~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~27_combout\ = (\Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s~combout\ & (\P_S.RESET~regout\ & \WideOr5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s~combout\,
	datac => \P_S.RESET~regout\,
	datad => \WideOr5~0_combout\,
	combout => \Reg_Y|Q~27_combout\);

-- Location: LCFF_X54_Y25_N3
\Reg_Y|Q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Y|Q~27_combout\,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(3));

-- Location: LCCOMB_X54_Y25_N28
\Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s~combout\ = \sub_select~combout\ $ (\Reg_Y|Q\(4) $ (\Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ $ (\Mux_Add_2|output[4]~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sub_select~combout\,
	datab => \Reg_Y|Q\(4),
	datac => \Add_Sub_Y|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datad => \Mux_Add_2|output[4]~9_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCCOMB_X54_Y25_N8
\Reg_Y|Q~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~26_combout\ = (\WideOr5~0_combout\ & (\P_S.RESET~regout\ & \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr5~0_combout\,
	datac => \P_S.RESET~regout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s~combout\,
	combout => \Reg_Y|Q~26_combout\);

-- Location: LCFF_X54_Y25_N9
\Reg_Y|Q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Y|Q~26_combout\,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(4));

-- Location: LCCOMB_X54_Y25_N22
\Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Y|Q\(5) $ (\Mux_Add_2|output[5]~7_combout\ $ (\sub_select~combout\ $ (\Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(5),
	datab => \Mux_Add_2|output[5]~7_combout\,
	datac => \sub_select~combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCCOMB_X54_Y25_N10
\Reg_Y|Q~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~25_combout\ = (\WideOr5~0_combout\ & (\P_S.RESET~regout\ & \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr5~0_combout\,
	datac => \P_S.RESET~regout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s~combout\,
	combout => \Reg_Y|Q~25_combout\);

-- Location: LCFF_X54_Y25_N11
\Reg_Y|Q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Y|Q~25_combout\,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(5));

-- Location: LCCOMB_X54_Y25_N26
\posit~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \posit~1_combout\ = (\Reg_Y|Q\(2)) # ((\Reg_Y|Q\(3)) # ((\Reg_Y|Q\(4)) # (\Reg_Y|Q\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(2),
	datab => \Reg_Y|Q\(3),
	datac => \Reg_Y|Q\(4),
	datad => \Reg_Y|Q\(5),
	combout => \posit~1_combout\);

-- Location: LCCOMB_X54_Y25_N4
\posit~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \posit~2_combout\ = (\Reg_Y|Q\(0)) # (\Reg_Y|Q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reg_Y|Q\(0),
	datad => \Reg_Y|Q\(1),
	combout => \posit~2_combout\);

-- Location: LCCOMB_X53_Y25_N30
posit : cycloneii_lcell_comb
-- Equation(s):
-- \posit~combout\ = (!\Reg_Y|Q\(10) & ((\posit~0_combout\) # ((\posit~1_combout\) # (\posit~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \posit~0_combout\,
	datab => \Reg_Y|Q\(10),
	datac => \posit~1_combout\,
	datad => \posit~2_combout\,
	combout => \posit~combout\);

-- Location: LCCOMB_X51_Y25_N8
\P_S.CHECK~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \P_S.CHECK~feeder_combout\ = \P_S.SUB_Y_NUM4~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \P_S.SUB_Y_NUM4~regout\,
	combout => \P_S.CHECK~feeder_combout\);

-- Location: LCFF_X51_Y25_N9
\P_S.CHECK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \P_S.CHECK~feeder_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.CHECK~regout\);

-- Location: LCCOMB_X54_Y25_N6
\Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s~combout\ = \Mux_Add_2|output[7]~4_combout\ $ (\Reg_Y|Q\(7) $ (\sub_select~combout\ $ (\Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux_Add_2|output[7]~4_combout\,
	datab => \Reg_Y|Q\(7),
	datac => \sub_select~combout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCCOMB_X54_Y25_N14
\Reg_Y|Q~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Y|Q~23_combout\ = (\WideOr5~0_combout\ & (\P_S.RESET~regout\ & \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr5~0_combout\,
	datac => \P_S.RESET~regout\,
	datad => \Add_Sub_Y|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s~combout\,
	combout => \Reg_Y|Q~23_combout\);

-- Location: LCFF_X54_Y25_N15
\Reg_Y|Q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Y|Q~23_combout\,
	ena => \Reg_Y|Q[3]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Y|Q\(7));

-- Location: LCCOMB_X53_Y25_N18
\ovf~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ovf~0_combout\ = (\Reg_Y|Q\(10) & (((!\Reg_Y|Q\(8)) # (!\Reg_Y|Q\(7))) # (!\Reg_Y|Q\(9)))) # (!\Reg_Y|Q\(10) & ((\Reg_Y|Q\(9)) # ((\Reg_Y|Q\(7)) # (\Reg_Y|Q\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Y|Q\(10),
	datab => \Reg_Y|Q\(9),
	datac => \Reg_Y|Q\(7),
	datad => \Reg_Y|Q\(8),
	combout => \ovf~0_combout\);

-- Location: LCCOMB_X51_Y25_N2
\N_S.LD_MEM_B_01~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \N_S.LD_MEM_B_01~0_combout\ = (\posit~combout\ & (\P_S.CHECK~regout\ & \ovf~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \posit~combout\,
	datac => \P_S.CHECK~regout\,
	datad => \ovf~0_combout\,
	combout => \N_S.LD_MEM_B_01~0_combout\);

-- Location: LCFF_X51_Y25_N3
\P_S.LD_MEM_B_01\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \N_S.LD_MEM_B_01~0_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.LD_MEM_B_01~regout\);

-- Location: LCCOMB_X51_Y25_N20
\N_S.LD_MEM_B_10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \N_S.LD_MEM_B_10~0_combout\ = (!\posit~combout\ & (\P_S.CHECK~regout\ & !\ovf~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \posit~combout\,
	datac => \P_S.CHECK~regout\,
	datad => \ovf~0_combout\,
	combout => \N_S.LD_MEM_B_10~0_combout\);

-- Location: LCFF_X51_Y25_N21
\P_S.LD_MEM_B_10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \N_S.LD_MEM_B_10~0_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.LD_MEM_B_10~regout\);

-- Location: LCCOMB_X51_Y25_N12
\N_S.LD_MEM_B_11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \N_S.LD_MEM_B_11~0_combout\ = (\posit~combout\ & (\P_S.CHECK~regout\ & !\ovf~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \posit~combout\,
	datac => \P_S.CHECK~regout\,
	datad => \ovf~0_combout\,
	combout => \N_S.LD_MEM_B_11~0_combout\);

-- Location: LCFF_X51_Y25_N13
\P_S.LD_MEM_B_11\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \N_S.LD_MEM_B_11~0_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.LD_MEM_B_11~regout\);

-- Location: LCCOMB_X51_Y25_N22
\WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \WideOr5~0_combout\ = (!\P_S.LD_MEM_B_00~regout\ & (!\P_S.LD_MEM_B_01~regout\ & (!\P_S.LD_MEM_B_10~regout\ & !\P_S.LD_MEM_B_11~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.LD_MEM_B_00~regout\,
	datab => \P_S.LD_MEM_B_01~regout\,
	datac => \P_S.LD_MEM_B_10~regout\,
	datad => \P_S.LD_MEM_B_11~regout\,
	combout => \WideOr5~0_combout\);

-- Location: LCCOMB_X51_Y25_N4
WideOr6 : cycloneii_lcell_comb
-- Equation(s):
-- \WideOr6~combout\ = ((\P_S.WR_A~regout\) # ((\P_S.DONE_STATE~regout\) # (!\WideOr5~0_combout\))) # (!\P_S.RESET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.RESET~regout\,
	datab => \P_S.WR_A~regout\,
	datac => \P_S.DONE_STATE~regout\,
	datad => \WideOr5~0_combout\,
	combout => \WideOr6~combout\);

-- Location: LCCOMB_X51_Y25_N10
\Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~0_combout\ = (\P_S.RESET~regout\ & (\Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\ $ (\WideOr6~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.RESET~regout\,
	datab => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\,
	datac => \WideOr6~combout\,
	combout => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~0_combout\);

-- Location: LCCOMB_X51_Y25_N14
\Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~feeder_combout\ = \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~0_combout\,
	combout => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~feeder_combout\);

-- Location: LCFF_X51_Y25_N15
\Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\);

-- Location: LCCOMB_X51_Y25_N30
\Counter|FF_toggles[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|FF_toggles\(2) = (\Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\ & (\WideOr6~combout\ & \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\,
	datac => \WideOr6~combout\,
	datad => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\,
	combout => \Counter|FF_toggles\(2));

-- Location: LCCOMB_X51_Y24_N26
\Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~0_combout\ = (\P_S.RESET~regout\ & (\Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\ $ (((\Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\ & 
-- \Counter|FF_toggles\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \P_S.RESET~regout\,
	datac => \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|FF_toggles\(2),
	combout => \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~0_combout\);

-- Location: LCFF_X51_Y24_N3
\Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\);

-- Location: LCCOMB_X51_Y24_N12
\Counter|FF_toggles[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|FF_toggles\(4) = (\Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\ & (\Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\ & \Counter|FF_toggles\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|FF_toggles\(2),
	combout => \Counter|FF_toggles\(4));

-- Location: LCCOMB_X51_Y24_N30
\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~0_combout\ = (\P_S.RESET~regout\ & (\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ $ (\Counter|FF_toggles\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \P_S.RESET~regout\,
	datac => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|FF_toggles\(4),
	combout => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~0_combout\);

-- Location: LCCOMB_X51_Y24_N20
\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~feeder_combout\ = \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~0_combout\,
	combout => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~feeder_combout\);

-- Location: LCFF_X51_Y24_N21
\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\);

-- Location: LCCOMB_X53_Y25_N22
\tc~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tc~1_combout\ = (\Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\ & (\Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\ & (\Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\ & 
-- \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:6:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \Counter|Counter_Generation:4:Other_FF_Generation:Other_FF|Q~regout\,
	datac => \Counter|Counter_Generation:7:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|Counter_Generation:5:Other_FF_Generation:Other_FF|Q~regout\,
	combout => \tc~1_combout\);

-- Location: LCCOMB_X53_Y25_N12
\tc~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tc~0_combout\ = (\Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\ & (\Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\ & (\Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\ & 
-- \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:3:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \Counter|Counter_Generation:0:First_FF_Generation:First_FF|Q~regout\,
	datac => \Counter|Counter_Generation:2:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \Counter|Counter_Generation:1:Other_FF_Generation:Other_FF|Q~regout\,
	combout => \tc~0_combout\);

-- Location: LCCOMB_X53_Y25_N20
\tc~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \tc~2_combout\ = (\Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\ & (\tc~1_combout\ & (\Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\ & \tc~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter|Counter_Generation:9:Other_FF_Generation:Other_FF|Q~regout\,
	datab => \tc~1_combout\,
	datac => \Counter|Counter_Generation:8:Other_FF_Generation:Other_FF|Q~regout\,
	datad => \tc~0_combout\,
	combout => \tc~2_combout\);

-- Location: LCCOMB_X51_Y25_N16
\Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\WideOr5~0_combout\ & (\START~combout\ & (\P_S.DONE_STATE~regout\))) # (!\WideOr5~0_combout\ & ((\tc~2_combout\) # ((\START~combout\ & \P_S.DONE_STATE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr5~0_combout\,
	datab => \START~combout\,
	datac => \P_S.DONE_STATE~regout\,
	datad => \tc~2_combout\,
	combout => \Selector3~0_combout\);

-- Location: LCFF_X51_Y25_N17
\P_S.DONE_STATE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector3~0_combout\,
	aclr => \ALT_INV_RST_N~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \P_S.DONE_STATE~regout\);

-- Location: LCCOMB_X51_Y32_N0
\Reg_Out|Q[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Out|Q[0]~0_combout\ = (\P_S.RESET~regout\ & (\Reg_Out|Q\(0) $ (((\P_S.LD_MEM_B_11~regout\) # (\P_S.LD_MEM_B_01~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P_S.LD_MEM_B_11~regout\,
	datab => \P_S.LD_MEM_B_01~regout\,
	datac => \Reg_Out|Q\(0),
	datad => \P_S.RESET~regout\,
	combout => \Reg_Out|Q[0]~0_combout\);

-- Location: LCFF_X51_Y32_N1
\Reg_Out|Q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Reg_Out|Q[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(0));

-- Location: LCCOMB_X51_Y32_N4
\Add_1|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Out|Q\(1) $ (\Reg_Out|Q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reg_Out|Q\(1),
	datad => \Reg_Out|Q\(0),
	combout => \Add_1|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCCOMB_X51_Y32_N14
\Reg_Out|Q[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Reg_Out|Q[4]~1_combout\ = (\P_S.LD_MEM_B_01~regout\) # ((\P_S.LD_MEM_B_11~regout\) # (!\P_S.RESET~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \P_S.LD_MEM_B_01~regout\,
	datac => \P_S.LD_MEM_B_11~regout\,
	datad => \P_S.RESET~regout\,
	combout => \Reg_Out|Q[4]~1_combout\);

-- Location: LCFF_X51_Y32_N5
\Reg_Out|Q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:1:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(1));

-- Location: LCCOMB_X51_Y32_N26
\Add_1|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Out|Q\(2) $ (((\Reg_Out|Q\(1) & \Reg_Out|Q\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reg_Out|Q\(1),
	datac => \Reg_Out|Q\(2),
	datad => \Reg_Out|Q\(0),
	combout => \Add_1|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X51_Y32_N27
\Reg_Out|Q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:2:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(2));

-- Location: LCCOMB_X51_Y32_N12
\Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Out|Q\(3) $ (((\Reg_Out|Q\(1) & (\Reg_Out|Q\(2) & \Reg_Out|Q\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Out|Q\(1),
	datab => \Reg_Out|Q\(2),
	datac => \Reg_Out|Q\(3),
	datad => \Reg_Out|Q\(0),
	combout => \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X51_Y32_N13
\Reg_Out|Q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(3));

-- Location: LCCOMB_X51_Y32_N18
\Add_1|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s~combout\ = \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ $ (\Reg_Out|Q\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datac => \Reg_Out|Q\(4),
	combout => \Add_1|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X51_Y32_N19
\Reg_Out|Q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:4:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(4));

-- Location: LCCOMB_X51_Y32_N16
\Add_1|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Out|Q\(5) $ (((\Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & \Reg_Out|Q\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datac => \Reg_Out|Q\(5),
	datad => \Reg_Out|Q\(4),
	combout => \Add_1|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X51_Y32_N17
\Reg_Out|Q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:5:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(5));

-- Location: LCCOMB_X51_Y32_N24
\Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Out|Q\(3) & (\Reg_Out|Q\(2) & (\Reg_Out|Q\(1) & \Reg_Out|Q\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Out|Q\(3),
	datab => \Reg_Out|Q\(2),
	datac => \Reg_Out|Q\(1),
	datad => \Reg_Out|Q\(0),
	combout => \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X51_Y32_N22
\Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Out|Q\(6) $ (((\Reg_Out|Q\(5) & (\Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & \Reg_Out|Q\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Out|Q\(5),
	datab => \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datac => \Reg_Out|Q\(6),
	datad => \Reg_Out|Q\(4),
	combout => \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X51_Y32_N23
\Reg_Out|Q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(6));

-- Location: LCCOMB_X51_Y32_N30
\Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Out|Q\(5) & (\Reg_Out|Q\(4) & (\Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & \Reg_Out|Q\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Out|Q\(5),
	datab => \Reg_Out|Q\(4),
	datac => \Add_1|RC_Adder_Generation:3:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datad => \Reg_Out|Q\(6),
	combout => \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X51_Y32_N28
\Add_1|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Out|Q\(7) $ (\Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reg_Out|Q\(7),
	datad => \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_1|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X51_Y32_N29
\Reg_Out|Q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:7:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(7));

-- Location: LCCOMB_X51_Y32_N6
\Add_1|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Out|Q\(8) $ (((\Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & \Reg_Out|Q\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datac => \Reg_Out|Q\(8),
	datad => \Reg_Out|Q\(7),
	combout => \Add_1|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X51_Y32_N7
\Reg_Out|Q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:8:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(8));

-- Location: LCCOMB_X51_Y32_N20
\Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~combout\ = \Reg_Out|Q\(9) $ (((\Reg_Out|Q\(8) & (\Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\ & \Reg_Out|Q\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Out|Q\(8),
	datab => \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datac => \Reg_Out|Q\(9),
	datad => \Reg_Out|Q\(7),
	combout => \Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X51_Y32_N21
\Reg_Out|Q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(9));

-- Location: LCCOMB_X51_Y32_N8
\Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\ = (\Reg_Out|Q\(8) & (\Reg_Out|Q\(7) & (\Reg_Out|Q\(9) & \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg_Out|Q\(8),
	datab => \Reg_Out|Q\(7),
	datac => \Reg_Out|Q\(9),
	datad => \Add_1|RC_Adder_Generation:6:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	combout => \Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\);

-- Location: LCCOMB_X51_Y32_N10
\Add_1|RC_Adder_Generation:10:Other_Adders_Generation:Other_Adders|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add_1|RC_Adder_Generation:10:Other_Adders_Generation:Other_Adders|s~combout\ = \Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\ $ (\Reg_Out|Q\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add_1|RC_Adder_Generation:9:Other_Adders_Generation:Other_Adders|c_out~0_combout\,
	datac => \Reg_Out|Q\(10),
	combout => \Add_1|RC_Adder_Generation:10:Other_Adders_Generation:Other_Adders|s~combout\);

-- Location: LCFF_X51_Y32_N11
\Reg_Out|Q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Add_1|RC_Adder_Generation:10:Other_Adders_Generation:Other_Adders|s~combout\,
	sclr => \ALT_INV_P_S.RESET~regout\,
	ena => \Reg_Out|Q[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Reg_Out|Q\(10));

-- Location: PIN_K24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\DONE~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \P_S.DONE_STATE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_DONE);

-- Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(0));

-- Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(1));

-- Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(2));

-- Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(3));

-- Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(4));

-- Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(5));

-- Location: PIN_F17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(6));

-- Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(7));

-- Location: PIN_C24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(8));

-- Location: PIN_J17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(9));

-- Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OUTPUT[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Reg_Out|Q\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OUTPUT(10));
END structure;


