module traffic(clk1hz,clk1khz,dout,scan,light,mai,side,rst);
 input clk1hz,clk1khz,mai,side,rst;
 output[7:0] dout;
 output[5:0] scan;
 output[7:0] light;
 reg[7:0]dout;
 reg[5:0] scan;
 reg[7:0]light;
 reg[3:0] time1,time2,time3,time4,data; //time1，2是主干道各个位十位。
 reg flag,flagcc;  //flagcc控制倒计时。倒计时为0，flagcc为1，则锁到DD
 reg[3:0] temp;
 reg [1:0]func;
reg [1:0]old;
reg [1:0]cnt;

always@(mai,side)
 func<={mai,side};
//initial不能用于综合？ 反正就是没有起到作用。和always并行。所以默认值都是000。所以func初始必须为11.
/*initial 
begin  cnt=2'b11; old=2'b11;flagcc=1'b0;flag=1'b0; //倒计时的时候不要换func
//time1=4'b1101;time2=4'b1101; time3=4'b1101;time4=4'b1101;  不知道为什么出了问题
end //假设func初始为00，这样设置old为11，体现变化*/

always@(temp)
begin
     scan<= {temp[3],temp[2],2'b00,temp[1],temp[0]};
end
always@(posedge clk1khz)
begin
     cnt<=cnt+2'b01;

    case(cnt)
        2'b00: begin temp<=4'b0001;data<=time1;end
        2'b01: begin temp<=4'b0010;data<=time2;end
        2'b10: begin temp<=4'b0100;data<=time3;end
        2'b11: begin temp<=4'b1000;data<=time4;end
    endcase
end

always@(posedge clk1hz)

begin
if(func!=old)
begin
 if(func==2'b00)
begin
 if(old==2'b01)   // 01 
 begin time3<=4'b0100; time4<=0; flag<=0; old<=2'b00;   time1<=4'b1101;time2<=4'b1101; flagcc<=1; end
 else if(old==2'b11)
 begin
 if(flag==0)   begin time3<=4'b0100; time4<=0;old<=2'b00; time1<=4'b1101;time2<=4'b1101; flagcc<=1;  end
 else if(flag==1) begin  time1<=4'b1101;time2<=4'b1101; time3<=4'b1101;time4<=4'b1101;old<=2'b00;end
 end
 else begin flag<=1;  time1<=4'b1101;time2<=4'b1101; old<=2'b00; end
end

else if(func==2'b10)
begin
 if(old==2'b01)   // 01 
 begin time3<=4'b0100; time4<=0; flag<=0; old<=2'b10;   time1<=4'b1101;time2<=4'b1101;flagcc<=1; end
 else if(old==2'b11)
 begin
 if(flag==0)   begin time3<=4'b0100; time4<=0;old<=2'b10; time1<=4'b1101;time2<=4'b1101;flagcc<=1;  end
 else if(flag==1) begin  time1<=4'b1101;time2<=4'b1101; time3<=4'b1101;time4<=4'b1101;old<=2'b10;end
 end
 else begin flag<=1;  time1<=4'b1101;time2<=4'b1101; old<=2'b10; end
end


 else if(func==2'b11)
 begin
 flagcc<=0;
  if(old==2'b00||old==2'b10)
  begin time3<=4'b0100; time4<=4'b0000; time1<=4'b0100; time2<=4'b0000; old<=2'b11;end
  else if(old==2'b01)
  begin time3<=4'b1001; time4<=4'b0010; time1<=4'b1001; time2<=4'b0010; old<=2'b11;end
  else
  begin flag<=flag;  old<=2'b11; end
 end
  
else if(func==2'b01)
 begin
 if(old==2'b00||old==2'b10)
 begin time3<=4'b1101; time4<=4'b1101; old<=2'b01; time1<=4'b0100; time2<=4'b0000;flagcc<=1; end
 else if(old==2'b11)
  begin
 if(flag==0)   begin time3<=1101;time4<=4'b1101; time1<=1101;time2<=4'b1101; old<=2'b01; end
 else if(flag==1) begin  time3<=4'b1101; time4<=4'b1101; time1<=4'b0100; time2<=4'b0000;old<=2'b01;flagcc<=1; end
  end
 else begin flag<=0; old<=2'b01;time3<=4'b1101; time4<=4'b1101; end
end
end


else
begin
 if(time1==4'b1101)
  begin  time1<=4'b1101;  time2<=4'b1101; end
else if((flagcc==1)&&(time1==0))
   begin  time1<=4'b1101;  time2<=4'b1101;                flag<=~flag;end
 else begin
        if(time1==4'b0000)
           begin
             if(time2==4'b0000)
               begin
               time1<=4'b1001;
               time2<=4'b0010;
               flag<=~flag;
               end
           else
               begin
                    time2<=time2-1;
                    time1<=4'b1001;
                end
             end
          else time1<=time1-1;
        end


if(time3==4'b1101)
begin  time3<=4'b1101;  time4<=4'b1101; end
else if((flagcc==1)&&(time3==0))                      //倒计时完毕后不再倒计时，flagcc==1
begin  time3<=4'b1101;  time4<=4'b1101;                flag<=~flag;end
else begin 
     if(time3==4'b0000)
           begin
             if(time4==4'b0000)
               begin
               time3<=4'b1001;
               time4<=4'b0010;
               flag<=~flag;
               end
           else
               begin
                    time4<=time4-1;
                    time3<=4'b1001;
                end
                end
          else time3<=time3-1;
       end
end
end

always@(time1,time2,time3,time4,rst) 
if (rst==0)
  light<=8'b10000100;
else if(flag==1)
begin
 if(time1==4'b1101)   //special
 light<=8'b00100100;
else if((time1<4'b0100)&(time2==4'b0000))
     begin  
          if(time1[0]==1)light<=8'b01000100;
          else light<=8'b00000100;
     end
   else if(time1<4'b1010)
       begin light<=8'b00100100; end
end

 else if(flag==0)
begin
  if(time3==4'b1101)
  light<=8'b10000001;
   else if((time3<4'b0100)&(time4==4'b0000))
     begin  
          if(time3[0]==1)light<=8'b10000010;
          else light<=8'b10000000;
     end

   else if(time3<4'b1010)
           begin  light<=8'b10000001;end
 end 


always@(data)
  begin
       case(data)
             4'b0000:  dout<=8'b00111111;
             4'b0001:  dout<=8'b00000110;
             4'b0010:  dout<=8'b01011011;
             4'b0011:  dout<=8'b01001111;
             4'b0100:  dout<=8'b01100110;
             4'b0101:  dout<=8'b01101101;
             4'b0110:  dout<=8'b01111101;
             4'b0111:  dout<=8'b00000111;
             4'b1000:  dout<=8'b01111111;
             4'b1001:  dout<=8'b01101111;
             4'b1010:  dout<=8'b01110111;
             4'b1011:  dout<=8'b01111100;
             4'b1100:  dout<=8'b00111001;
             4'b1101:  dout<=8'b01011110;
             4'b1110:  dout<=8'b01111001;
             4'b1111:  dout<=8'b00000000;
             default   dout<=8'b00000000;
      endcase
end
endmodule