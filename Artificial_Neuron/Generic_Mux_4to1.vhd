LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Generic_Mux_4to1 IS
	
	GENERIC (N : INTEGER);
	
	PORT( input_1, input_2, input_3, input_4 : IN SIGNED(N-1 DOWNTO 0);
	           sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			   output : OUT SIGNED(N-1 DOWNTO 0));

END Generic_Mux_4to1;

ARCHITECTURE Behavior OF Generic_Mux_4to1 IS

	BEGIN
		output <= input_1 WHEN sel = "00" ELSE
		          input_2 WHEN sel = "01" ELSE
				  input_3 WHEN sel = "10" ELSE
				  input_4;

END Behavior;