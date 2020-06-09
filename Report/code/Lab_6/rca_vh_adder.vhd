LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rca_vh_adder IS
	GENERIC (N : INTEGER := 16);
    PORT(
        A     : IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        B     : IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        Ci  : IN    STD_LOGIC;
        Sum   : OUT   STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        Co : OUT   STD_LOGIC);
END rca_vh_adder;

ARCHITECTURE behv OF rca_vh_adder IS

	COMPONENT gate_vh_adder IS
	    PORT(
        a     : IN    STD_LOGIC;
        b     : IN    STD_LOGIC;
        ci  : IN    STD_LOGIC;
        sum   : OUT   STD_LOGIC;
        co : OUT   STD_LOGIC);
	END COMPONENT;

	SIGNAL internal_carry : STD_LOGIC_VECTOR(N-1 DOWNTO 0);

BEGIN

	first_adder : gate_vh_adder PORT MAP(a => A(0),
										 b => B(0),
                                         ci => Ci,
                                         sum => Sum(0),
                                         co => internal_carry(0));
    
	generation: FOR i IN 1 TO N-1 GENERATE
		adder : gate_vh_adder PORT MAP (a => A(i),
										 b => B(i),
                                         ci => internal_carry(i-1),
                                         sum => Sum(i),
                                         co => internal_carry(i));
	END GENERATE;

	Co <= internal_carry(N-1);

END behv;
