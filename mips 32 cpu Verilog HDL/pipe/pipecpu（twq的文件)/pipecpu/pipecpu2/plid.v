module plid(reg_sel, reg_data, wdi, wrn, wwreg, mwreg, mrn, ern, ewreg, em2reg, mm2reg, dpc4, inst,
              ealu, malu, mmo, clk, clrn, bpc, jpc, pcsource, 
              nostall, wreg, m2reg, wmem, aluc, aluimm, a, b, imm, rn, 
			  shift, jal);
              input         wwreg;
			  input  [31:0] dpc4, inst, ealu, malu, mmo, wdi;
              input  [4 :0] ern, mrn, wrn; 
              input         mwreg, ewreg, em2reg, mm2reg;
              input         clk, clrn;
              wire   [31:0] qa, qb;
              output [31:0] bpc, jpc, a, b, imm; 
              output [4 :0] rn; 
              output [3 :0] aluc;
              output [1 :0] pcsource;
              output nostall, wreg, m2reg, wmem, aluimm, shift, jal; 
              wire   [ 5:0] op, func;
              wire   [ 4:0] rs, rt, rd; 
              wire   [31:0] br_offset;
              wire   [15:0] extl6; 
              wire   [ 1:0] fwda, fwdb; 
              wire regrt, sext, rsrtequ, e;
              assign func = inst[5:0]; 
              assign op   = inst[31:26];
              assign rs   = inst[25:21];
              assign rt   = inst[20:16];
              assign rd   = inst[15:11];
              assign jpc  = {dpc4[31:28],inst[25:0],2'd0};
			  
			  wire   z;
			  input  [4:0] reg_sel;
			  output [31:0] reg_data;
			  
       plctrl cu(mwreg, mrn, ern, ewreg, em2reg, mm2reg, rsrtequ, func, 
                   op, rs, rt, wreg, m2reg, wmem, aluc, regrt, aluimm, 
                   fwda, fwdb, nostall, sext, pcsource, shift, jal); 
				   
	   RF  U_RF(clk, rst, wwreg, rs, rt, wrn, wdi, qa, qb, reg_sel, reg_data);
       mux2 #(5)  des_reg_no(rd, rt, regrt, rn);
       mux4 #(32) alu_a(qa, ealu, malu, mmo, fwda, a); 
       mux4 #(32) alu_b(qb, ealu, malu, mmo, fwdb, b); 
              assign rsrtequ = ~|(a^b); // rsrtequ = (a==b) 
              assign e = sext & inst[15]; 
              assign ext16 = {16{e}}; 
              assign imm = {ext16,inst[15:0]}; 
              assign br_offset ={imm[29:0],2'd0};
              alu br_addr(dpc4, br_offset, 4'b0001, bpc, z);
endmodule 
 



   
 


 
