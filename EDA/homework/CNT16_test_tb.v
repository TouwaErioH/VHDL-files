`timescale 1ns/1ps
module CNT16_test_tb;


    reg CLK,RST,EN;
    reg [15:0] DATA;
	wire [15:0] DOUT;
	wire COUT;
	
    CNT16 DUT (
		.CLK(CLK),
		.RST(RST),
		.EN(EN),
		.COUT(COUT),
		.DOUT(DOUT),
		.DATA(DATA)
    );

    initial begin

        DATA = 0;
		CLK=1'b0;
		EN=1'b0;
		RST=1'b1;
		
		
        #60;
        DATA = 16'b0000000000000001;
          #60;
          DATA = 16'b0000000000000010;
          #60;

          DATA = 16'b0000000000000100;
          #60;
		RST=~RST;
		#20
		RST=~RST;
          DATA = 16'b0000000000001000;
          #60;
          DATA = 16'b0000000000010000;
          #60;

          DATA = 16'b0000000000100000;
          #60;

          DATA = 16'b0000000001000000;
          #60;

          DATA = 16'b0000000010000000;
    end
		always #10 CLK=~CLK;
		//always #200 RST=~RST;
		always #30 EN=~EN;
		//always #300 LOAD=~LOAD;

	
endmodule
