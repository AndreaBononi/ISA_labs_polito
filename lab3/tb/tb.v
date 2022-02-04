//`timescale 1ns

module testbench ();

	wire clk;
	wire rstN;
    wire riscV_rstN;
    wire pc_rstN;
    wire pcEn;
    wire pcSel;
    wire [31:0] pcInit;
    wire [31:0] instr;
    wire [31:0] instr_addr;
    wire valid_instr;
    wire [31:0] data;
    wire [31:0] data_addr;
    wire valid_data;
	wire [31:0] IMEM_addr;
	wire [31:0] IMUX_out;
	wire [31:0] IMEM_out;
	wire IMEM_readEn;
	wire DMEM_readEn;
	wire DMEM_writeEn;
	wire [31:0] DMEM_addr;
	wire [31:0] DMEM_out;
	wire [31:0] DMUX_out;
	wire [31:0] DMEM_data;

	// Clock and reset generator
   	clkGen CG	(
                .clk (clk),
				.rstN (rstN)
                );

	// Data generator
   	dataGen DG	(
                .clk (clk),
                .rstN (rstN),
                .riscV_rstN (riscV_rstN),
                .pc_rstN (pc_rstN),
                .pcEn (pcEn),
                .pcSel (pcSel),
                .pcInit (pcInit),
                .instr (instr),
                .instr_addr (instr_addr),
                .valid_instr (valid_instr),
                .data (data),
                .data_addr (data_addr),
                .valid_data (valid_data)
                );

	mux2to1 	#(.N (32))
	IMUX		(
				.sel (valid_instr),
				.in0 (IMEM_addr),
				.in1 (instr_addr),
				.muxout (IMUX_out)
				);

    // Instruction memory
    MEM     	#(.N_DATA (32))
    IMEM    	(
				.clk (clk),
				.clearN (rstN),
				.readEn (IMEM_readEn),
				.writeEn (valid_instr),
				.mem_addr (IMUX_out),
				.mem_in (instr),
				.mem_out (IMEM_out)
            	);

	mux2to1 	#(.N (32))
	DMUX		(
				.sel (valid_data),
				.in0 (DMEM_addr),
				.in1 (data_addr),
				.muxout (DMUX_out)
				);

    // Data memory (containing the vector)
    MEM    		#(.N_DATA (32))
    DMEM    	(
				.clk (clk),
				.clearN (rstN),
				.readEn (DMEM_readEn),
				.writeEn (valid_data),
				.mem_addr (DMUX_out),
				.mem_in (data),
				.mem_out (DMEM_out)
            	);

	// Device under test
	riscV DUT	(
				.rstN (riscV_rstN),
		        .clk (clk),
		        .pcSel (pcSel),
		        .pcEn (pcEn),
		        .pcClearN (pc_rstN),
		        .pcIN (pcInit),
				.IMEM_out (IMEM_out),
				.DMEM_out (DMEM_out),
		        .IMEM_addr (IMEM_addr),
		        .DMEM_addr (DMEM_addr),
		        .DMEM_data (DMEM_data),
				.IMEM_readEn (IMEM_readEn),
		        .DMEM_readEn (DMEM_readEn),
		        .DMEM_writeEn (DMEM_writeEn)
				);

    // Store result (it should be written in the memory, but we send it to a text file in order to easily check its value)
    storeResult SR  (
					.clk (clk),
					.rstN (rstN),
					.result (DMEM_data),
					.valid (DMEM_writeEn)
                    );

endmodule
