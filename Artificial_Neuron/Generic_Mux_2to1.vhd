LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Generic_Mux_2to1 IS
	
	GENERIC (N : INTEGER);
	
	PORT( input_1, input_2 : IN SIGNED(N-1 DOWNTO 0);
	           sel : IN STD_LOGIC;
			   output : OUT SIGNED(N-1 DOWNTO 0));

END Generic_Mux_2to1;

ARCHITECTURE Behavior OF Generic_Mux_2to1 IS

	BEGIN
		output <= input_1 WHEN sel = '0' ELSE
		          input_2;

END Behavior;