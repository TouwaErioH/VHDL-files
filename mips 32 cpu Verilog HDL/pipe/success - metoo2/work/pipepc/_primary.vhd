library verilog;
use verilog.vl_types.all;
entity pipepc is
    port(
        npc             : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        clrn            : in     vl_logic;
        wpc             : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0)
    );
end pipepc;
