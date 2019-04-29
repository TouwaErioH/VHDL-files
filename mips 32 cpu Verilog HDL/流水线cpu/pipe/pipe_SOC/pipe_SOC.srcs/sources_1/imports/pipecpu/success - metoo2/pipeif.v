module pipeif(pcsource, pc, bpc, rpc, jpc, npc, pc4); 
    input  [31:0] pc, bpc, rpc, jpc; 
    input  [1 :0] pcsource;
	output [31:0] npc, pc4; 
	wire          z;
    mux4 #(32) NPC(pc4, bpc, rpc, jpc, pcsource, npc); 
    alu PCPLUS4(pc, 32'h4, 4'b0001, pc4, z);
	
endmodule