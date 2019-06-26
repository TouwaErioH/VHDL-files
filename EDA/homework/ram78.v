module RAM78(output wire[7:0] Q,input wire[7:0] D,input wire [6:0] A,input wire CLK,WREN);
reg[7:0] mem[127:0] /* synthesis ram_init_file="data7X8.mif */;
always@(posedge CLK)
if(WREN) mem[A] <= D;
assign Q=mem[A];
endmodule
