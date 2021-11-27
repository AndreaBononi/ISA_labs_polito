LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-- TOP LEVEL ENTITY ------------------------------------------------------------
ENTITY 	top_mul 	IS 
PORT	(FP_A:		IN   STD_LOGIC_VECTOR (31 DOWNTO 0);
      	FP_B:		IN   STD_LOGIC_VECTOR (31 DOWNTO 0);
      	clk:		IN   STD_LOGIC;
	  	rstN:		IN   STD_LOGIC;
      	FP_Z:		OUT  STD_LOGIC_VECTOR (31 DOWNTO 0));
END 	top_mul ;


-- ARCHITECTURE ----------------------------------------------------------------
ARCHITECTURE behaviour OF top_mul IS 

	-- MULTIPLIER --------------------------------------------------------------
	COMPONENT 	FPmul
	PORT		(FP_A:		IN     STD_LOGIC_VECTOR (31 DOWNTO 0);
		  		FP_B:		IN     STD_LOGIC_VECTOR (31 DOWNTO 0);
		  		clk:		IN     STD_LOGIC;
		  		FP_Z:		OUT    STD_LOGIC_VECTOR (31 DOWNTO 0));
	END 		COMPONENT;

	-- REGISTER ----------------------------------------------------------------
	COMPONENT 	reg 
	GENERIC		(N:         		INTEGER);
	PORT 		(clk: 		IN		STD_LOGIC;
				enable: 	IN		STD_LOGIC;
				clearN: 	IN		STD_LOGIC;
				regIN: 		IN  	STD_LOGIC_VECTOR (N-1 downto 0);
				regOUT: 	OUT		STD_LOGIC_VECTOR (N-1 downto 0));
	END 		COMPONENT; 
    
	-- SIGNALS -----------------------------------------------------------------
	SIGNAL 	RegA_OUT: 	STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL	RegB_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
		
	BEGIN
		-- DATAPATH ------------------------------------------------------------
		regA:	reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, FP_A, RegA_OUT);
		regB:	reg GENERIC MAP (32) PORT MAP (clk, '1', rstN, FP_B, RegB_OUT);
		mul:	FPmul PORT MAP (RegA_OUT, RegB_OUT, clk, FP_Z);
	
		
END behaviour;
