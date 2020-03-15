LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Generic_Register IS

	GENERIC (N : INTEGER); 	
	PORT (      R : IN SIGNED(N-1 DOWNTO 0);
   Clock, Reset_n, Clear, Load : IN STD_LOGIC;
               Q : OUT SIGNED(N-1 DOWNTO 0));
					
END Generic_Register;

ARCHITECTURE Behavior OF Generic_Register IS

	BEGIN
	
		PROCESS (Clock, Reset_n) -- Reset asincrono che si attiva quando � negato
			BEGIN
				IF (Reset_n = '0') THEN
					Q <= (OTHERS => '0');
				ELSIF (Clock'EVENT AND Clock = '1') THEN -- Fronte di salita attivo
					IF (Clear = '1') THEN
						Q <= (OTHERS => '0');
					ELSE
						IF (Load = '1') THEN
						Q <= R;
						END IF;
					END IF;
				END IF;		
		END PROCESS;
		
END Behavior;