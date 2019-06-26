module tribus4(CLK,ENA,D,A,WREN1,WREN2,WREN3,WREN4,qout
               );

input CLK,WREN1,WREN2,WREN3,WREN4;
input [7:0] D;
input[6:0] A; //address
input [1:0] ENA;
output [7:0] qout;
reg[7:0] qout;

wire [7:0] Q1,Q2,Q3,Q4;


RAM78 U1 (.Q(Q1),.D(D),.A(A),.CLK(CLK),.WREN(WREN1));   //ENA选择ram，选中后读取数据Q。当wren，读取的同时在相同位置写入数据D

RAM78 U2 (.Q(Q2),.D(D),.A(A),.CLK(CLK),.WREN(WREN2));    //每个ram有独立的wren。不用ENA选择写入哪个RAM，只选择读哪个。

RAM78 U3 (.Q(Q3),.D(D),.A(A),.CLK(CLK),.WREN(WREN3));

RAM78 U4 (.Q(Q4),.D(D),.A(A),.CLK(CLK),.WREN(WREN4));

always@(ENA,Q1)
if(ENA==2'b00)
qout=Q1;
else  qout=8'hz;
always@(ENA,Q2)
if(ENA==2'b01)
qout=Q2;
else  qout=8'hz;
always@(ENA,Q3)
if(ENA==2'b10)
qout=Q3;
else  qout=8'hz;
always@(ENA,Q4)
if(ENA==2'b11)
qout=Q4;
else  qout=8'hz;

endmodule




















                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
