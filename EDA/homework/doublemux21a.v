module doublemux21a(a1,a2,a3,s0,s1,Y);
	input a1,a2,a3,s0,s1;
	output Y;
	wire tp=s0 ? a3 : a2;
	wire Y = s1 ? tp : a1;
endmodule