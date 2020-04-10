
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_FSM_Adder is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_FSM_Adder;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FSM_Adder.all;

entity FSM_Adder is

   port( CLK, RST : in std_logic;  A, B, C, D, E, F : in std_logic_vector (15 
         downto 0);  Somma : out std_logic_vector (15 downto 0));

end FSM_Adder;

architecture SYN_behavior of FSM_Adder is

   component fsm1
      port( clock, reset : in std_logic;  S00, S01, S10, S11 : out std_logic);
   end component;
   
   component dpadder
      port( MUX00, MUX01, MUX02, MUX03, MUX10, MUX11, MUX12, MUX13 : in 
            std_logic_vector (15 downto 0);  clock, reset, SEL00, SEL01, SEL10,
            SEL11 : in std_logic;  SUM : out std_logic_vector (15 downto 0));
   end component;
   
   signal Somma_15_port, Somma_14_port, Somma_13_port, Somma_12_port, 
      Somma_11_port, Somma_10_port, Somma_9_port, Somma_8_port, Somma_7_port, 
      Somma_6_port, Somma_5_port, Somma_4_port, Somma_3_port, Somma_2_port, 
      Somma_1_port, Somma_0_port, sel00_wire, sel01_wire, sel10_wire, 
      sel11_wire : std_logic;

begin
   Somma <= ( Somma_15_port, Somma_14_port, Somma_13_port, Somma_12_port, 
      Somma_11_port, Somma_10_port, Somma_9_port, Somma_8_port, Somma_7_port, 
      Somma_6_port, Somma_5_port, Somma_4_port, Somma_3_port, Somma_2_port, 
      Somma_1_port, Somma_0_port );
   
   Datapath : dpadder port map( MUX00(15) => B(15), MUX00(14) => B(14), 
                           MUX00(13) => B(13), MUX00(12) => B(12), MUX00(11) =>
                           B(11), MUX00(10) => B(10), MUX00(9) => B(9), 
                           MUX00(8) => B(8), MUX00(7) => B(7), MUX00(6) => B(6)
                           , MUX00(5) => B(5), MUX00(4) => B(4), MUX00(3) => 
                           B(3), MUX00(2) => B(2), MUX00(1) => B(1), MUX00(0) 
                           => B(0), MUX01(15) => C(15), MUX01(14) => C(14), 
                           MUX01(13) => C(13), MUX01(12) => C(12), MUX01(11) =>
                           C(11), MUX01(10) => C(10), MUX01(9) => C(9), 
                           MUX01(8) => C(8), MUX01(7) => C(7), MUX01(6) => C(6)
                           , MUX01(5) => C(5), MUX01(4) => C(4), MUX01(3) => 
                           C(3), MUX01(2) => C(2), MUX01(1) => C(1), MUX01(0) 
                           => C(0), MUX02(15) => Somma_15_port, MUX02(14) => 
                           Somma_14_port, MUX02(13) => Somma_13_port, MUX02(12)
                           => Somma_12_port, MUX02(11) => Somma_11_port, 
                           MUX02(10) => Somma_10_port, MUX02(9) => Somma_9_port
                           , MUX02(8) => Somma_8_port, MUX02(7) => Somma_7_port
                           , MUX02(6) => Somma_6_port, MUX02(5) => Somma_5_port
                           , MUX02(4) => Somma_4_port, MUX02(3) => Somma_3_port
                           , MUX02(2) => Somma_2_port, MUX02(1) => Somma_1_port
                           , MUX02(0) => Somma_0_port, MUX03(15) => D(15), 
                           MUX03(14) => D(14), MUX03(13) => D(13), MUX03(12) =>
                           D(12), MUX03(11) => D(11), MUX03(10) => D(10), 
                           MUX03(9) => D(9), MUX03(8) => D(8), MUX03(7) => D(7)
                           , MUX03(6) => D(6), MUX03(5) => D(5), MUX03(4) => 
                           D(4), MUX03(3) => D(3), MUX03(2) => D(2), MUX03(1) 
                           => D(1), MUX03(0) => D(0), MUX10(15) => A(15), 
                           MUX10(14) => A(14), MUX10(13) => A(13), MUX10(12) =>
                           A(12), MUX10(11) => A(11), MUX10(10) => A(10), 
                           MUX10(9) => A(9), MUX10(8) => A(8), MUX10(7) => A(7)
                           , MUX10(6) => A(6), MUX10(5) => A(5), MUX10(4) => 
                           A(4), MUX10(3) => A(3), MUX10(2) => A(2), MUX10(1) 
                           => A(1), MUX10(0) => A(0), MUX11(15) => 
                           Somma_15_port, MUX11(14) => Somma_14_port, MUX11(13)
                           => Somma_13_port, MUX11(12) => Somma_12_port, 
                           MUX11(11) => Somma_11_port, MUX11(10) => 
                           Somma_10_port, MUX11(9) => Somma_9_port, MUX11(8) =>
                           Somma_8_port, MUX11(7) => Somma_7_port, MUX11(6) => 
                           Somma_6_port, MUX11(5) => Somma_5_port, MUX11(4) => 
                           Somma_4_port, MUX11(3) => Somma_3_port, MUX11(2) => 
                           Somma_2_port, MUX11(1) => Somma_1_port, MUX11(0) => 
                           Somma_0_port, MUX12(15) => F(15), MUX12(14) => F(14)
                           , MUX12(13) => F(13), MUX12(12) => F(12), MUX12(11) 
                           => F(11), MUX12(10) => F(10), MUX12(9) => F(9), 
                           MUX12(8) => F(8), MUX12(7) => F(7), MUX12(6) => F(6)
                           , MUX12(5) => F(5), MUX12(4) => F(4), MUX12(3) => 
                           F(3), MUX12(2) => F(2), MUX12(1) => F(1), MUX12(0) 
                           => F(0), MUX13(15) => E(15), MUX13(14) => E(14), 
                           MUX13(13) => E(13), MUX13(12) => E(12), MUX13(11) =>
                           E(11), MUX13(10) => E(10), MUX13(9) => E(9), 
                           MUX13(8) => E(8), MUX13(7) => E(7), MUX13(6) => E(6)
                           , MUX13(5) => E(5), MUX13(4) => E(4), MUX13(3) => 
                           E(3), MUX13(2) => E(2), MUX13(1) => E(1), MUX13(0) 
                           => E(0), clock => CLK, reset => RST, SEL00 => 
                           sel00_wire, SEL01 => sel01_wire, SEL10 => sel10_wire
                           , SEL11 => sel11_wire, SUM(15) => Somma_15_port, 
                           SUM(14) => Somma_14_port, SUM(13) => Somma_13_port, 
                           SUM(12) => Somma_12_port, SUM(11) => Somma_11_port, 
                           SUM(10) => Somma_10_port, SUM(9) => Somma_9_port, 
                           SUM(8) => Somma_8_port, SUM(7) => Somma_7_port, 
                           SUM(6) => Somma_6_port, SUM(5) => Somma_5_port, 
                           SUM(4) => Somma_4_port, SUM(3) => Somma_3_port, 
                           SUM(2) => Somma_2_port, SUM(1) => Somma_1_port, 
                           SUM(0) => Somma_0_port);
   FSM : fsm1 port map( clock => CLK, reset => RST, S00 => sel00_wire, S01 => 
                           sel01_wire, S10 => sel10_wire, S11 => sel11_wire);

end SYN_behavior;
