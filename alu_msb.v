module alu_msb (A, B, Op, Carryout, Carryin, usum, Overflow, Set);
  input A;
  input B;
  input [3:0] Op;
  output Carryout;
  output usum;
  output Overflow;
  output Set;
  input wire Carryin;
  wire uand;
  wire uor;
  wire uadd;
  wire uxor;
  wire usub;
  wire Overflow_0;
  wire Carryout_0;
  wire t1;
  wire t2;
  wire t3;
  wire t4;
  wire t5;
  wire t6;
  wire t7;
  wire t8;
  wire t_add;
  wire t_not;
  wire t_carry;
  wire t_sum1;
  wire t_sum2;
  wire t_sum3;
  wire t_sum4;
  wire t_sum5;
  wire B_inv;
  wire B_slt;
  wire t_slt0;
  wire t_slt;
  wire t_sltu;
  wire t_sltu0;
  
  //and
  and_gate and_1 (.x(A), .y(B), .z(uand));
  //or
  or_gate or_1 (.x(A), .y(B), .z(uor));
  //xor
  xor_gate xor_1 (.x(A), .y(B), .z(uxor));
  //b_inverse
  not_gate not_1 (.x(B), .z(B_inv));
  mux mux_1 (.sel(Op[2]), .src0(B), .src1(B_inv), .z(B_slt));
  //add_sum
  xor_gate xor_2 (.x(A),.y(B_slt), .z(t1));
  xor_gate xor_3 (.x(t1),.y(Carryin), .z(uadd));


  //Carryout
  and_gate and_add1 (.x(A), .y(B_slt), .z(t2));
  and_gate and_add2 (.x(A), .y(Carryin), .z(t3));
  and_gate and_add3 (.x(B_slt), .y(Carryin), .z(t4));
  or_gate or_add1 (.x(t2), .y(t3), .z(t5));
  or_gate or_add2 (.x(t5), .y(t4), .z(Carryout_0));
  
  
  
	//choose output which sum
    and_gate andop (.x(Op[0]), .y(Op[1]), .z(t_add));
	not_gate andop1 (.x(t_add),.z(t_not));
	mux muxop0 (.sel(Op[0]), .src0(uand), .src1(uor), .z(t_sum1));
	mux muxop1 (.sel(Op[1]), .src0(t_sum1), .src1(uxor), .z(t_sum2));
	mux muxop3 (.sel(Op[2]), .src0(t_sum2), .src1(uadd), .z(t_sum3));
	and_gate addop2 (.x(t_add), .y(uadd), .z(t_sum4));
	and_gate addop3 (.x(t_not), .y(t_sum3), .z(t_sum5));
	or_gate finalsum (.x(t_sum4), .y(t_sum5), .z(usum));
	
	
	// output Carryout
	or_gate orcarry(.x(t_add), .y(Op[2]), .z(t_carry));
	and_gate andcarry (.x(t_carry), .y(Carryout_0), .z(Carryout));
    
	//Overflow
	xor_gate xor_overflow(.x(Carryout), .y(Carryin), .z(Overflow_0));
	and_gate andoverflow (.x(t_carry), .y(Overflow_0), .z(Overflow));

    
	//Set slt
	xor_gate xorslt (.x(usum), .y(Overflow), .z(t_slt0));
	and_gate andslt1 (.x(Op[0]), .y(Op[2]), .z(t6));
	and_gate andslt2 (.x(t6), .y(t_slt0), .z(t_slt));
	
	//set sltu
	not_gate not_sltu (.x(Carryout), .z(t_sltu0));
	and_gate andsltu1 (.x(Op[1]), .y(Op[2]), .z(t7));
	and_gate andsltu2 (.x(t7), .y(t_sltu0), .z(t_sltu));

    or_gate orset (.x(t_slt), .y(t_sltu),  .z(Set));	
	

	

  
endmodule
