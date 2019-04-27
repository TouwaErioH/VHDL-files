module plpc(npc, clk, clrn, wpc, pc);
  input       clk, wpc, clrn;
  input       [31:0] npc;
  output      [31:0] pc;
  dffe32 PC(npc, clk, clrn, wpc, pc);
  
endmodule

module plir(pc4, instr, wir, clk, clrn, dpc4, inst); 
    input [31:0] pc4, instr; 
    input        wir, clk, clrn; 
    output[31:0] dpc4, inst; 
    dffe32 pc_plus4(pc4, clk, clrn, wir, dpc4); 
    dffe32 instruction(instr, clk, clrn, wir, inst);

endmodule	

module plieReg(dwreg, dm2reg, dwmem, daluc, daluimm, da, db, dimm, drn, 
                 dshift, djal, dpc4, clk, clrn, ewreg, em2reg, ewmem, 
                 ealuc, ealuimm, ea, eb, eimm, ern, eshift, ejal, epc4); 
       input  [31:0] da, db, dimm, dpc4; 
       input  [ 4:0] drn;
       input  [ 3:0] daluc;
       input         dwreg, dm2reg, dwmem, daluimm, dshift, djal;
       input         clk, clrn; 
       output [31:0] ea, eb, eimm, epc4;
       output [ 4:0] ern; 
       output [ 3:0] ealuc;
       output        ewreg, em2reg, ewmem, ealuimm, eshift, ejal; 
       reg    [31:0] ea, eb, eimm, epc4;
       reg    [ 4:0] ern;
       reg    [ 3:0] ealuc;	   
       reg           ewreg, em2reg, ewmem, ealuimm, eshift, ejal;
	   
	   always @(posedge clrn or posedge clk) 
           if (clrn == 1) begin
               ewreg   <= 0;      
			   em2reg <= 0;
			   ewmem   <= 0;      
			   ealuc  <= 0; 
               ealuimm <= 0;      
			   ea     <= 0; 
               eb      <= 0;      
			   eimm   <= 0; 
               ern     <= 0;      
			   eshift <= 0; 
               ejal    <= 0;      
			   epc4   <= 0; 
			   
                          end 
		   else begin 
             ewreg   <= dwreg;      
			 em2reg <= dm2reg; 
             ewmem   <= dwmem;      
			 ealuc  <= daluc; 
             ealuimm <= daluimm;    
			 ea     <= da; 
             eb      <= db;         
			 eimm   <= dimm; 
             ern     <= drn;        
			 eshift <= dshift; 
             ejal    <= djal;       
			 epc4   <= dpc4; 
			 
                end 
endmodule

module plemReg(ewreg, em2reg, ewmem, ealu, eb, ern, clk, clrn, 
               mwreg, mm2reg, mwmem, malu, mb, mrn); 
       input  [31:0] ealu, eb; 
       input  [ 4:0] ern; 
       input         ewreg, em2reg, ewmem; 
       input         clk, clrn; 
       output [31:0] malu, mb;
	   output [ 4:0] mrn; 
       output        mwreg, mm2reg, mwmem; 
       reg    [31:0] malu, mb; 
       reg    [ 4:0] mrn; 
       reg           mwreg, mm2reg, mwmem; 
	   
   always @(posedge clrn or posedge clk) 
          if(clrn == 1) begin 
              mwreg <= 0;        
			  mm2reg  <= 0; 
              mwmem <= 0;        
			  malu    <= 0; 
              mb    <= 0;        
			  mrn     <= 0; 
          end else begin 
              mwreg <= ewreg;   
			  mm2reg  <= em2reg; 
              mwmem <= ewmem;    
			  malu    <= ealu; 
              mb    <= eb;       
			  mrn     <= ern; 
          end 
endmodule

module plmwReg(mwreg, mm2reg, mmo, malu, mrn, clk, clrn, 
               wwreg, wm2reg, wmo, walu, wrn); 
           input  [31:0] mmo, malu;
           input  [ 4:0] mrn;
           input         mwreg, mm2reg;
           input         clk, clrn;
           output [31:0] wmo, walu;
           output [ 4:0] wrn; 
           output        wwreg, wm2reg; 
           reg    [31:0] wmo, walu; 
           reg    [ 4:0] wrn; 
           reg           wwreg, wm2reg; 
   always @(posedge clrn or posedge clk) 
       if (clrn == 1) begin
	       wwreg <= 0;      
		   wm2reg <= 0;
		   wmo   <= 0;      
		   walu   <= 0;
		   wrn   <= 0;
		   end else begin
	       wwreg <= mwreg;  
		   wm2reg <= mm2reg;
		   wmo   <= mmo;    
		   walu   <= malu;
		   wrn   <= mrn;
		   end
endmodule
	