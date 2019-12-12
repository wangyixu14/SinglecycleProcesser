module alu_32 (A, B, Op, Carryout, Overflow, Result,Set);
  input wire[31:0] A;
  input wire[31:0] B;
  input wire[3:0] Op;
  output wire Carryout;
  output wire Overflow;
  output wire[31:0] Result;
  wire [30:0] ucarryout;
  output wire Set;
  
  alu_unit alu_unit0 (.A(A[0]), .B(B[0]), .Op(Op),  .Carryin(Op[2]),.Carryout(ucarryout[0]), .usum(Result[0]));
  alu_unit alu_unit1 (.A(A[1]), .B(B[1]), .Op(Op),  .Carryin(ucarryout[0]), .Carryout(ucarryout[1]), .usum(Result[1]));
  alu_unit alu_unit2 (.A(A[2]), .B(B[2]), .Op(Op),  .Carryin(ucarryout[1]), .Carryout(ucarryout[2]), .usum(Result[2]));
  alu_unit alu_unit3 (.A(A[3]), .B(B[3]), .Op(Op), .Carryin(ucarryout[2]), .Carryout(ucarryout[3]), .usum(Result[3]));
  alu_unit alu_unit4 (.A(A[4]), .B(B[4]), .Op(Op),  .Carryin(ucarryout[3]), .Carryout(ucarryout[4]), .usum(Result[4]));
  alu_unit alu_unit5 (.A(A[5]), .B(B[5]), .Op(Op),  .Carryin(ucarryout[4]), .Carryout(ucarryout[5]), .usum(Result[5]));
  alu_unit alu_unit6 (.A(A[6]), .B(B[6]), .Op(Op),  .Carryin(ucarryout[5]), .Carryout(ucarryout[6]), .usum(Result[6]));
  alu_unit alu_unit7 (.A(A[7]), .B(B[7]), .Op(Op),  .Carryin(ucarryout[6]), .Carryout(ucarryout[7]), .usum(Result[7]));
  alu_unit alu_unit8 (.A(A[8]), .B(B[8]), .Op(Op),  .Carryin(ucarryout[7]), .Carryout(ucarryout[8]), .usum(Result[8]));
  alu_unit alu_unit9 (.A(A[9]), .B(B[9]), .Op(Op),  .Carryin(ucarryout[8]), .Carryout(ucarryout[9]), .usum(Result[9]));
  alu_unit alu_unit10 (.A(A[10]), .B(B[10]), .Op(Op),  .Carryin(ucarryout[9]), .Carryout(ucarryout[10]), .usum(Result[10]));
  alu_unit alu_unit11 (.A(A[11]), .B(B[11]), .Op(Op),  .Carryin(ucarryout[10]), .Carryout(ucarryout[11]), .usum(Result[11]));
  alu_unit alu_unit12 (.A(A[12]), .B(B[12]), .Op(Op),  .Carryin(ucarryout[11]), .Carryout(ucarryout[12]), .usum(Result[12]));
  alu_unit alu_unit13 (.A(A[13]), .B(B[13]), .Op(Op),  .Carryin(ucarryout[12]), .Carryout(ucarryout[13]), .usum(Result[13]));
  alu_unit alu_unit14 (.A(A[14]), .B(B[14]), .Op(Op),  .Carryin(ucarryout[13]), .Carryout(ucarryout[14]), .usum(Result[14]));
  alu_unit alu_unit15 (.A(A[15]), .B(B[15]), .Op(Op),  .Carryin(ucarryout[14]), .Carryout(ucarryout[15]), .usum(Result[15]));
  alu_unit alu_unit16 (.A(A[16]), .B(B[16]), .Op(Op),  .Carryin(ucarryout[15]), .Carryout(ucarryout[16]), .usum(Result[16]));
  alu_unit alu_unit17 (.A(A[17]), .B(B[17]), .Op(Op),  .Carryin(ucarryout[16]), .Carryout(ucarryout[17]), .usum(Result[17]));
  alu_unit alu_unit18 (.A(A[18]), .B(B[18]), .Op(Op),  .Carryin(ucarryout[17]), .Carryout(ucarryout[18]), .usum(Result[18]));
  alu_unit alu_unit19 (.A(A[19]), .B(B[19]), .Op(Op),  .Carryin(ucarryout[18]), .Carryout(ucarryout[19]), .usum(Result[19]));
  alu_unit alu_unit20 (.A(A[20]), .B(B[20]), .Op(Op),  .Carryin(ucarryout[19]), .Carryout(ucarryout[20]), .usum(Result[20]));
  alu_unit alu_unit21 (.A(A[21]), .B(B[21]), .Op(Op), .Carryin(ucarryout[20]), .Carryout(ucarryout[21]), .usum(Result[21]));
  alu_unit alu_unit22 (.A(A[22]), .B(B[22]), .Op(Op),  .Carryin(ucarryout[21]), .Carryout(ucarryout[22]), .usum(Result[22]));
  alu_unit alu_unit23 (.A(A[23]), .B(B[23]), .Op(Op), .Carryin(ucarryout[22]), .Carryout(ucarryout[23]), .usum(Result[23]));
  alu_unit alu_unit24 (.A(A[24]), .B(B[24]), .Op(Op),  .Carryin(ucarryout[23]), .Carryout(ucarryout[24]), .usum(Result[24]));
  alu_unit alu_unit25 (.A(A[25]), .B(B[25]), .Op(Op), .Carryin(ucarryout[24]), .Carryout(ucarryout[25]), .usum(Result[25]));
  alu_unit alu_unit26 (.A(A[26]), .B(B[26]), .Op(Op),  .Carryin(ucarryout[25]), .Carryout(ucarryout[26]), .usum(Result[26]));
  alu_unit alu_unit27 (.A(A[27]), .B(B[27]), .Op(Op),  .Carryin(ucarryout[26]), .Carryout(ucarryout[27]), .usum(Result[27]));
  alu_unit alu_unit28 (.A(A[28]), .B(B[28]), .Op(Op),  .Carryin(ucarryout[27]), .Carryout(ucarryout[28]), .usum(Result[28]));
  alu_unit alu_unit29 (.A(A[29]), .B(B[29]), .Op(Op), .Carryin(ucarryout[28]), .Carryout(ucarryout[29]), .usum(Result[29]));
  alu_unit alu_unit30 (.A(A[30]), .B(B[30]), .Op(Op),  .Carryin(ucarryout[29]), .Carryout(ucarryout[30]), .usum(Result[30]));
  alu_msb alu_unit31 (.A(A[31]), .B(B[31]), .Op(Op), .Carryin(ucarryout[30]), .Carryout(Carryout), .usum(Result[31]), .Overflow(Overflow), .Set(Set) );
  

  
endmodule
