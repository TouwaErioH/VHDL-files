`timescale 1ns/1ps
module mux41_test_tb;
	reg a,b,c,d,s3,s2,s1,s0;
	wire y;
	mux41 DUT  //Device Under Test
	(
		.A(a),
		.B(b),
		.C(c),
		.D(d),
		.S3(s3),
		.S2(s2),
		.S1(s1),
		.S0(s0),
		.Y(y)
	);

	initial begin
		a = 1'b1;
		b = 1'b1;
		c = 1'b0;
		d = 1'b0;
		s0 = 1'b1;
		s1 = 1'b0;
		s2 = 1'b0;
		s3 = 1'b0;
		#450 $finish;
	end

	always #20 a = ~a;
	always #40 b = ~b;
	always #60 c = ~c;
	always #80 d = ~d;
	always #30 s0 = ~s0;
	always #40 s1 = ~s1;
	always #50 s2 = ~s2;
	always #60 s3 = ~s3;

	always @(y);
//		$finish;
//	end
endmodule