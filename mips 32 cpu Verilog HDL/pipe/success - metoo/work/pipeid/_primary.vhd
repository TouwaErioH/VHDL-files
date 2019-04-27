library verilog;
use verilog.vl_types.all;
entity pipeid is
    port(
        reg_sel         : in     vl_logic_vector(4 downto 0);
        reg_data        : out    vl_logic_vector(31 downto 0);
        wdi             : in     vl_logic_vector(31 downto 0);
        wrn             : in     vl_logic_vector(4 downto 0);
        wwreg           : in     vl_logic;
        mwreg           : in     vl_logic;
        mrn             : in     vl_logic_vector(4 downto 0);
        ern             : in     vl_logic_vector(4 downto 0);
        ewreg           : in     vl_logic;
        em2reg          : in     vl_logic;
        mm2reg          : in     vl_logic;
        dpc4            : in     vl_logic_vector(31 downto 0);
        inst            : in     vl_logic_vector(31 downto 0);
        ealu            : in     vl_logic_vector(31 downto 0);
        malu            : in     vl_logic_vector(31 downto 0);
        mmo             : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        clrn            : in     vl_logic;
        bpc             : out    vl_logic_vector(31 downto 0);
        jpc             : out    vl_logic_vector(31 downto 0);
        pcsource        : out    vl_logic_vector(1 downto 0);
        nostall         : out    vl_logic;
        wreg            : out    vl_logic;
        m2reg           : out    vl_logic;
        wmem            : out    vl_logic;
        aluc            : out    vl_logic_vector(3 downto 0);
        aluimm          : out    vl_logic;
        a               : out    vl_logic_vector(31 downto 0);
        b               : out    vl_logic_vector(31 downto 0);
        imm             : out    vl_logic_vector(31 downto 0);
        rn              : out    vl_logic_vector(4 downto 0);
        shift           : out    vl_logic;
        jal             : out    vl_logic
    );
end pipeid;
