module pipecu(mwreg, mrn, ern, ewreg, em2reg, mm2reg, rsrtequ, Funct, Op, rs, rt,
                wreg, m2reg, wmem, aluc, regrt, aluimm, fwda, fwdb, nostall, sext, 
                pcsource, shift, jal); 
        input        mwreg, ewreg, em2reg, mm2reg, rsrtequ; 
        input  [4:0] mrn, ern, rs, rt; 
        input  [5:0] Funct, Op; 
        output       wreg, m2reg, wmem, regrt, aluimm, sext, shift, jal; 
        output [3:0] aluc; 
        output [1:0] pcsource;
		output [1:0] fwda, fwdb; // forwarding 
        output       nostall; // stall pipe line d ue to lw dependent 
        reg    [1:0] fwda, fwdb;
		
   // r format
   wire rtype  = ~|Op;
   wire i_add  = rtype& Funct[5]&~Funct[4]&~Funct[3]&~Funct[2]&~Funct[1]&~Funct[0]; // add
   wire i_sub  = rtype& Funct[5]&~Funct[4]&~Funct[3]&~Funct[2]& Funct[1]&~Funct[0]; // sub
   wire i_and  = rtype& Funct[5]&~Funct[4]&~Funct[3]& Funct[2]&~Funct[1]&~Funct[0]; // and
   wire i_or   = rtype& Funct[5]&~Funct[4]&~Funct[3]& Funct[2]&~Funct[1]& Funct[0]; // or
   wire i_slt  = rtype& Funct[5]&~Funct[4]& Funct[3]&~Funct[2]& Funct[1]&~Funct[0]; // slt
   wire i_sltu = rtype& Funct[5]&~Funct[4]& Funct[3]&~Funct[2]& Funct[1]& Funct[0]; // sltu
   wire i_addu = rtype& Funct[5]&~Funct[4]&~Funct[3]&~Funct[2]&~Funct[1]& Funct[0]; // addu
   wire i_subu = rtype& Funct[5]&~Funct[4]&~Funct[3]&~Funct[2]& Funct[1]& Funct[0]; // subu
   wire i_jr   = rtype&~Funct[5]&~Funct[4]& Funct[3]&~Funct[2]&~Funct[1]&~Funct[0]; // jr
   wire i_jalr = rtype&~Funct[5]&~Funct[4]& Funct[3]&~Funct[2]&~Funct[1]& Funct[0]; // jalr
   wire i_nor  = rtype& Funct[5]&~Funct[4]&~Funct[3]& Funct[2]& Funct[1]& Funct[0]; // nor
   wire i_sll  = rtype&~Funct[5]&~Funct[4]&~Funct[3]&~Funct[2]&~Funct[1]&~Funct[0]; // sll
   wire i_srl  = rtype&~Funct[5]&~Funct[4]&~Funct[3]&~Funct[2]& Funct[1]&~Funct[0]; // srl
   wire i_sra  = rtype&~Funct[5]&~Funct[4]&~Funct[3]&~Funct[2]& Funct[1]& Funct[0]; // sra
   wire i_sllv  = rtype&~Funct[5]&~Funct[4]&~Funct[3]& Funct[2]&~Funct[1]&~Funct[0]; // sra
   wire i_srlv  = rtype&~Funct[5]&~Funct[4]&~Funct[3]& Funct[2]& Funct[1]&~Funct[0]; // sra
   
  // i format
   wire i_addi = ~Op[5]&~Op[4]& Op[3]&~Op[2]&~Op[1]&~Op[0]; // addi
   wire i_ori  = ~Op[5]&~Op[4]& Op[3]& Op[2]&~Op[1]& Op[0]; // ori
   wire i_lw   =  Op[5]&~Op[4]&~Op[3]&~Op[2]& Op[1]& Op[0]; // lw
   wire i_sw   =  Op[5]&~Op[4]& Op[3]&~Op[2]& Op[1]& Op[0]; // sw
   wire i_beq  = ~Op[5]&~Op[4]&~Op[3]& Op[2]&~Op[1]&~Op[0]; // beq
   wire i_bne  = ~Op[5]&~Op[4]&~Op[3]& Op[2]&~Op[1]& Op[0]; // bne   参考表格000101
   wire i_slti = ~Op[5]&~Op[4]& Op[3]&~Op[2]& Op[1]&~Op[0];
   wire i_lui  = ~Op[5]&~Op[4]& Op[3]& Op[2]& Op[1]& Op[0];
   wire i_andi  = ~Op[5]&~Op[4]& Op[3]& Op[2]&~Op[1]&~Op[0];
  // j format
   wire i_j    = ~Op[5]&~Op[4]&~Op[3]&~Op[2]& Op[1]&~Op[0];  // j
   wire i_jal  = ~Op[5]&~Op[4]&~Op[3]&~Op[2]& Op[1]& Op[0];  // jal
   
