module LS160(CLK,RST,ENP,ENT,LOAD,COUT,DOUT,DATA);
input CLK,RST,ENP,ENT,LOAD;
input[3:0] DATA;
output [3:0] DOUT;
output COUT;
reg[3:0] Q1;
reg COUT;
assign DOUT=Q1;
always @ (posedge CLK or negedge RST)
begin
if(!RST) Q1 <= 4'b0000;
else if(ENP && ENT) begin
if(!LOAD) Q1 <= DATA;
else if(Q1<4'b1001) Q1<=Q1+1;
 else Q1<=4'b0000; end       //<=

end

always @ (Q1)
if(Q1==4'b1001) COUT = 1'b1;     // =
else COUT=1'b0;
 
endmodule