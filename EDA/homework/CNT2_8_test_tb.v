`timescale 1ns/1ps
module CNT2_8_test_tb;


    reg CLK,RST,EN,LOAD;
    reg [7:0] DATA;
	wire [7:0] DOUT;
	wire COUT;
	
    CNT2_8 DUT (
		.CLK(CLK),
		.RST(RST),
		.EN(EN),
		.LOAD(LOAD),
		.COUT(COUT),
		.DOUT(DOUT),
		.DATA(DATA)
    );

    initial begin

        DATA = 0;
		CLK=1'b0;
		EN=1'b0;
		RST=1'b1;
		LOAD=1'b0;
		
		
        #60;
        DATA = 8'b00000001;
          #60;
          DATA = 8'b00000010;
          #60;

          DATA = 8'b00000100;
          #60;
		RST=~RST;
		#20
		RST=~RST;
          DATA = 8'b00001000;
          #60;
          LOAD=~LOAD;
		  #20
		  LOAD=~LOAD;
		  #10
          DATA = 8'b00010000;
          #60;

          DATA = 8'b00100000;
          #60;

          DATA = 8'b01000000;
          #60;

          DATA = 8'b10000000;
    end
		always #10 CLK=~CLK;
		//always #200 RST=~RST;
		always #30 EN=~EN;
		//always #300 LOAD=~LOAD;

	
endmodule
