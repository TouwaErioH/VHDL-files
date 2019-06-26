module light(clk100khz,light);
  input clk100khz;
  output[7:0] light;
  parameter len=7;
  reg[7:0]light;
  reg[25:0]count,count1;
  reg clk,clk1,clk2,b;
  reg[2:0]flag;

  initial  b=1'b1;
 

always@(posedge clk100khz)
  begin
     if(count=='d49999)
       begin clk1=~clk1;count<=0;end
    else
       begin count<=count+1'b1;end
   end
always@(posedge clk100khz)
  begin
    if(count1=='d4999)
       begin clk2=~clk2;count1<=0;end
    else
       begin count1<=count1+1'b1;end
   end
always@(posedge clk100khz)
  begin
     if(b)
          clk<=clk1;
     else
          clk<=clk2;
     end
always@(posedge clk)
begin 
 if(flag==3'b000)
 begin
  light<=8'b11111111;
   if(light[7]==1)
    begin light<=8'b00000000;flag=3'b001; end
end

 else if(flag==3'b001)
 begin
  if(light==8'b00000000)
  light<=8'b10000000;
  else 
  light<=light/2;
  if(light[0]==1)
  flag=3'b010;
 end

 else if(flag==3'b010)
 begin
  if(light[7]==1)
begin
light<=8'b01010101;
 flag<=3'b011;
end
else
 light<=8'b10101010;

 end

 
else if(flag==3'b011)
 begin
 flag<=3'b000;
 b=~b;
 end
end

endmodule