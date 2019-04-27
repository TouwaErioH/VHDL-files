module pipeexe(ealuc, ealuimm, ea, eb, eimm, eshift, ern0, epc4, ejal, ern, ealu);
    input  [31:0] ea, eb, eimm, epc4;
	input  [ 4:0] ern0;
	input  [ 3:0] ealuc;
	input         ealuimm, eshift, ejal;
	output [31:0] ealu;
	output [ 4:0] ern;
	wire   [31:0] alua, alub, sa, ealu0, epc8;
	wire          z1,z2;
	//assign	sa =  {eimm[ 5 : 0],eimm[ 31 : 6 ] };	//	s h i f t	a mo u n t
	//cla32    ret_addr	(epc4, 32'h4,1'b0,epc8);
	assign       sa = {eimm[5:0], eimm[5:0], eimm[5:0],eimm[5:0], eimm[1:0],eimm[10:6]};
	alu ret_addr(epc4, 32'h4, 4'b0001, epc8, z1);
	mux2 #(32) alu_ina(ea, sa, eshift, alua);
	mux2 #(32) alu_inb(eb, eimm, ealuimm, alub);
	alu al_unit(alua, alub, ealuc, ealu0, z2);
	mux2 #(32) save_pc8(ealu0, epc8, ejal, ealu);
	assign ern = ern0 | {5{ejal}};
	
endmodule