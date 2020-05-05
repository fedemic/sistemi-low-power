library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity T0beh is
port (	ck : in std_logic;
	rst : in std_logic;
	A : in std_logic_vector(7 downto 0);
	B : out std_logic_vector(8 downto 0);
	C : out std_logic_vector(7 downto 0));
end T0beh;

architecture behavioral of T0beh is

signal AOLD, C_tmp, buss : std_logic_vector(7 downto 0);
signal seq : std_logic;
begin
	
	penc: process(ck,rst)
	begin
	  if rst='1' then
	    AOLD <= (others => '0');
	    seq <= '0';
		buss <= (others => '0');
	  elsif ck'event and ck='1' then
	    if (A = AOLD + 1) then
	      AOLD <= A;
		  seq <= '1';
	    else
		  AOLD <= A;
	      buss <= A;
		  seq <= '0';
	    end if;
	  end if;
	end process;

	B(8) <= seq;
	B(7 DOWNTO 0) <= buss;

	
	pdec: process(ck,rst)
	begin
	  if rst='1' then
	    C_tmp <= (others => '0');
	  elsif ck'event and ck='1' then
	    if seq='1' then
	      C_tmp <= C_tmp + 1;
	    else
	      C_tmp <= buss;
	    end if;
	  end if;
	end process;
	
	C <= C_tmp;
	
end behavioral;
