LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- BRANCH PREDICTION UNIT --------------------------------------------------------------------------------------------------------------------------------------------
ENTITY 	BPU                 IS
PORT	(clk:               IN  STD_LOGIC;
        predictionAddress:  IN  STD_LOGIC_VECTOR (9 DOWNTO 0);     -- initial program counter value
        pcNext_seq:         IN  STD_LOGIC_VECTOR (31 DOWNTO 0);     -- pc + 4
        effectiveResult:    IN  STD_LOGIC;                          -- effective outcome of the branch condition
        branchAddress:      IN  STD_LOGIC_VECTOR (31 DOWNTO 0);     -- branch address
        clearN:             IN  STD_LOGIC;                          -- reset prediction table content
        misprediction:      OUT STD_LOGIC;                          -- misprediction signal
        pcNext:             OUT STD_LOGIC_VECTOR (31 DOWNTO 0)      -- next program counter value
        );
END 	BPU;
-- The signal pcNext_seq must be equal to the actual value of the program counter + 4
-- If a prediction turns out to be wrong, misprediction is set to 1 for two clock cycles (it can be used to generate two bubbles)
-- The values of branchAddress and effectiveResult are valid after two clock cycle with respect to predictionAddress
-- During the clock cycle in which branchAddress and effectiveResult are valid, pcNext represents the predicted address
-- During the clock cycle in which predictionAddress is valid, pcNext represents:
--      1) the effective address if the prediction turns out to be uncorrect
--      2) the predicted address of the new instruction otherwise

-- ARCHITECTURE ------------------------------------------------------------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF BPU IS

    -- Register N bit ------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	reg 		IS
    GENERIC	    (N: 		INTEGER := 8);
    PORT	    (clk: 		IN STD_LOGIC;
    		    enable: 	IN STD_LOGIC;
    		    clearN: 	IN STD_LOGIC;
    		    regIN: 		IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    regOUT: 	OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- D Flip Flop ---------------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	D_FF 		IS
    PORT	    (clk:		IN	STD_LOGIC;
    		    enable:		IN 	STD_LOGIC;
    		    clearN: 	IN 	STD_LOGIC;
    		    dffIN: 		IN 	STD_LOGIC;
    		    dffOUT: 	OUT STD_LOGIC);
    END 	    COMPONENT;

    -- Multiplexer 2 to 1 N bit --------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	mux2to1     IS
    GENERIC	    (N: 	    INTEGER := 8);
    PORT	    (sel:	    IN  STD_LOGIC;
    		    in0: 	    IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    in1: 	    IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    muxout:     OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- Prediction Table ----------------------------------------------------------------------------------------------------------------------------------------------
    COMPONENT 	predictionTable  IS
    PORT	    (clk:	         IN  STD_LOGIC;
    		    readAddress: 	 IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
				writeAddress: 	 IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
    		    clearPT: 	     IN  STD_LOGIC;
                data: 	         IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
                writePT: 	     IN  STD_LOGIC;
				readPT: 	     IN  STD_LOGIC;
    		    addressPT:       OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                prediction:      OUT STD_LOGIC
    		    );
    END 	    COMPONENT;

    -- INTERNAL SIGNALS ----------------------------------------------------------------------------------------------------------------------------------------------
    SIGNAL reg1_out:            STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL reg2_out:            STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL reg3_out:            STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL reg4_out:            STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL errMux_out:          STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL predMux_out:         STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL addressPT:           STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL prediction:          STD_LOGIC;
    SIGNAL initialN:            STD_LOGIC;
    SIGNAL dff1_out:            STD_LOGIC;
    SIGNAL dff2_out:            STD_LOGIC;
    SIGNAL dff5_out:            STD_LOGIC;
    SIGNAL cu_misprediction:    STD_LOGIC;
    SIGNAL predMux_sel:         STD_LOGIC;
	SIGNAL clearPT:				STD_LOGIC;
	SIGNAL dff1_clearN:			STD_LOGIC;

    BEGIN

        REG1:       reg GENERIC MAP (32) PORT MAP (clk, '1', clearN, pcNext_seq, reg1_out);
        REG2:       reg GENERIC MAP (32) PORT MAP (clk, '1', clearN, reg1_out, reg2_out);
        ERRMUX:     mux2to1 GENERIC MAP (32) PORT MAP (dff2_out, branchAddress, reg2_out, errMux_out);
        OUTMUX:     mux2to1 GENERIC MAP (32) PORT MAP (cu_misprediction, predMux_out, errMux_out, pcNext);
        PREDMUX:    mux2to1 GENERIC MAP (32) PORT MAP (predMux_sel, pcNext_seq, addressPT, predMux_out);
		REG3:       reg GENERIC MAP (10) PORT MAP (clk, '1', clearN, predictionAddress, reg3_out);
        REG4:       reg GENERIC MAP (10) PORT MAP (clk, '1', clearN, reg3_out, reg4_out);
        PT:         predictionTable PORT MAP (clk, predictionAddress, reg4_out, clearPT, branchAddress, cu_misprediction, '1', addressPT, prediction);
        DFF1:       D_FF PORT MAP (clk, '1', dff1_clearN, prediction, dff1_out);
        DFF2:       D_FF PORT MAP (clk, '1', clearN, dff1_out, dff2_out);
        DFF5:       D_FF PORT MAP (clk, '1', clearN, cu_misprediction, dff5_out);

        predMux_sel         <= prediction;
        cu_misprediction   <= dff2_out XOR effectiveResult;
        misprediction       <= cu_misprediction OR dff5_out;
		clearPT				<= NOT clearN;
		dff1_clearN			<= clearN AND (NOT cu_misprediction);

END behaviour;
