LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-- TOP LEVEL ENTITY ------------------------------------------------------------
ENTITY 	stage2_modified 	IS 
PORT	(A_EXP: 			IN	STD_LOGIC_VECTOR (7 DOWNTO 0);
		A_SIG: 				IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
		B_EXP: 				IN	STD_LOGIC_VECTOR (7 DOWNTO 0);
		B_SIG: 				IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
		SIGN_out_stage1: 	IN	STD_LOGIC;
		clk: 				IN	STD_LOGIC;
		isINF_stage1: 		IN	STD_LOGIC;
		isNaN_stage1: 		IN	STD_LOGIC;
		isZ_tab_stage1: 	IN	STD_LOGIC;
		rstN:				IN   STD_LOGIC;
      	EXP_in: 			OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
      	EXP_neg_stage2: 	OUT	STD_LOGIC;
      	EXP_pos_stage2: 	OUT	STD_LOGIC;
      	SIGN_out_stage2: 	OUT	STD_LOGIC;
      	SIG_in: 			OUT	STD_LOGIC_VECTOR (27 DOWNTO 0);
      	isINF_stage2: 		OUT	STD_LOGIC;
      	isNaN_stage2: 		OUT	STD_LOGIC;
      	isZ_tab_stage2: 	OUT	STD_LOGIC);
END 	stage2_modified ;


-- ARCHITECTURE ----------------------------------------------------------------
ARCHITECTURE behaviour OF stage2_modified IS 

	-- STAGE2 ------------------------------------------------------------------
	COMPONENT	FPmul_stage2
		PORT	(A_EXP: 			IN	STD_LOGIC_VECTOR (7 DOWNTO 0);
				A_SIG: 				IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				B_EXP: 				IN	STD_LOGIC_VECTOR (7 DOWNTO 0);
				B_SIG: 				IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SIGN_out_stage1: 	IN	STD_LOGIC;
				clk: 				IN	STD_LOGIC;
				isINF_stage1: 		IN	STD_LOGIC;
				isNaN_stage1: 		IN	STD_LOGIC;
				isZ_tab_stage1: 	IN	STD_LOGIC;
			  	EXP_in: 			OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
			  	EXP_neg_stage2: 	OUT	STD_LOGIC;
			  	EXP_pos_stage2: 	OUT	STD_LOGIC;
			  	SIGN_out_stage2: 	OUT	STD_LOGIC;
			  	SIG_in: 			OUT	STD_LOGIC_VECTOR (27 DOWNTO 0);
			  	isINF_stage2: 		OUT	STD_LOGIC;
			  	isNaN_stage2: 		OUT	STD_LOGIC;
			  	isZ_tab_stage2: 	OUT	STD_LOGIC);
	END 	COMPONENT;

	-- REGISTER ----------------------------------------------------------------
	COMPONENT 	reg 
	GENERIC		(N:         		INTEGER);
	PORT 		(clk: 		IN		STD_LOGIC;
				enable: 	IN		STD_LOGIC;
				clearN: 	IN		STD_LOGIC;
				regIN: 		IN  	STD_LOGIC_VECTOR (N-1 downto 0);
				regOUT: 	OUT		STD_LOGIC_VECTOR (N-1 downto 0));
	END 		COMPONENT; 

	-- D FLIP FLOP -------------------------------------------------------------
	COMPONENT 	D_FF 		IS
	PORT	(clk:		IN	STD_LOGIC;
			enable:		IN 	STD_LOGIC;
			clearN: 	IN 	STD_LOGIC;
			dffIN: 		IN 	STD_LOGIC;
			dffOUT: 	OUT STD_LOGIC);
	END 	COMPONENT;
    
	-- SIGNALS -----------------------------------------------------------------
	SIGNAL 	Reg1_IN: 	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	Reg2_IN:	STD_LOGIC_VECTOR (27 DOWNTO 0);
	SIGNAL	DFF1_IN:	STD_LOGIC;
	SIGNAL	DFF2_IN:	STD_LOGIC;
	SIGNAL	DFF3_IN:	STD_LOGIC;
	SIGNAL	DFF4_IN:	STD_LOGIC;
	SIGNAL	DFF5_IN:	STD_LOGIC;
	SIGNAL	DFF6_IN:	STD_LOGIC;
		
	BEGIN
		-- DATAPATH ------------------------------------------------------------
		stage2:	FPmul_stage2 
				PORT MAP (
				A_EXP           => A_EXP,
				A_SIG           => A_SIG,
				B_EXP           => B_EXP,
				B_SIG           => B_SIG,
				SIGN_out_stage1 => SIGN_out_stage1,
				clk             => clk,
				isINF_stage1    => isINF_stage1,
				isNaN_stage1    => isNaN_stage1,
				isZ_tab_stage1  => isZ_tab_stage1,
				EXP_in          => Reg1_IN,
				EXP_neg_stage2  => DFF1_IN,
				EXP_pos_stage2  => DFF2_IN,
				SIGN_out_stage2 => DFF3_IN,
				SIG_in          => Reg2_IN,
				isINF_stage2    => DFF4_IN,
				isNaN_stage2    => DFF5_IN,
				isZ_tab_stage2  => DFF6_IN);

		reg1:	reg GENERIC MAP (8)  PORT MAP (clk, '1', rstN, Reg1_IN, EXP_in);
		reg2:	reg GENERIC MAP (28) PORT MAP (clk, '1', rstN, Reg2_IN, SIG_in);
		dff1:	D_FF PORT MAP (clk, '1', rstN, DFF1_IN, EXP_neg_stage2);
		dff2:	D_FF PORT MAP (clk, '1', rstN, DFF2_IN, EXP_pos_stage2);
		dff3:	D_FF PORT MAP (clk, '1', rstN, DFF3_IN, SIGN_out_stage2);
		dff4:	D_FF PORT MAP (clk, '1', rstN, DFF4_IN, isINF_stage2);
		dff5:	D_FF PORT MAP (clk, '1', rstN, DFF5_IN, isNaN_stage2);
		dff6:	D_FF PORT MAP (clk, '1', rstN, DFF6_IN, isZ_tab_stage2);
	
		
END behaviour;






















