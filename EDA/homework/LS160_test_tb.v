`timescale 1ns/1ps
module LS160_test_tb;


    reg CLK,RST,ENP,ENT,LOAD;
    reg [3:0] DATA;
	wire [3:0] DOUT;
	wire COUT;
	
    LS160 DUT (
		.CLK(CLK),
		.RST(RST),
		.ENP(ENP),
		.ENT(ENT),
		.LOAD(LOAD),
		.COUT(COUT),
		.DOUT(DOUT),
		.DATA(DATA)
    );

    initial begin
        DATA = 0;
		CLK=1'b0;
		ENP=1'b1;
		ENT=1'b1;
		RST=1'b1;
		LOAD=1'b1;
        #60;
        DATA = 4'b0001;
          #60;
          DATA = 4'b0100;
          #60;
		RST=~RST;
		#20
		RST=~RST;
          DATA = 4'b0011;
          #60;
          LOAD=~LOAD;
		  #250
		  LOAD=~LOAD;
		  #10
          DATA = 4'b0100;
          #60;
          DATA = 4'b0101;
    end
		always #10 CLK=~CLK;
		always #30 ENP=~ENP;
		always #20 ENT=~ENT;

	
endmodule
