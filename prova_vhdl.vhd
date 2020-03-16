LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
-- commento
ENTITY Artificial_Neuron IS

	PORT (CLK, START, RST_N : IN STD_LOGIC;
	      DONE : OUT STD_LOGIC;
	      EXT_DATA : IN SIGNED(7 DOWNTO 0);
	      OUTPUT : OUT UNSIGNED(10 DOWNTO 0));

END Artificial_Neuron;

ARCHITECTURE Behavior OF Artificial_Neuron IS

	COMPONENT Generic_Add_Sub IS
	
		GENERIC (N : INTEGER);
	    PORT (ADD_1, ADD_2 : IN SIGNED(N-1 DOWNTO 0);
		SUB : IN STD_LOGIC;
		SUM : OUT SIGNED(N-1 DOWNTO 0);
		OVERFLOW : OUT STD_LOGIC);
		
	END COMPONENT;
	
	COMPONENT Generic_Mux_2to1 IS
	
		GENERIC (N : INTEGER);
	    PORT( input_1, input_2 : IN SIGNED(N-1 DOWNTO 0);
	           sel : IN STD_LOGIC;
			   output : OUT SIGNED(N-1 DOWNTO 0));
	
	END COMPONENT;
	
	COMPONENT Generic_Mux_4to1 IS
	
		GENERIC (N : INTEGER);
	    PORT( input_1, input_2, input_3, input_4 : IN SIGNED(N-1 DOWNTO 0);
	           sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			   output : OUT SIGNED(N-1 DOWNTO 0));
	
	END COMPONENT;
	
	COMPONENT Generic_Register IS
	
		GENERIC (N : INTEGER); 	
	    PORT (R : IN SIGNED(N-1 DOWNTO 0);
        Clock, Reset_n, Clear, Load : IN STD_LOGIC;
               Q : OUT SIGNED(N-1 DOWNTO 0));
	
	END COMPONENT;
	
	COMPONENT Generic_Sync_Counter IS
	
		GENERIC (N : INTEGER);
	    PORT (CLOCK, RESET_N, ENABLE, CLEAR : IN STD_LOGIC;
		  COUNTED_NUMBER : OUT UNSIGNED(N-1 DOWNTO 0));
	
	END COMPONENT;
	
	COMPONENT Generic_Memory IS
	
		GENERIC (Nbit_Address : INTEGER; 
	         Nbit_1_word : INTEGER);
	     PORT (CS, RD, WR, CLOCK : IN STD_LOGIC;
		 ADD : IN UNSIGNED(9 DOWNTO 0);
	     DATA_IN : IN SIGNED(Nbit_1_word-1 DOWNTO 0);
		 DATA_OUT : OUT SIGNED(Nbit_1_word-1 DOWNTO 0));
	
	END COMPONENT;
	
	-- Segnali relativi al datapath
	SIGNAL cnt_add : UNSIGNED(9 DOWNTO 0);
	SIGNAL y, wire_to_add_2, wire_to_reg_y : SIGNED(10 DOWNTO 0);
	SIGNAL output_mem_A, output_reg_A, output_reg_B, output_reg_C, data_in_cut, data_in_saturated, data_in_mem_B : SIGNED(7 DOWNTO 0);
	SIGNAL num_1, num_2, num_3, num_4, output_reg_out, input_reg_out : SIGNED(10 DOWNTO 0);
	
	SIGNAL clear_cnt, enable_cnt, tc,
          cs_mem_A, rd_mem_A, wr_mem_A,
			 load_reg_A, load_reg_B, load_reg_C, load_reg_out, load_reg_y, clear_reg_A, clear_reg_B, clear_reg_C, clear_reg_out, clear_reg_y,
			 sel_data,
			 ovf, posit, sub_select,
			 cs_mem_B, rd_mem_B, wr_mem_B : STD_LOGIC;
	
	SIGNAL sel_add_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
			 
	-- segnali relativi alla control unit
	TYPE State IS (RESET, WR_A, RD_A, LD_REG, ADD_Y_NUM2, SUB_Y_NUM3, ADD_Y_NUM1, SUB_Y_NUM4, CHECK, LD_MEM_B_00, LD_MEM_B_01, LD_MEM_B_11, LD_MEM_B_10, DONE_STATE);
	SIGNAL P_S, N_S : State;
	
	BEGIN
	
	-- DATAPATH
	
	Counter : Generic_Sync_Counter GENERIC MAP(N => 10)
	                               PORT MAP(CLOCK => CLK,
											          RESET_N => '1',
														 ENABLE => enable_cnt,
														 CLEAR => clear_cnt,
														 COUNTED_NUMBER => cnt_add);
	tc <=	cnt_add(9) AND 
			cnt_add(8) AND 
			cnt_add(7) AND 
			cnt_add(6) AND 
			cnt_add(5) AND 
			cnt_add(4) AND 
			cnt_add(3) AND 
			cnt_add(2) AND 
			cnt_add(1) AND 
			cnt_add(0); 
														 
	Mem_A : Generic_Memory GENERIC MAP(Nbit_Address => 10, Nbit_1_word => 8)
	                       PORT MAP(CS => cs_mem_A,
								           RD => rd_mem_A,
											  WR => wr_mem_A,
											  CLOCK => CLK,
											  ADD => cnt_add,
											  DATA_IN => EXT_DATA,
											  DATA_OUT => output_mem_A);
											  
	Reg_A : Generic_Register GENERIC MAP(N => 8)
	                         PORT MAP(R => output_mem_A,
									          Clock => CLK,
												 Reset_n => '1',
												 Clear => clear_reg_A,
												 Load => load_reg_A,
												 Q => output_reg_A);
												 
	Reg_B : Generic_Register GENERIC MAP(N => 8)
	                         PORT MAP(R => output_reg_A,
									          Clock => CLK,
												 Reset_n => '1',
												 Clear => clear_reg_B,
												 Load => load_reg_B,
												 Q => output_reg_B);
												 
	Reg_C : Generic_Register GENERIC MAP(N => 8)
	                         PORT MAP(R => output_reg_B,
									          Clock => CLK,
												 Reset_n => '1',
												 Clear => clear_reg_C,
												 Load => load_reg_C,
												 Q => output_reg_C);	
	
   -- divisione per 2	
	num_1(6 DOWNTO 0) <= output_reg_A(7 DOWNTO 1);
	num_1(10 DOWNTO 7) <= (OTHERS => output_reg_A(7));
	
	-- moltiplicazione per 4
	num_2(1 DOWNTO 0) <= (OTHERS => '0');
	num_2(9 DOWNTO 2) <= output_reg_B;
	num_2(10) <= output_reg_B(7);
	
	-- divisione per 4
	num_3(5 DOWNTO 0) <= output_reg_B(7 DOWNTO 2);
	num_3(10 DOWNTO 6) <= (OTHERS => output_reg_B(7));
	
	-- prolungamento su 11 bit
	num_4(7 DOWNTO 0) <= output_reg_C;
	num_4(10 DOWNTO 8) <= (OTHERS => output_reg_C(7));
	
 
	Mux_Add_2 : Generic_Mux_4to1 GENERIC MAP(N => 11)
	                       PORT MAP(input_1 => num_1,
								           input_2 => num_2,
											  input_3 => num_3,
											  input_4 => num_4,
											  sel => sel_add_2,
											  output => wire_to_add_2);

	Add_Sub_Y : Generic_Add_Sub GENERIC MAP(N => 11)
                               PORT MAP(ADD_1 => y,
										          ADD_2 => wire_to_add_2,
													 SUB => sub_select,
													 SUM => wire_to_reg_y);
	
	Reg_Y : Generic_Register GENERIC MAP(N => 11)
	                         PORT MAP(R => wire_to_reg_y,
									          Clock => CLK,
												 Reset_n => '1',
												 Clear => clear_reg_y,
												 Load => load_reg_y,
												 Q => y);

	
	
	ovf <= NOT(y(10) OR y(9) OR y(8) OR y(7)) XOR (y(10) AND y(9) AND y(8) AND y(7));
	
	posit <= NOT y(10) AND (y(9) OR y(8) OR y(7) OR y(6) OR y(5) OR y(4) OR y(3) OR y(2) OR y(1) OR y(0));
	
	
	data_in_cut <= y(7 DOWNTO 0);
	
	data_in_saturated <= y(10) & NOT y(10) & NOT y(10) & NOT y(10) & NOT y(10) & NOT y(10) & NOT y(10) & NOT y(10);
	
	Mux_Data : Generic_Mux_2to1 GENERIC MAP(N => 8)
	                       PORT MAP(input_1 => data_in_cut,
								           input_2 => data_in_saturated,
											  sel => sel_data,
											  output => data_in_mem_B);
											  
	Mem_B : Generic_Memory GENERIC MAP(Nbit_Address => 10, Nbit_1_word => 8)
	                       PORT MAP(CS => cs_mem_B,
								           RD => rd_mem_B,
											  WR => wr_mem_B,
											  CLOCK => CLK,
											  ADD => cnt_add,
											  DATA_IN => data_in_mem_B);
											  
	Reg_Out : Generic_Register GENERIC MAP(N => 11)
	                           PORT MAP(R => input_reg_out,
									          Clock => CLK,
												 Reset_n => '1',
												 Clear => clear_reg_out,
												 Load => load_reg_out,
												 Q => output_reg_out);
												
	OUTPUT <= unsigned(output_reg_out);

	Add_1 : Generic_Add_Sub GENERIC MAP(N => 11)
	                        PORT MAP(ADD_1 => output_reg_out,
									         ADD_2 => "00000000001",
												SUB => '0',
												SUM => input_reg_out);
																					  
	
	-- Control Unit
	
	-- Processo di generazione del next state
	Next_State_Generation : PROCESS (P_S, START, tc, ovf, posit) IS
	
	   BEGIN
		
		CASE P_S IS
		
			WHEN RESET => IF (START = '0') THEN N_S <= RESET;
			              ELSE N_S <= WR_A;
							  END IF;
							  
			WHEN WR_A => IF (tc = '0') THEN N_S <= WR_A;
			             ELSE N_S <= RD_A;
							 END IF;
							 
			WHEN RD_A => N_S <= LD_REG;
			
			WHEN LD_REG => N_S <= ADD_Y_NUM2;
			
			WHEN ADD_Y_NUM2 => N_S <= SUB_Y_NUM3;
			
			WHEN SUB_Y_NUM3 => N_S <= ADD_Y_NUM1;
			
			WHEN ADD_Y_NUM1 => N_S <= SUB_Y_NUM4;
			
			WHEN SUB_Y_NUM4 => N_S <= CHECK;
			
			WHEN CHECK => IF (ovf = '0' AND posit = '0') THEN N_S <= LD_MEM_B_00;
			              ELSIF (ovf = '0' AND posit = '1') THEN N_S <= LD_MEM_B_01;
							  ELSIF (ovf = '1' AND posit = '1') THEN N_S <= LD_MEM_B_11;
							  ELSE N_S <= LD_MEM_B_10;
							  END IF;
							  
			WHEN LD_MEM_B_00 => IF (tc = '1') THEN N_S <= DONE_STATE;
			                    ELSE N_S <= RD_A;
									  END IF;
									  
			WHEN LD_MEM_B_01 => IF (tc = '1') THEN N_S <= DONE_STATE;
			                    ELSE N_S <= RD_A;
									  END IF;
									 
			WHEN LD_MEM_B_11 => IF (tc = '1') THEN N_S <= DONE_STATE;
			                    ELSE N_S <= RD_A;
									  END IF;
									 
			WHEN LD_MEM_B_10 => IF (tc = '1') THEN N_S <= DONE_STATE;
			                    ELSE N_S <= RD_A;
									  END IF; 
									  
			WHEN DONE_STATE => IF (START = '1') THEN N_S <= DONE_STATE;
			             ELSE N_S <= RESET;
							 END IF;
									  
									  
		END CASE;
	
	END PROCESS;
	
	-- Processo di update dello stato
	State_Update : PROCESS (CLK, RST_N) IS
	
	   BEGIN
		
		IF (RST_N = '0') THEN
				P_S <= RESET;
		ELSE
		
			IF (CLK'EVENT AND CLK = '1') THEN
			
				P_S <= N_S;
			
			END IF;
			
		END IF;		
		
	END PROCESS;
	
	-- Processo di generazione degli output
	Output_Process : PROCESS (P_S) IS
	
	   BEGIN
		
		-- valori di default
		clear_cnt <= '0';
		enable_cnt <= '1';
		cs_mem_A <= '1';
		rd_mem_A <= '0';
		wr_mem_A <= '0';
		clear_reg_A <= '0';
		load_reg_A <= '0';
		clear_reg_B <= '0';
		load_reg_B <= '0';
		clear_reg_C <= '0';
		load_reg_C <= '0';
		load_reg_y <= '0';
		clear_reg_y <= '0';
		clear_reg_out <= '0';
		load_reg_out <= '0';
		sel_add_2 <= "00";
		sub_select <= '0';
		sel_data <= '0';
		cs_mem_B <= '1';
		rd_mem_B <= '0';
		wr_mem_B <= '0';
		DONE <= '0';
		
		CASE P_S IS
		
			WHEN RESET => clear_cnt <= '1';
			              clear_reg_A <= '1';
							  clear_reg_B <= '1';
							  clear_reg_C <= '1';
							  clear_reg_y <= '1';
							  clear_reg_out <= '1';
							  
			WHEN WR_A =>  wr_mem_A <= '1';
							 
			WHEN RD_A => rd_mem_A <= '1';
			             enable_cnt <= '0';
			
			WHEN LD_REG => load_reg_A <= '1';
			               load_reg_B <= '1';
								load_reg_C <= '1';
								enable_cnt <= '0';
								
			WHEN ADD_Y_NUM2 => load_reg_y <= '1';
							       sel_add_2 <= "01";
									 enable_cnt <= '0';
							  
			WHEN SUB_Y_NUM3 => load_reg_y <= '1';
			                   sel_add_2 <= "10";
			                   sub_select <= '1';
									 enable_cnt <= '0';
			            
			                
			WHEN ADD_Y_NUM1 => load_reg_y <= '1';
                            sel_add_2 <= "00";
									 enable_cnt <= '0';
			
			WHEN SUB_Y_NUM4 => load_reg_y <= '1';
			                   sel_add_2 <= "11";
									 sub_select <= '1';
									 enable_cnt <= '0';
							
			WHEN CHECK => enable_cnt <= '0';
 
         WHEN LD_MEM_B_00 => wr_mem_B <= '1';
		                       enable_cnt <= '1';	
									  clear_reg_y <= '1';
									  
			WHEN LD_MEM_B_01 => wr_mem_B <= '1';
			                    load_reg_out <= '1';
		                       enable_cnt <= '1';	
									  clear_reg_y <= '1';
									  
			WHEN LD_MEM_B_11 => wr_mem_B <= '1';
			                    load_reg_out <= '1';
									  sel_data <= '1';
		                       enable_cnt <= '1';	
									  clear_reg_y <= '1';
									  
			WHEN LD_MEM_B_10 => wr_mem_B <= '1';
									  sel_data <= '1';
		                       enable_cnt <= '1';
									  clear_reg_y <= '1';
									 
			WHEN DONE_STATE => DONE <= '1'; 
		
	    END CASE;	 		
		
	END PROCESS;	

END ARCHITECTURE;

