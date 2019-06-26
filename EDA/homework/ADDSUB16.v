module ADDSUB16(ctl,CLK,RST,EN,LOAD,COUT,DOUT,DATA);
input CLK,RST,EN,LOAD,ctl;
input[15:0] DATA;
output [15:0] DOUT;
output COUT;
reg[15:0] Q1;
reg COUT;
assign DOUT=Q1;
always @ (posedge CLK or negedge RST)
begin
if(!RST) Q1 <= 16'b0000000000000000;
else if(EN) 
begin
 if(!LOAD) Q1=DATA;
 else if(ctl) 
 begin
 if(Q1<16'b1111111111111111) Q1<=Q1+1;
 else Q1<=16'b0000000000000000; 
 end    
 else begin
  if(Q1>16'b0000000000000000) Q1<=Q1-1;
  else Q1=16'b1111111111111111;
end
end
end

always @ (Q1)
if((Q1==16'b1111111111111111)&&ctl) COUT = 1'b1;     // =
else if((Q1==16'b0000000000000000)&&!ctl) COUT=1'b1;
else COUT=1'b0;
 
endmodule