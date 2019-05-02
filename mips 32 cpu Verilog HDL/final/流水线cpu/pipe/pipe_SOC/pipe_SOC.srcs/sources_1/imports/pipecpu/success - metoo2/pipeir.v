module pipeir(pc4, instr, wir, clk, clrn, dpc4, inst); 
    input [31:0] pc4, instr; 
    input        wir, clk, clrn; 
    output[31:0] dpc4, inst; 
    dffe32 pc_plus4(pc4, clk, clrn, wir, dpc4); 
    dffe32 instruction(instr, clk, clrn, wir, inst);

endmodule	