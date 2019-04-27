library verilog;
use verilog.vl_types.all;
entity plctrl is
    port(
        mwreg           : in     vl_logic;
        mrn             : in     vl_logic_vector(4 downto 0);
        ern             : in     vl_logic_vector(4 downto 0);
        ewreg           : in     vl_logic;
        em2reg          : in     vl_logic;
        mm2reg          : in     vl_logic;
        rsrtequ         : in     vl_logic;
        Funct           : in     vl_logic_vector(5 downto 0);
        Op              : in     vl_logic_vector(5 downto 0);
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        wreg            : out    vl_logic;
        m2reg           : out    vl_logic;
        wmem            : out    vl_logic;
        aluc            : out    vl_logic_vector(3 downto 0);
        regrt           : out    vl_logic;
        aluimm          : out    vl_logic;
        fwda            : out    vl_logic_vector(1 downto 0);
        fwdb            : out    vl_logic_vector(1 downto 0);
        nostall         : out    vl_logic;
        sext            : out    vl_logic;
        pcsource        : out    vl_logic_vector(1 downto 0);
        shift           : out    vl_logic;
        jal             : out    vl_logic
    );
end plctrl;
