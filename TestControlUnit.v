`include "ControlUnit.v"

module main;
	
	wire FR_ld, RF_ld, IR_ld, MAR_ld, MDR_ld, R_W, MOV;
    wire [1:0] MA;
    wire [1:0] MB;
    wire [1:0] MC;
	wire MD, ME;
    wire [4:0] OP;
	wire [1:0] DT;
	reg [31:0] IR;
    reg MOC, COND, clk, clr;
    reg debug = 1;
	reg showClock = 0;
		
	ControlUnit CU(FR_ld, RF_ld, IR_ld, MAR_ld, MDR_ld, R_W, MOV, 
		MA, MB, MC, MD, ME, OP, DT, IR, MOC, COND, clk, clr,
		debug);
	
	initial begin
		clk = 0;
		clr = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		$display("Clear enabled");
		clr = 1;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		clr = 0;	//Clear = 0 here to let it sit for two clock cycles
		#200;
		clk = 0;
		$display("Clear disabled");
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		clk = 0;
		
		//							SBZ
		//		 COND       |Rn||Rd||Im|    |Rm|
		IR = 31'b0000001110100000000000011010000
		//		       PU WL             SH
		// Testing states
		#200;
		$display("\n\nReset");
		clr = 1;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		clr = 0;
		#200;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
		#200;
		clk = 0;
		#200;
		if (showClock) $display("Clock");
		clk = 1;
	end

endmodule