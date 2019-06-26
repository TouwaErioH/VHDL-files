module decoder38a(data_in,result);
input [2:0]data_in;
output reg[7:0]result;
always@(*)
 begin
 case(data_in)
  3'b000: result = 8'b00000001;
  3'b001: result = 8'b00000010;
  3'b010: result = 8'b00000100;
  3'b011: result = 8'b00001000;
  3'b100: result = 8'b00010000;
  3'b101: result = 8'b00100000;
  3'b110: result = 8'b01000000;
  3'b111: result = 8'b10000000;
 endcase
 end
endmodule
