	signal	D1:		std_logic_vector(byte-1 downto 0) := ('0', others => '1'); -- 01111111
	signal	D2:		std_logic_vector(0 to byte-1) := (others => '0'); -- 00000000 
	signal	D3:		std_logic_vector(byte-1 downto 0) := (others => '1'); -- 1111111