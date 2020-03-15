LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Generic_Sync_Counter IS
	
	GENERIC (N : INTEGER);
	PORT (CLOCK, RESET_N, ENABLE, CLEAR : IN STD_LOGIC;
		  COUNTED_NUMBER : OUT UNSIGNED(N-1 DOWNTO 0));

END Generic_Sync_Counter;

ARCHITECTURE Behavior OF Generic_Sync_Counter IS

	COMPONENT T_Flip_Flop IS
	
		PORT (T, Clock, Reset_n, Clear : IN STD_LOGIC;
                        Q : BUFFER STD_LOGIC);
	
	END COMPONENT;
	
	-- Uscite Q del singolo Flip Flop
	SIGNAL FF_outputs : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	-- Ingressi T del singolo Flip Flop
	SIGNAL FF_toggles : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	
	BEGIN
	-- T del primo FF è il segnale enable
	FF_toggles(0) <= ENABLE;
	
	Counter_Generation: FOR i IN 0 TO N-1 GENERATE
	
		First_FF_Generation: IF (i = 0) GENERATE
			First_FF: T_Flip_Flop PORT MAP ( T => FF_toggles(i),
											 Clock => CLOCK,
											 Reset_n => RESET_N,
											 Clear => CLEAR,
											 Q => FF_outputs(i));
		END GENERATE;
		
		
		Other_FF_Generation: IF (i /= 0) GENERATE
			FF_toggles(i) <= FF_toggles(i-1) AND FF_outputs(i-1);
			Other_FF: T_Flip_Flop PORT MAP ( T =>  FF_toggles(i),
											 Clock => CLOCK,
											 Reset_n => RESET_N,
											 Clear => CLEAR,
											 Q => FF_outputs(i));
		END GENERATE;
		
	END GENERATE; 
	
	COUNTED_NUMBER <= UNSIGNED(FF_outputs);

END Behavior;