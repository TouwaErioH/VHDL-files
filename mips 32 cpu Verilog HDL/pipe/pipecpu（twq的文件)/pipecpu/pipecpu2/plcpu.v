module plcpu( clk, rst, instr, readdata, PC, MemWrite, aluout, writedata, reg_sel, reg_data);
         
   input      clk;          // clock
   input      rst;          // reset
   
   input [31:0]  instr;     // instruction
   input [31:0]  readdata;  // data from data memory
   
   output [31:0] PC;        // PC address
   output        MemWrite;  // memory write
   output [31:0] aluout;    // ALU output
   output [31:0] writedata; // data to data memory
   
   input  [4:0] reg_sel;    // register selection (for debug use)
   output [31:0] reg_data;  // selected register data (for debug use)b v
	
	
	wire [31:0] bpc, jpc, npc, pc4, dpc4, inst, da, db, dimm, ea, eb, eimm; 
    wire [31:0] epc4, wmo, wdi;
    wire [ 4:0] drn, ern0, ern, mrn, wrn;
    wire [ 3:0] daluc, ealuc; // daluc = aluc 
    wire [ 1:0] pcsource;
    wire        wpcir; 
    wire        dwreg, dm2reg, dwmem, daluimm, dshift, djal; 
    wire        ewreg, em2reg, ewmem, ealuimm, eshift, ejal;
    wire        mwreg, mm2reg; 
    wire        wwreg, wm2reg;
	wire [31:0] walu, ealu;
	/*wire [ 4:0]  rs;          // rs
    wire [ 4:0]  rt;          // rt
	wire [31:0] qa, qb;
	assign rs = instr[25:21];  // rs
    assign rt = instr[20:16];  // rt
	*/
    plpc PCreg(npc, clk, rst, wpcir, PC); 
	
    plif IF(pcsource, PC, bpc, da, jpc, npc, pc4);
	
    plir INSreg(pc4, instr, wpcir, clk, rst, dpc4, inst); 
	
    plid ID(reg_sel, reg_data, wdi, wrn, wwreg, mwreg, mrn, ern, ewreg, em2reg, mm2reg, dpc4, inst,
                    ealu, aluout, readdata, clk, rst, 
                    bpc, jpc, pcsource, wpcir, dwreg, dm2reg, dwmem, 
                    daluc, daluimm, da, db, dimm, drn, dshift, djal); 
	
    plieReg IEreg(dwreg, dm2reg, dwmem, daluc, daluimm, da, db, dimm, 
                     drn, dshift, djal, dpc4, clk, rst, 
                     ewreg, em2reg, ewmem, ealuc, ealuimm, ea, eb, eimm, 
                     ern0, eshift, ejal, epc4); 
	
	//RF  U_RF(clk, rst, wwreg, rs, rt, wrn, wdi, qa, qb, reg_sel, reg_data);
	
    plexe EXE(ealuc, ealuimm, ea, eb, eimm, eshift,ern0, epc4, 
                      ejal, ern, ealu); 
	
    plemReg EMreg(ewreg, em2reg, ewmem, ealu, eb, ern, clk, rst,
                     mwreg, mm2reg, MemWrite, aluout, writedata, mrn); 
	
    plmwReg MWreg(mwreg, mm2reg, readdata, aluout, mrn, clk, rst, 
                  wwreg, wm2reg, wmo, walu, wrn);
	
    mux2 #(32) wb_stage(walu, wmo, wm2reg, wdi);
	
	 
    
	endmodule
 
