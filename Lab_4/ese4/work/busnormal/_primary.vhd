library verilog;
use verilog.vl_types.all;
entity busnormal is
    port(
        ck              : in     vl_logic;
        rst             : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : out    vl_logic_vector(7 downto 0);
        C               : out    vl_logic_vector(7 downto 0)
    );
end busnormal;
