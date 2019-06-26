`timescale 1ns/1ps
module tribus4_test_tb;


    reg CLK,WREN1,WREN2,WREN3,WREN4;
    reg [7:0] D;
	reg [6:0] A;
	reg[1:0] ENA;
	wire [7:0]qout;
	
    tribus4 DUT (
	.CLK(CLK),.ENA(ENA),.D(D),.A(A),.WREN1(WREN1),.WREN2(WREN2),.WREN3(WREN3),.WREN4(WREN4),.qout(qout)
    );

    initial begin
	    WREN1=2'b0; WREN2=2'b0; WREN3=2'b0; WREN4=2'b0;
        A=7'b0000000;
        D = 8'b00000000;
		CLK=2'b0;
		ENA=2'b00;
		
		/*#100 ENA=2'b01;
			#100 ENA=2'b10;
				#100 ENA=2'b11;
					#100 ENA=2'b00;
		
		#100 ENA=2'b01;
			#100 ENA=2'b10;
				#100 ENA=2'b11;
					#100 ENA=2'b00;
		
		#100 ENA=2'b01;
			#100 ENA=2'b10;
				#100 ENA=2'b11;
					#100 ENA=2'b00;
		
		#100 ENA=2'b01;
			#100 ENA=2'b10;
				#100 ENA=2'b11;
					#100 ENA=2'b00;  */


          
    end
	    always #80 ENA=(ENA+1)%4;
		always #10 CLK=~CLK;
        always #100 D=D+1;
		always #200 A=A+1;
		always #30 WREN1=~WREN1;
		always #40 WREN2=~WREN2;
		always #50 WREN3=~WREN3;
		always #60 WREN4=~WREN4;
		


	
endmodule
