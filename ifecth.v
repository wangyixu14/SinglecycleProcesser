module ifetch(PC, opcode, rs, rt, rd, shamt, funct, instruction, immi);
  /*  need to define how to load the name to sram.mem_file
  */
  parameter inst_name;
  input [31:0] PC;
  output [5:0] opcode;
  output [4:0] rs;
  output [4:0] rt;
  output [4:0] rd;
  output [4:0] shamt;
  output [5:0] funct;
  output [31:0] instruction; 
  output [15:0] immi;

  sram s_ifetch (.cs(1'b1), .oe(1'b1), .we(1'b0), .addr(PC), .din(32'b0), .dout(instruction));
  defparam s_ifetch.mem_file = inst_name;
  assign opcode = instruction[31:26];
  assign rs = instruction[25:21];
  assign rt = instruction[20:16];
  assign rd = instruction[15:11];
  assign shamt = instruction[10:6];
  assign funct = instruction[5:0];
  assign immi = instruction[15:0];

endmodule
