//`timescale 1ns

module testbench_inputpipe ();

	wire clk;
	wire rstN;
	wire endSim;
	wire valid;
	wire [31:0] mulA;
	wire [31:0] mulB;
	wire [31:0] mulRes;

	// Clock and reset generator
   	clkGen CG	(.endSim (endSim),
				.clk (clk),
				.rstN (rstN));

	// Data generator
   	dataGen_inputpipe DG	(.clk (clk),
							.rstN (rstN),
							.mulA (mulA),
							.mulB (mulB),
							.valid (valid),
							.endSim (endSim));

	// DUT (filter)
    top_mul DUT		(.FP_A (mulA),
					.FP_B (mulB),
					.clk (clk),
					.rstn(rstN),
					.FP_Z (mulRes));

	// Store results
   	storeResults_inputpipe SR	(.clk(clk),
								.rstN(rstN),
								.valid(valid),
								.mulRes(mulRes));   

endmodule

		   
