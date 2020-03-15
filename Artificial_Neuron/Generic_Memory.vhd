LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Generic_Memory IS

	GENERIC (Nbit_Address : INTEGER; 
	         Nbit_1_word : INTEGER);
	PORT (CS, RD, WR, CLOCK : IN STD_LOGIC;
		 ADD : IN UNSIGNED(9 DOWNTO 0);
	     DATA_IN : IN SIGNED(Nbit_1_word-1 DOWNTO 0);
		 DATA_OUT : OUT SIGNED(Nbit_1_word-1 DOWNTO 0));

END Generic_Memory;

ARCHITECTURE Behavior OF Generic_Memory IS

	TYPE mem IS ARRAY((2**Nbit_Address)-1 DOWNTO 0) OF SIGNED(Nbit_1_word-1 DOWNTO 0);
	
	SIGNAL memory : mem;
	
	BEGIN
	
	PROCESS (CLOCK)
	
		BEGIN
		
		IF (CLOCK'EVENT AND CLOCK = '1') THEN -- fronte di salita
			IF (CS = '1') THEN
				IF (WR = '1') THEN
					memory(to_integer(ADD)) <= DATA_IN;
				END IF;
				
				IF (RD = '1') THEN
					DATA_OUT <= memory(to_integer(ADD));				
				END IF;
			END IF;
		END IF;
	
	END PROCESS;

END Behavior;