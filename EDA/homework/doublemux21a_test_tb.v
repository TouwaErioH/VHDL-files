`timescale 1ns/1ps
module doublemux21a_test_tb;
	reg a1,a2,a3,s1,s0;
	wire y;
	doublemux21a DUT  //Device Under Test
	(
		.a1(a1),
		.a2(a2),
		.a3(a3),
		.s1(s1),
		.s0(s0),
		.Y(y)
	);

	initial begin
		a1 = 1'b1;
		a2 = 1'b1;
		a3 = 1'b0;
		s0 = 1'b0;
		s1 = 1'b0;
		#450 $finish;
	end

	always #20 a1 = ~a1;
	always #40 a2 = ~a2;
	always #60 a3 = ~a3;
	always #30 s0 = ~s0;
	always #20 s1 = ~s1;

	always @(y);
//		$finish;
//	end
endmodule