LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Generic_Add_Sub IS

	GENERIC (N : INTEGER); -- N bit di somma e risultato
	
	PORT (ADD_1, ADD_2 : IN SIGNED(N-1 DOWNTO 0);
		SUB : IN STD_LOGIC;
		SUM : OUT SIGNED(N-1 DOWNTO 0);
		OVERFLOW : OUT STD_LOGIC);

END Generic_Add_Sub;

ARCHITECTURE Behavior OF Generic_Add_Sub IS

	COMPONENT Full_Adder IS
	
		PORT ( a, b, c_in : IN  STD_LOGIC;
	     s, c_out : OUT STD_LOGIC); 
	
	END COMPONENT;

	SIGNAL carry_wires : STD_LOGIC_VECTOR(N-1 DOWNTO 0); -- Wires per collegare i carry tra i vari Full Adders
	SIGNAL inverting_inputs : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	
	BEGIN	
		
		RC_Adder_Generation : FOR i IN 0 TO N-1 GENERATE
	      -- Generazione del primo Full Adder
	      inverting_inputs(i) <= (ADD_2(i) XOR SUB);
			First_One_Generation : IF (i = 0) GENERATE
			   --se C_IN=1, ogni bit del secondo numero viene complementato
				FirstAdder : Full_Adder PORT MAP ( a => ADD_1(i), b => inverting_inputs(i), c_in => SUB, s => SUM(i), c_out => carry_wires(i));	
			END GENERATE;
	
			-- Generazione dei restanti Full Adder
			Other_Adders_Generation : IF (i /= 0) GENERATE 
			Other_Adders : Full_Adder PORT MAP ( a => ADD_1(i), b => inverting_inputs(i), c_in => carry_wires(i-1), s => SUM(i), c_out => carry_wires(i));
			END GENERATE;
	
	END GENERATE;
	
	-- Condizione di overflow in CA2 ottenuta utilizzando i carry di ingresso e uscita dell'ultimo stadio
	OVERFLOW <= carry_wires(N-2) XOR carry_wires(N-1);

END Behavior;