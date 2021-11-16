//`timescale 1ns

module myfilter_testbench ();

   	wire clk;
   	wire rstN;
	wire endSim;
	wire validInput;
	wire validOutput;
   	wire [10:0] filterInput;
   	wire [10:0] a1;
	wire [10:0] a1quad;
   	wire [10:0] b1;
   	wire [10:0] b0;
   	wire [10:0] filterOutput;

	// Clock and reset generator
   	clkGen CG  	(.endSim (endSim),
				.clk (clk),
				.rstN (rstN));

	// Data generator
   	dataGen DG 	(.clk (clk),
				.rstN (rstN),
				.valid (validInput),
				.filterInput (filterInput),
				.a1 (a1),
				.a1quad (a1quad),
				.b1 (b1),
				.b0 (b0),
				.endSim (endSim));

	// DUT (filter)
   	advanced_IIR DUT	(.clk (clk),
						.rstN (rstN),
						.vin (validInput),
						.a1 (a1),
						.a1quad (a1quad),
						.b1 (b1),
						.b0 (b0),
						.din (filterInput),
						.dout (filterOutput),
						.vout (validOutput));

	// Store results
   	storeResults SR		(.clk(clk),
						.rstN(rstN),
						.validOut(validOutput),
						.filterOut(filterOutput));   

endmodule

		   
