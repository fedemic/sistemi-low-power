LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Full_Adder IS

	PORT ( a, b, c_in : IN  STD_LOGIC;
	         s, c_out : OUT STD_LOGIC );

END Full_Adder;

ARCHITECTURE Behavior OF Full_Adder IS

	BEGIN

		s <= a XOR b XOR c_in;
		c_out <= (a AND b) OR (a AND c_in) OR (b AND c_in);

END Behavior;

-- aggiunto commento a caso
