library verilog;
use verilog.vl_types.all;
entity pipeir is
    port(
        pc4             : in     vl_logic_vector(31 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        wir             : in     vl_logic;
        clk             : in     vl_logic;
        clrn            : in     vl_logic;
        dpc4            : out    vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0)
    );
end pipeir;
