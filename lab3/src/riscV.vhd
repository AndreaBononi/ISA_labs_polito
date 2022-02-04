LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- RISC V PROCESSOR ------------------------------------------------------------------------------------------------------------------------------------------------------------
ENTITY 	riscV			IS
PORT 	(rstN:			IN  STD_LOGIC;
        clk:			IN  STD_LOGIC;
        pcSel:			IN  STD_LOGIC;
        pcEn:			IN  STD_LOGIC;
        pcClearN:		IN  STD_LOGIC;
        pcIN:           IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		IMEM_out:	    IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		DMEM_out:		IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
        IMEM_addr:	    OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        DMEM_addr:	    OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        DMEM_data:	    OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        IMEM_readEn:    OUT STD_LOGIC;
        DMEM_readEn:	OUT STD_LOGIC;
        DMEM_writeEn:	OUT STD_LOGIC
		);
END 	riscV;

-- ARCHITECTURE ----------------------------------------------------------------------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF riscV IS

    -- ARITHMETIC UNIT ---------------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	ALU	            IS
    GENERIC	    (N: 			INTEGER := 32);
    PORT 	    (in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
                in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
                sel:		    IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
                result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
                zero: 			OUT STD_LOGIC
                );
    END 	    COMPONENT;
    -- sel = "000" --> result = in1 + in2
    -- sel = "001" --> result = arithmetic right shift of in1
    -- sel = "010" --> result = in1 AND in2
    -- sel = "011" --> result = in1 XOR in2
    -- sel = "1xx" --> result = '1' if in1 < in2, '0' otherwise

    -- ADDER --------------------------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	adder			IS
    GENERIC	    (N: 			INTEGER := 32);
    PORT 	    (in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    sub_addN:		IN  STD_LOGIC;
    		    result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- BUBBLE MULTIPLEXER ------------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	bubbleMultiplexer   IS
    PORT	    (bubble:            IN  STD_LOGIC;
                regWrite:	        IN  STD_LOGIC;
    		    writeSel: 	        IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
    		    writeEn: 	        IN  STD_LOGIC;
                branch:             IN  STD_LOGIC;
                load:               IN  STD_LOGIC;
                readEn:             IN  STD_LOGIC;
                isRS1:              IN  STD_LOGIC;
                isRS2:              IN  STD_LOGIC;
                jump:               IN  STD_LOGIC;
                ALUsel1:            IN  STD_LOGIC;
                ALUsel2:            IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
                ALUop:              IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                regWrite_out:       OUT STD_LOGIC;
                writeSel_out: 	    OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                writeEn_out: 	    OUT STD_LOGIC;
                branch_out:         OUT STD_LOGIC;
                load_out:           OUT STD_LOGIC;
                readEn_out:         OUT STD_LOGIC;
                isRS1_out:          OUT STD_LOGIC;
                isRS2_out:          OUT STD_LOGIC;
                jump_out:           OUT STD_LOGIC;
                ALUsel1_out:        OUT STD_LOGIC;
                ALUsel2_out:        OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                ALUop_out:          OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
    		    );
    END 	    COMPONENT;
    -- bubble = 0 --> the outputs are exactly equal to the inputs
    -- bubble = 1 --> the outputs correspond to their disabled value

    -- CONTROL UNIT -----------------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	CU 		   IS
    PORT	    (opcode:   IN  STD_LOGIC_VECTOR (6 DOWNTO 0);
                funct3:    IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
                funct7:    IN  STD_LOGIC_VECTOR (6 DOWNTO 0);
                regWrite:  OUT STD_LOGIC;
                writeSel:  OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                writeEn:   OUT STD_LOGIC;
                readEn:    OUT STD_LOGIC;
                branch:    OUT STD_LOGIC;
                load:      OUT STD_LOGIC;
                isRS1:     OUT STD_LOGIC;
                isRS2:     OUT STD_LOGIC;
                jump:      OUT STD_LOGIC;
                aluOp:     OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                aluSel2:   OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                aluSel1:   OUT STD_LOGIC
                );
    END 	    COMPONENT;

    -- D Flip Flop ------------------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	D_FF 		IS
    PORT	    (clk:		IN	STD_LOGIC;
    		    enable:		IN 	STD_LOGIC;
    		    clearN: 	IN 	STD_LOGIC;
    		    dffIN: 		IN 	STD_LOGIC;
    		    dffOUT: 	OUT STD_LOGIC);
    END 	    COMPONENT;

    -- FORWARDING UNIT --------------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	FU              IS
    PORT	    (rd_mem:        IN  STD_LOGIC_VECTOR (4 DOWNTO 0);         -- destination register from operand store cycle
                rd_mem_valid:   IN  STD_LOGIC;                          -- validation signal for rd_mem
                rd_wb:          IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- destination register from write back cycle
                rd_wb_valid:    IN  STD_LOGIC;                          -- validation signal for rd_wb
                rs1:            IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- source register 1 from execute cycle
                rs1_valid:      IN  STD_LOGIC;                          -- validation signal for rs1
                rs2:            IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- source register 2 from execute cycle
                rs2_valid:      IN  STD_LOGIC;                          -- validation signal for rs2
                load:           IN  STD_LOGIC;                          -- load instruction identifier
                rs1_fw:         OUT STD_LOGIC_VECTOR (1 DOWNTO 0);      -- rs1 forwarding
                rs2_fw:         OUT STD_LOGIC_VECTOR (1 DOWNTO 0)       -- rs2 forwarding
                );
    END 	    COMPONENT;
    -- For the outputs:
    --      00 --> no forwarding
    --      01 --> ALU FORWARDING
    --      10 --> MEM forwarding
    --      11 --> no forwarding

    -- HAZARD DETECTION UNIT ------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	HDU             IS
    PORT	    (rd_ex:         IN  STD_LOGIC_VECTOR (4 DOWNTO 0);         -- destination register from the execution cycle
                rd_ex_valid:    IN  STD_LOGIC;                          -- validation signal for rd_id
                rs1:            IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- source register 1
                rs1_valid:      IN  STD_LOGIC;                          -- validation signal for rs1
                rs2:            IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- source register 2
                rs2_valid:      IN  STD_LOGIC;                          -- validation signal for rs2
                load:           IN  STD_LOGIC;                          -- load instruction identifier
                fetchDisable:   OUT STD_LOGIC;                          -- fetch disable request
                pcDisable:      OUT STD_LOGIC;                          -- program counter disable request
                hazardBubble:   OUT STD_LOGIC                           -- bubble generation request
                );
    END 	    COMPONENT;

    -- INCREMENTER BY 4 -----------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT	incrementer4	IS
    GENERIC	    (N: 			INTEGER := 32);
    PORT 	    (inc_in:		IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    inc_out: 	    OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- MULTIPLEXER 2TO1 N BIT -----------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	mux2to1 IS
    GENERIC	    (N: 	INTEGER := 8);
    PORT	    (sel:	IN  STD_LOGIC;
    		    in0: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    in1: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    muxout: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- MULTIPLEXER 4TO1 N BIT -----------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	mux4to1 IS
    GENERIC	    (N: 	INTEGER := 8);
    PORT	    (sel:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
    		    in_00: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    in_01: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
    		    in_10: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
    		    in_11:	IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
    		    muxout: OUT STD_LOGIC_VECTOR (N-1  DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- MULTIPLEXER 8TO1 N BIT ------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	mux8to1     IS
    GENERIC	    (N: 	    INTEGER := 8);
    PORT	    (sel:	    IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
    		    in_000: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    in_001: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
    		    in_010: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
    		    in_011:	    IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
                in_100:	    IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
                in_101: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
    		    in_110: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
    		    in_111:	    IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
    		    muxout:     OUT STD_LOGIC_VECTOR (N-1  DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- N bits register ------------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	reg 		IS
    GENERIC	    (N: 		INTEGER := 8);
    PORT	    (clk: 		IN STD_LOGIC;
    		    enable: 	IN STD_LOGIC;
    		    clearN: 	IN STD_LOGIC;
    		    regIN: 		IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    regOUT: 	OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- REGISTER FILE 32x32bit -----------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT	RF 			IS
    GENERIC     (N: 		INTEGER := 32);
    PORT 	    (clk: 		IN  STD_LOGIC;
    		    clearN: 	IN  STD_LOGIC;
    		    regWrite: 	IN  STD_LOGIC;
    		    read_addr1:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
    		    read_addr2:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
    		    write_addr: IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
    		    write_data: IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    read_out2: 	OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    read_out1: 	OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- BRANCH PREDICTION UNIT -----------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	BPU                 IS
    PORT	    (clk:               IN  STD_LOGIC;
                predictionAddress:  IN  STD_LOGIC_VECTOR (9 DOWNTO 0);     -- initial program counter value
                pcNext_seq:         IN  STD_LOGIC_VECTOR (31 DOWNTO 0);     -- pc + 4
                effectiveResult:    IN  STD_LOGIC;                          -- effective outcome of the branch condition
                branchAddress:      IN  STD_LOGIC_VECTOR (31 DOWNTO 0);     -- branch address
                clearN:             IN  STD_LOGIC;                          -- reset prediction table content
                misprediction:      OUT STD_LOGIC;                          -- misprediction signal
                pcNext:             OUT STD_LOGIC_VECTOR (31 DOWNTO 0)      -- next program counter value
                );
    END 	    COMPONENT;
    -- The signal pcNext_seq must be equal to the actual value of the program counter + 4
    -- If a prediction turns out to be wrong, misprediction is set to 1 for two clock cycles (it can be used to generate two bubbles)
    -- The values of branchAddress and effectiveResult are valid after two clock cycle with respect to predictionAddress and opcode
    -- During the clock cycle in which branchAddress and effectiveResult are valid, pcNext represents the predicted address
    -- During the clock cycle in which predictionAddress and opcode are valid, pcNext represents:
    --      1) the effective address if the prediction turns out to be uncorrect
    --      2) the predicted address of the new instruction otherwise

    -- Internal signals -----------------------------------------------------------------------------------------------------------------------------------------------------
    SIGNAL pcNext:                  STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL pc:                      STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL pcEnable:                STD_LOGIC;
    SIGNAL pcMux_out:               STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL pcNext_seq:              STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL IF_ID_pc_out:            STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL IF_ID_pcseq_out:         STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL IF_ID_enable:            STD_LOGIC;
    SIGNAL HDU_fetchDisable:        STD_LOGIC;
    SIGNAL HDU_pcDisable:           STD_LOGIC;
    SIGNAL BPU_misprediction:       STD_LOGIC;
    SIGNAL BPU_predictionAddress:   STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL rs1:                     STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL rs2:                     STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL opcode:                  STD_LOGIC_VECTOR (6 DOWNTO 0);
    SIGNAL funct3:                  STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL funct7:                  STD_LOGIC_VECTOR (6 DOWNTO 0);
    SIGNAL rd:                      STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL I_IMM:                   STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL U_IMM:                   STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL B_IMM:                   STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL J_IMM:                   STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL SH_IMM:                  STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL S_IMM:                   STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL BPU_branchAddress:       STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL BPU_effectiveResult:     STD_LOGIC;
    SIGNAL RF_read_out2: 	        STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL RF_read_out1: 	        STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL outmux_out: 	            STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL MEM_WB_outmux_out:       STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL regWrite: 	            STD_LOGIC;
    SIGNAL writeSel:                STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL writeEn:                 STD_LOGIC;
    SIGNAL readEn:                  STD_LOGIC;
    SIGNAL branch:                  STD_LOGIC;
    SIGNAL load:                    STD_LOGIC;
    SIGNAL isRS1:                   STD_LOGIC;
    SIGNAL isRS2:                   STD_LOGIC;
    SIGNAL jump:                    STD_LOGIC;
    SIGNAL aluOp:                   STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL aluSel2:                 STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL aluSel1:                 STD_LOGIC;
    SIGNAL bubble:                  STD_LOGIC;
    SIGNAL bm_regWrite: 	        STD_LOGIC;
    SIGNAL bm_writeSel:             STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL bm_writeEn:              STD_LOGIC;
    SIGNAL bm_readEn:               STD_LOGIC;
    SIGNAL bm_branch:               STD_LOGIC;
    SIGNAL bm_load:                 STD_LOGIC;
    SIGNAL bm_isRS1:                STD_LOGIC;
    SIGNAL bm_isRS2:                STD_LOGIC;
    SIGNAL bm_jump:                 STD_LOGIC;
    SIGNAL bm_aluOp:                STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL bm_aluSel2:              STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL bm_aluSel1:              STD_LOGIC;
    SIGNAL hazardBubble:            STD_LOGIC;
	SIGNAL pcALU:                   STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL ID_EX_pcseq_out:         STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL ID_EX_s_imm_out:         STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL ID_EX_pc_out:            STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL ID_EX_i_imm_out:         STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL ID_EX_u_imm_out:         STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL ID_EX_b_imm_out:         STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL ID_EX_j_imm_out:         STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL ID_EX_sh_imm_out:        STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL ID_EX_rd_out:            STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL ID_EX_rs1_out:           STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL ID_EX_rs2_out:           STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL ID_EX_regWrite_out: 	    STD_LOGIC;
    SIGNAL ID_EX_writeSel_out:      STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL ID_EX_writeEn_out:       STD_LOGIC;
    SIGNAL ID_EX_readEn_out:        STD_LOGIC;
    SIGNAL ID_EX_branch_out:        STD_LOGIC;
    SIGNAL ID_EX_load_out:          STD_LOGIC;
    SIGNAL ID_EX_isRS1_out:         STD_LOGIC;
    SIGNAL ID_EX_isRS2_out:         STD_LOGIC;
    SIGNAL ID_EX_jump_out:          STD_LOGIC;
    SIGNAL ID_EX_aluOp_out:         STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL ID_EX_aluSel2_out:       STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL ID_EX_aluSel1_out:       STD_LOGIC;
    SIGNAL aluIN1_mux_out:          STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL aluIN2_mux_out:          STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL forward1_mux_out:        STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL forward2_mux_out:        STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL bj_mux_out:              STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL rs1_fw:                  STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL rs2_fw:                  STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL zero:                    STD_LOGIC;
    SIGNAL alu_out:                 STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL EX_MEM_alu_out:          STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL EX_MEM_pcseq_out:        STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL EX_MEM_rd_out:           STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL EX_MEM_writeSel_out:     STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL EX_MEM_regWrite_out: 	STD_LOGIC;
    SIGNAL outmux_pcseq_in:          STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL MEM_WB_pcseq_out:        STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL MEM_WB_rd_out:           STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL MEM_WB_regWrite_out: 	STD_LOGIC;

	BEGIN
        -- DATAPATH ---------------------------------------------------------------------------------------------------------------------------------------------------------
        pcMux:          mux2to1 GENERIC MAP (32) PORT MAP (pcSel, pcNext, pcIN, pcMux_out);
        PCREG:          reg GENERIC MAP (32) PORT MAP (clk, pcEnable, pcClearN, pcMux_out, pc);
        INC4:           incrementer4 GENERIC MAP (32) PORT MAP (pc, pcNext_seq);
        IF_ID_pc:       reg GENERIC MAP (32) PORT MAP (clk, IF_ID_enable, rstN, pc, IF_ID_pc_out);
        IF_ID_pcseq:    reg GENERIC MAP (32) PORT MAP (clk, IF_ID_enable, rstN, pcNext_seq, IF_ID_pcseq_out);
        BPUnit:         BPU PORT MAP (clk, BPU_predictionAddress, pcNext_seq, BPU_effectiveResult, BPU_branchAddress, pcClearN, BPU_misprediction, pcNext);

        pcEnable <= pcEn AND (NOT(HDU_pcDisable));
        BPU_predictionAddress <= pc(9 DOWNTO 0);
        IMEM_addr <= pc;
        IF_ID_enable <= NOT HDU_fetchDisable;
        IMEM_readEn <= IF_ID_enable;
        rs1 <= IMEM_out(19 DOWNTO 15);
        rs2 <= IMEM_out(24 DOWNTO 20);
        opcode <= IMEM_out(6 DOWNTO 0);
        funct3 <= IMEM_out(14 DOWNTO 12);
        funct7 <= IMEM_out(31 DOWNTO 25);
        rd <= IMEM_out(11 DOWNTO 7);
		I_IMM(11 DOWNTO 0) <= IMEM_out(31 DOWNTO 20);
		I_IMM(31 DOWNTO 12) <= (OTHERS => IMEM_out(31));
		U_IMM(11 DOWNTO 0) <= (OTHERS => '0');
		U_IMM(31 DOWNTO 12) <= IMEM_out(31 DOWNTO 12);
		B_IMM(0) <= '0';
		B_IMM(4 DOWNTO 1) <= IMEM_out(11 DOWNTO 8);
		B_IMM(10 DOWNTO 5) <= IMEM_out(30 DOWNTO 25);
		B_IMM(11) <= IMEM_out(7);
		B_IMM(31 DOWNTO 12) <= (OTHERS => IMEM_out(31));
		J_IMM(0) <= '0';
		J_IMM(10 DOWNTO 1) <= IMEM_out(30 DOWNTO 21);
		J_IMM(11) <= IMEM_out(20);
		J_IMM(19 DOWNTO 12) <= IMEM_out(19 DOWNTO 12);
		J_IMM(31 DOWNTO 20) <= (OTHERS => IMEM_out(31));
		SH_IMM(4 DOWNTO 0) <= IMEM_out(24 DOWNTO 20);
		SH_IMM(31 DOWNTO 5) <= (OTHERS => '0');
		S_IMM(4 DOWNTO 0) <= IMEM_out(11 DOWNTO 7);
		S_IMM(11 DOWNTO 5) <= IMEM_out(31 DOWNTO 25);
		S_IMM(31 DOWNTO 12) <= (OTHERS => IMEM_out(31));

        RegFile:        RF GENERIC MAP (32) PORT MAP (clk, rstN, EX_MEM_regWrite_out, rs1, rs2, EX_MEM_rd_out, outmux_out, RF_read_out2, RF_read_out1);
        ControlUnit:    CU PORT MAP (opcode, funct3, funct7, regWrite, writeSel, writeEn, readEn, branch, load, isRS1, isRS2, jump, aluOp, aluSel2, aluSel1);
        BM:             bubbleMultiplexer PORT MAP (bubble, regWrite, writeSel, writeEn, readEn, branch, load, isRS1, isRS2, jump, aluSel1, aluSel2, aluOp,
                                                    bm_regWrite, bm_writeSel, bm_writeEn, bm_readEn, bm_branch, bm_load, bm_isRS1, bm_isRS2, bm_jump, bm_aluSel1, bm_aluSel2, bm_aluOp);

        bubble <= hazardBubble OR BPU_misprediction;

        ID_EX_pcseq:        reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, IF_ID_pcseq_out, ID_EX_pcseq_out);
        ID_EX_s_imm:        reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, S_IMM, ID_EX_s_imm_out);
        ID_EX_pc:           reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, IF_ID_pc_out, ID_EX_pc_out);
        ID_EX_i_imm:        reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, I_IMM, ID_EX_i_imm_out);
        ID_EX_u_imm:        reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, U_IMM, ID_EX_u_imm_out);
        ID_EX_b_imm:        reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, B_IMM, ID_EX_b_imm_out);
        ID_EX_j_imm:        reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, J_IMM, ID_EX_j_imm_out);
        ID_EX_sh_imm:       reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, SH_IMM, ID_EX_sh_imm_out);
        ID_EX_rd:           reg GENERIC MAP (5) PORT MAP (clk, '1', rstN, rd, ID_EX_rd_out);
        ID_EX_rs1:          reg GENERIC MAP (5) PORT MAP (clk, '1', rstN, rs1, ID_EX_rs1_out);
        ID_EX_rs2:          reg GENERIC MAP (5) PORT MAP (clk, '1', rstN, rs2, ID_EX_rs2_out);
        ID_EX_regWrite:     D_FF PORT MAP (clk, '1', rstN, bm_regWrite, ID_EX_regWrite_out);
        ID_EX_writeSel:     reg GENERIC MAP (2) PORT MAP (clk, '1', rstN, bm_writeSel, ID_EX_writeSel_out);
        ID_EX_writeEn:      D_FF PORT MAP (clk, '1', rstN, bm_writeEn, ID_EX_writeEn_out);
        ID_EX_readEn:       D_FF PORT MAP (clk, '1', rstN, bm_readEn, ID_EX_readEn_out);
        ID_EX_branch:       D_FF PORT MAP (clk, '1', rstN, bm_branch, ID_EX_branch_out);
        ID_EX_load:         D_FF PORT MAP (clk, '1', rstN, bm_load, ID_EX_load_out);
        ID_EX_isRS1:        D_FF PORT MAP (clk, '1', rstN, bm_isRS1, ID_EX_isRS1_out);
        ID_EX_isRS2:        D_FF PORT MAP (clk, '1', rstN, bm_isRS2, ID_EX_isRS2_out);
        ID_EX_jump:         D_FF PORT MAP (clk, '1', rstN, bm_jump, ID_EX_jump_out);
        ID_EX_aluOp:        reg GENERIC MAP (3) PORT MAP (clk, '1', rstN, bm_aluOp, ID_EX_aluOp_out);
        ID_EX_aluSel2:      reg GENERIC MAP (3) PORT MAP (clk, '1', rstN, bm_aluSel2, ID_EX_aluSel2_out);
        ID_EX_aluSel1:      D_FF PORT MAP (clk, '1', rstN, bm_aluSel1, ID_EX_aluSel1_out);
        HDUnit:             HDU PORT MAP (ID_EX_rd_out, ID_EX_regWrite_out, rs1, isRS1, rs2, isRS2, ID_EX_load_out, HDU_fetchDisable, HDU_pcDisable, hazardBubble);
        aluIN1_mux:         mux2to1 GENERIC MAP (32) PORT MAP (ID_EX_aluSel1_out, RF_read_out1, pcALU, aluIN1_mux_out);
        aluIN2_mux:         mux8to1 GENERIC MAP (32) PORT MAP (ID_EX_aluSel2_out, RF_read_out2, ID_EX_i_imm_out, ID_EX_u_imm_out, ID_EX_sh_imm_out, ID_EX_s_imm_out, ID_EX_s_imm_out, ID_EX_s_imm_out, ID_EX_s_imm_out, aluIN2_mux_out);
        forward1_mux:       mux4to1 GENERIC MAP (32) PORT MAP (rs1_fw, aluIN1_mux_out, EX_MEM_alu_out, MEM_WB_outmux_out, aluIN1_mux_out, forward1_mux_out);
        forward2_mux:       mux4to1 GENERIC MAP (32) PORT MAP (rs2_fw, aluIN2_mux_out, EX_MEM_alu_out, MEM_WB_outmux_out, aluIN2_mux_out, forward2_mux_out);
        ALUnit:             ALU GENERIC MAP (32) PORT MAP (forward1_mux_out, forward2_mux_out, ID_EX_aluOp_out, alu_out, zero);

        BPU_effectiveResult <= (zero AND ID_EX_branch_out) OR ID_EX_jump_out;
		pcALU(31 DOWNTO 0) <= ID_EX_pc_out;

        bj_mux:             mux2to1 GENERIC MAP (32) PORT MAP (ID_EX_jump_out, ID_EX_b_imm_out, ID_EX_j_imm_out, bj_mux_out);
        bj_adder:           adder GENERIC MAP (32) PORT MAP (bj_mux_out, ID_EX_pc_out, '0', BPU_branchAddress);
        EX_MEM_alu:         reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, alu_out, EX_MEM_alu_out);
        EX_MEM_pcseq:       reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, ID_EX_pcseq_out, EX_MEM_pcseq_out);
        EX_MEM_rd:          reg GENERIC MAP (5) PORT MAP (clk, '1', rstN, ID_EX_rd_out, EX_MEM_rd_out);
        EX_MEM_writeSel:    reg GENERIC MAP (2) PORT MAP (clk, '1', rstN, ID_EX_writeSel_out, EX_MEM_writeSel_out);
        EX_MEM_regWrite:    D_FF PORT MAP (clk, '1', rstN, ID_EX_regWrite_out, EX_MEM_regWrite_out);

        DMEM_addr <= alu_out(31 DOWNTO 0);
        DMEM_data <= RF_read_out2;
        DMEM_readEn <= ID_EX_readEn_out;
        DMEM_writeEn <= ID_EX_writeEn_out;
		outmux_pcseq_in(31 DOWNTO 0) <= EX_MEM_pcseq_out(31 DOWNTO 0);

        MEM_WB_outmux:      reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, outmux_out, MEM_WB_outmux_out);
        MEM_WB_rd:          reg GENERIC MAP (5) PORT MAP (clk, '1', rstN, EX_MEM_rd_out, MEM_WB_rd_out);
        MEM_WB_regWrite:    D_FF PORT MAP (clk, '1', rstN, EX_MEM_regWrite_out, MEM_WB_regWrite_out);
        outMux:             mux4to1 GENERIC MAP (32) PORT MAP (EX_MEM_writeSel_out, EX_MEM_alu_out, DMEM_out, EX_MEM_alu_out, outmux_pcseq_in, outmux_out);
        FUnit:              FU PORT MAP (EX_MEM_rd_out, EX_MEM_regWrite_out, MEM_WB_rd_out, MEM_WB_regWrite_out, ID_EX_rs1_out, ID_EX_isRS1_out, ID_EX_rs2_out, ID_EX_isRS2_out, ID_EX_load_out, rs1_fw, rs2_fw);

END behaviour;
