module Control(Opcode, RegDst, ALUSrc, MemtoReg, RegWrite, MemWrite, Branch, Extop, ALUop);
  input [5:0] Opcode;
  output RegDst, Branch, MemWrite, MemtoReg, ALUSrc, RegWrite, Extop;
  output [1:0] ALUop;
  wire [1:0] temp;
  wire [5:0] NotOp;
  wire Rtype, addi_as, lw_as, sw_as, beq_br, bne_br;
  
  not_gate_n #(.n(6)) csnotg0 (.x(Opcode), .z(NotOp));
  and_6 csand0 (.a(NotOp[5]), .b(NotOp[4]), .c(NotOp[3]),.d(NotOp[2]),.e(NotOp[1]),.f(NotOp[0]),.z(Rtype));
  // RegDst
  assign RegDst = Rtype;
  
  // ALUSrc
  and_6 csand1 (.a(NotOp[5]), .b(NotOp[4]), .c(Opcode[3]),.d(NotOp[2]),.e(NotOp[1]),.f(NotOp[0]),.z(addi_as));
  and_6 csand2 (.a(Opcode[5]), .b(NotOp[4]), .c(NotOp[3]),.d(NotOp[2]),.e(Opcode[1]),.f(Opcode[0]),.z(lw_as));
  and_6 csand3 (.a(Opcode[5]), .b(NotOp[4]), .c(Opcode[3]),.d(NotOp[2]),.e(Opcode[1]),.f(Opcode[0]),.z(sw_as));
  assign ALUSrc = addi_as | lw_as | sw_as;
  
  // 
  assign MemtoReg = lw_as;
  assign RegWrite = Rtype | addi_as | lw_as;
  assign MemWrite = sw_as;
  and_6 csand4 (.a(NotOp[5]), .b(NotOp[4]), .c(NotOp[3]),.d(Opcode[2]),.e(NotOp[1]),.f(NotOp[0]),.z(beq_br));
  and_6 csand5 (.a(NotOp[5]), .b(NotOp[4]), .c(NotOp[3]),.d(Opcode[2]),.e(NotOp[1]),.f(Opcode[0]), .z(bne_br));
  and_6 csand6 (.a(NotOp[5]), .b(NotOp[4]), .c(NotOp[3]),.d(Opcode[2]),.e(Opcode[1]),.f(Opcode[0]), .z(bgtz_br));
  assign Branch = beq_br | bne_br | bgtz_br;
  assign Extop = 1'b1;
  // ALUop
  mux_n #(.n(2)) csmux0 (.sel(Branch), .src0(2'b01), .src1(2'b10), .z(temp));
  mux_n #(.n(2)) csmux1 (.sel(RegDst), .src0(temp), .src1(2'b00), .z(ALUop));
 endmodule