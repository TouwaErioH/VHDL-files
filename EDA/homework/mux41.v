module mux41 (Y,A,B,C,D,S3,S2,S1,S0);
   	output reg Y;       
	input A,B,C,D,S3,S2,S1,S0;  //有优先级顺序的
	always@(*)
	begin
	if(S3==0)
	Y=D;
	else if(S2==0)
	Y=C;
	else if(S1==0)
	Y=B;
	else if(S0==0)
	Y=A;
	else 
	Y=1'b0;
    end
endmodule