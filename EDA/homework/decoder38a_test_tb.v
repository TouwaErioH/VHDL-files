`timescale 1ns/1ps
module decoder38a_test_tb;

    reg [2:0] data_in;
    wire [7:0] result;
	
    decoder38a DUT (
        .data_in(data_in), 
        .result(result)
    );

    initial begin

        data_in = 0;
		
        #20;

        data_in = 3'b000;
          #20;

          data_in = 3'b001;
          #20;

          data_in = 3'b010;
          #20;

          data_in = 3'b011;
          #20;

          data_in = 3'b100;
          #20;

          data_in = 3'b101;
          #20;

          data_in = 3'b110;
          #20;

          data_in = 3'b111;
    end
endmodule
