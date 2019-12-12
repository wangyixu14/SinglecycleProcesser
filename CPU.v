module CPU(clk, initPC, nextPC, regPC, inst, wDin, Dout1, Dout2, rt, rs, rd, Memread, shamt, opcode, funct, immed, Result, alu_control);
  
  parameter file_name;
  input clk;
  input initPC;
  output [31:0] nextPC, regPC , inst, wDin, Dout1, Dout2, Memread;
  output [4:0] rt, rs, rd, shamt;
  output [5:0] opcode, funct;
  output [15:0] immed;
  wire RegDst, MemtoReg, RegWrite, MemWrite, Branch, Extop;
  wire ALUSrc;
  wire [1:0] ALUop;
  wire [4:0] towrite;
  wire [31:0] se_immed, alu_input;
  output wire [3:0] alu_control;
  wire Carryout, Overflow, Zero, Set;
  wire Carryout1, Overflow1, Zero1, Set1;
  output wire [31:0] Result;
  wire [31:0] temp;
  wire [31:0] memadd;
  // initialize or nextPC
  mux_32 cpu_mux2 (.sel(initPC),.src0(nextPC), .src1(32'h00400020), .z(regPC));
  
  // instruction fetch
  ifetch cpu_if0 (.PC(regPC), .opcode(opcode), .rs(rs), .rt(rt), .rd(rd), .shamt(shamt), .funct(funct), .instruction(inst), .immi(immed));
  defparam cpu_if0.inst_name = file_name;
  
  // opcode to control signal;
  Control cpu_c0 (.Opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemWrite(MemWrite), .Branch(Branch), .Extop(Extop), .ALUop(ALUop));
  //control cpu_c0n (.opc(opcode), .func(funct), .RegDst(RegDst), .ALUsrc(ALUSrc), .MemReg(MemtoReg), .RegW(RegWrite), .MemW(MemWrite), .Branch(Branch), .ExtOp(Extop), .ALUop(ALUop));				
  // choose rd or rt based on RegDst
  mux_n #(.n(5)) cpu_m (.sel(RegDst), .src0(rt), .src1(rd), .z(towrite));
  
  // RegisterFiles
  RegisterFiles cpu_rf (.clk(clk), .writenable(RegWrite), .readsel1(rs), .readsel2(rt), .writesel(towrite), .Din(wDin), .Dout1(Dout1), .Dout2(Dout2));
  //registers cpu_rfn (.clk(clk), .writeEnable(RegWrite), .readReg1(rs), .readReg2(rt), .writeReg(towrite),.writeData(Din), .readData1(Dout1), .readData2(Dout2));
  // sign extend the immed
  
  Signextend cpu_se (.Extop(Extop), .Din(immed), .Dout(se_immed));
  // mux Dout2 or extended immed to ALU
  mux_32 cpu_mux0 (.sel(ALUSrc), .src0(Dout2), .src1(se_immed), .z(alu_input));
  // ALU control signal;
  ALUctrl cpu_A (.ALUop(ALUop), .funct(funct), .Control(alu_control));
  
  //mux_32 cpu_mux3 (.sel(initPC), .src0(Dout1), .src1(32'h00000000), .z(temp));
  // Execution
  alu cpu_alu (.A(Dout1), .B(alu_input), .Op(alu_control), .Carryout(Carryout), .Overflow(Overflow), .Zero(Zero), .Result(Result), .Set(Set));
  //alu cpu_alu1 (.A(Result), .B(32'h00400020), .Op(4'b0011), .Carryout(Carryout1), .Overflow(Overflow1), .Zero(Zero1), .Result(Resultadd), .Set(Set1));
  //update PC;
  PC cpu_pc (.clk(clk), .initPC(initPC), .Branch(Branch), .Zero(Zero), .Overflow(Overflow), .Op(opcode), .Immed(immed), .ALUOutput(Result), .CurrPC(regPC), .NextPC(nextPC));
  //data memory
  syncram cpu_scm (.clk(clk),.cs(1'b1),.oe(1'b1),.we(MemWrite),.addr(Result),.din(Dout2),.dout(Memread));
  defparam cpu_scm.mem_file = file_name;
  
  // write back
  mux_32 cpu_mux1 (.sel(MemtoReg), .src0(Result), .src1(Memread), .z(wDin));
endmodule
  
  
  
  
  