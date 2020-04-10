library IEEE;

use IEEE.std_logic_1164.all;
		


entity tb_adder is
end tb_adder;

architecture behavior of tb_adder is

	signal Tb_A, Tb_B, Tb_C, Tb_D, Tb_E, Tb_F, Tb_sum: std_logic_vector(15 downto 0);
	signal Tb_CLOCK: std_logic;
	signal Tb_RESET: std_logic;

	component FSM_Adder is
	port(CLK: in std_logic;
	 RST:	in std_logic;
	A, B, C, D, E, F: in std_logic_vector(15 downto 0);
	Somma: out std_logic_vector(15 downto 0));
end component;

begin

	dut: FSM_Adder PORT MAP(CLK => Tb_CLOCK,
							RST => Tb_RESET,
							A => Tb_A,
							B => Tb_B,
							C => Tb_C,
							D => Tb_D,
							E => Tb_E,
							F => Tb_F,
							Somma => Tb_Sum);
	Tb_A <= (Others => '0');
	Tb_B <= (Others => '0');
	Tb_C <= (Others => '0');
	Tb_D <= (Others => '0');
	Tb_E <= (Others => '0');
	Tb_F <= (Others => '0');
	
	process
	begin
		Tb_CLOCK <= '1';			-- clock cycle 6 ns
		wait for 3 ns;
		Tb_CLOCK <= '0';
		wait for 3 ns;
	end process;
	
		Tb_RESET <= '1' after 2 ns, '0' after 10 ns;

end behavior;

-------------------------------

configuration CFG_TB of tb_adder is
	for behavior
	end for;
end CFG_TB;

