library IEEE;
use IEEE.std_logic_1164.all;

entity FSM_Adder is

port(CLK: in std_logic;
	 RST:	in std_logic;
	A, B, C, D, E, F: in std_logic_vector(15 downto 0);
	Somma: out std_logic_vector(15 downto 0)
);
end	FSM_Adder;

architecture behavior of FSM_Adder is

component fsm1 is
port(clock: in std_logic;
	reset:	in std_logic;
	S00, S01, S10, S11: out std_logic
);
end component;

component dpadder is
port( 	MUX00:	in std_logic_vector(15 downto 0);
	MUX01:	in std_logic_vector(15 downto 0);
	MUX02:	in std_logic_vector(15 downto 0);
	MUX03:	in std_logic_vector(15 downto 0);
	MUX10:	in std_logic_vector(15 downto 0);
	MUX11:	in std_logic_vector(15 downto 0);
	MUX12:	in std_logic_vector(15 downto 0);
	MUX13:	in std_logic_vector(15 downto 0);
	clock: 	in std_logic;
	reset:	in std_logic;
	SEL00:	in std_logic;
	SEL01:	in std_logic;
	SEL10:	in std_logic;
	SEL11:	in std_logic;
	SUM:	out std_logic_vector(15 downto 0)
);
end component;

signal Sum_feedback : std_logic_vector(15 downto 0);
signal sel00_wire, sel01_wire, sel10_wire, sel11_wire : std_logic; 

begin

Datapath: dpadder port map (MUX00 => D,
							MUX01 => Sum_feedback,
							MUX02 => C,
							MUX03 => B,
							MUX10 => Sum_feedback,
							MUX11 => F,
							MUX12 => A,
							MUX13 => E,
							clock => CLK,
							reset => RST,
							SEL00 => sel00_wire,
							SEL01 => sel01_wire,
							SEL10 => sel10_wire,
							SEL11 => sel11_wire,
							SUM => Sum_feedback);
Somma <= Sum_feedback;

FSM: fsm1 port map (clock => CLK,
					reset => RST,
					S00 => sel00_wire, 
					S01 => sel01_wire, 
					S10 => sel10_wire, 
					S11 => sel11_wire);				


end behavior;



