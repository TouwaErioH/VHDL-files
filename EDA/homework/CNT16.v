module CNT16(CLK,RST,EN,COUT,DOUT,DATA);
input CLK,RST,EN;
input[15:0] DATA;
output [15:0] DOUT;
output COUT;
reg[15:0] Q1;
reg COUT;
wire LOAD;
assign DOUT=Q1;
always @ (posedge CLK or negedge RST or posedge LOAD)
begin
if(!RST) Q1 <= 16'b0000000000000000;
else if(LOAD) Q1 <= DATA;
else if(EN) begin
 if(Q1<16'b1111111111111111) Q1<=Q1+1;
 else Q1<=16'b0000000000000000; end       //<=

end

assign LOAD=(Q1==0);   //=COUT

always @ (Q1)
if(Q1==16'b1111111111111111) COUT = 1'b1;     // =
else COUT=1'b0;
 
endmodule