wire i_rs = i_add | i_sub | i_and | i_or | i_jr | i_addu | i_subu | i_sllv | i_srlv | i_slt | i_sltu | i_jalr | i_nor | i_addi | i_andi | i_ori | i_lw | i_sw | i_beq | i_bne | i_slti;
wire i_rt = i_add | i_sub | i_and | i_or | i_addu | i_subu | i_sll | i_srl | i_slt | i_sltu | i_nor | i_addi | i_andi | i_ori |i_sw | i_beq | i_bne | i_slti | i_lw | i_sllv | i_srlv | i_lui;

assign nostall = ~(ewreg & em2reg & (ern != 0) & ( i_rs & (ern == rs) | i_rt & (ern == rt)));

always @ (ewreg or mwreg or ern or mrn or em2reg or mm2reg or rs or rt) begin
    fwda =2'b00;
	if(ewreg & (ern != 0) & (ern == rs) & ~em2reg) begin
	    fwda = 2'b01;
		end else begin
		    if (mwreg & (mrn != 0) & (mrn == rs) & ~mm2reg) begin
			    fwda =2'b10;
				end else begin
		            if (mwreg & (mrn != 0) & (mrn == rs) & mm2reg) begin
			            fwda =2'b11;
						end
					end
				end
	fwdb =2'b00;
    if(ewreg & (ern != 0) & (ern == rt) & ~em2reg) begin
	    fwdb = 2'b01;
		end else begin
		    if (mwreg & (mrn != 0) & (mrn == rt) & ~mm2reg) begin
			    fwdb =2'b10;
				end else begin
		            if (mwreg & (mrn != 0) & (mrn == rt) & mm2reg) begin
			            fwdb =2'b11;
						end
					end
				end
			end

	
	assign wreg        = ( rtype | i_lw | i_addi | i_ori | i_jal | i_jalr | i_sll | i_srl |i_sra |i_sllv |i_srlv|i_slti|i_lui |i_andi ) & nostall;
	assign regrt       = i_addi | i_andi | i_ori | i_lw | i_lui | i_slti;
	assign jal         = i_jal | i_jalr;
	assign m2reg       = i_lw;
	assign shift       = i_sll | i_srl;
	assign aluimm      = i_addi | i_andi | i_ori | i_lw | i_lui | i_sw | i_slti;
	assign sext        = i_addi | i_sw | i_lw | i_beq | i_bne | i_andi | i_slti;
	
assign aluc[0] = i_add | i_lw | i_sw | i_addi | i_and | i_slt | i_addu | i_nor |i_srl|i_sllv|i_slti|i_lui |i_andi;
  assign aluc[1] = i_sub | i_beq | i_and | i_sltu | i_subu | i_bne | i_nor |i_sra|i_sllv|i_andi;              
  assign aluc[2] = i_or | i_ori | i_slt | i_sltu | i_nor|i_srlv|i_slti|i_lui;
  assign aluc[3] = i_sll | i_srl |i_sra|i_sllv|i_srlv|i_lui;

	
	assign wmem        = i_sw & nostall;
	assign pcsource[1] = i_jr | i_j | i_jal;
	assign pcsource[0] = i_beq & rsrtequ | i_bne & ~rsrtequ | i_j | i_jal;

endmodule
			
			
			
			
			
			
			
			
			
			
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   