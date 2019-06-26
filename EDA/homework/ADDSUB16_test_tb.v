`timescale 1ns/1ps
module ADDSUB16_test_tb;


    reg CLK,RST,EN,ctl,LOAD;
    reg [15:0] DATA;
	wire [15:0] DOUT;
	wire COUT;
	
    ADDSUB16 DUT (
	.ctl(ctl),
		.CLK(CLK),
		.RST(RST),
		.EN(EN),
		.LOAD(LOAD),
		.COUT(COUT),
		.DOUT(DOUT),
		.DATA(DATA)
    );

    initial begin
        ctl=1'b0;
        DATA = 0;
		CLK=1'b0;
		EN=1'b0;
		RST=1'b1;
		LOAD=1'b1;
		
		
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
          DATA = 16'b0000000000011000;
          #60;
		  LOAD=~LOAD;
		  #60
		  LOAD=~LOAD;
		  #10
          DATA = 16'b0000000000010000;
          #6000;
          ctl=~ctl;
		  #40000
		  ctl=~ctl;
          
    end
		always #10 CLK=~CLK;
		//always #200 RST=~RST;
		always #30 EN=~EN;
		//always #300 LOAD=~LOAD;

	
endmodule
