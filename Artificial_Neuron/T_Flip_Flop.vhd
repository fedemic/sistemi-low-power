LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- T FF a 1 bit
ENTITY T_Flip_Flop IS

	PORT (T, Clock, Reset_n, Clear : IN STD_LOGIC;
                        Q : BUFFER STD_LOGIC);
								
END T_Flip_Flop;

ARCHITECTURE Behavior OF T_Flip_Flop IS
	BEGIN
	
		PROCESS (Clock, Reset_n)
			BEGIN
				IF (Reset_n = '0') THEN -- asynchronous clear 
					Q <= '0';
				ELSIF (Clock'EVENT AND Clock = '1') THEN -- Fronte attivo di salita
					IF (Clear = '1') THEN
						Q <= '0';
					ELSE
						Q <= T XOR Q;
					END IF;
				END IF;
			END PROCESS;
			
END Behavior;