--
-- A gate level 1 bit adder model.
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY gate_vh_adder IS 
    PORT(
        a     : IN    STD_LOGIC;
        b     : IN    STD_LOGIC;
        ci  : IN    STD_LOGIC;
        sum   : OUT   STD_LOGIC;
        co : OUT   STD_LOGIC);
END gate_vh_adder;

ARCHITECTURE behv OF gate_vh_adder IS
BEGIN
    sum <= a XOR b XOR ci;
    co <= (a AND b) OR (ci AND a) OR (ci AND b);
END behv;
