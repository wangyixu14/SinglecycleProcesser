module CPU_tb;
	reg clk;
	reg initPC;
	wire [31:0] nextPC, regPC;
	wire [31:0] inst;
	wire [31:0] wDin, Dout1, Dout2;
    wire [31:0] Memread;
	wire [4:0] rt, rs, rd, shamt;
    wire [5:0] opcode, funct;
    wire [15:0] immed;
	wire [31:0] Result;
	wire [3:0] alu_control;

    CPU scp ( .clk(clk), .initPC(initPC),.nextPC(nextPC), .regPC(regPC),.inst(inst),.wDin(wDin), 
		.Dout1(Dout1), .Dout2(Dout2),.Memread(Memread), .rt(rt), .rs(rs), .rd(rd), .shamt(shamt), 
		.opcode(opcode), .funct(funct), .immed(immed), .Result(Result), .alu_control(alu_control));
    defparam scp.file_name = "eecs361/data/bills_branch.dat";
	
	initial
      begin
	    clk = 1'b1;
        initPC = 1'b1;
        #10
		clk = 1'b0;
		initPC = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
				clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		#10
		$stop;
		
	
	
	end



endmodule
