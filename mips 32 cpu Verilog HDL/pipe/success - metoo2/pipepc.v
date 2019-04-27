module pipepc(npc, clk, clrn, wpc, pc);
  input       clk, wpc, clrn;
  input       [31:0] npc;
  output      [31:0] pc;
  dffe32 PC(npc, clk, clrn, wpc, pc);
  
endmodule