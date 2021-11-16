LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- IIR low pass filter

-- In this description, the input data are simply formatted as SIGNED values
-- Actually, they are fixed point numbers ranging from -1 to 1 (fractional point numbers)
-- The product of two fractional point numbers (in this case with a parallelism of 11 bits) is still a fractional point number, but it has more decimal bits (it has a parallelism of 21)
-- Due to the fact that the input data are formatted as SIGNED (the decimal point is not taken into account), the product must have a parallelism of 22, even though the MSB is useless


------------------------------------------------------------------------------------------------------------------------------

ENTITY advanced_IIR IS
	PORT (clk:		IN STD_LOGIC;
			rstN: 	IN STD_LOGIC;
			vin: 		IN STD_LOGIC;
			a1: 		IN SIGNED (10 DOWNTO 0);
			a1quad: 	IN SIGNED (10 DOWNTO 0);
			b1: 		IN SIGNED (10 DOWNTO 0);
			b0: 		IN SIGNED (10 DOWNTO 0);
			din: 		IN SIGNED (10 DOWNTO 0);
			dout: 	OUT SIGNED (10 DOWNTO 0);
			vout: 	OUT STD_LOGIC);
END advanced_IIR;

------------------------------------------------------------------------------------------------------------------------------

ARCHITECTURE behaviour OF advanced_IIR IS

	COMPONENT reg IS
	GENERIC (N: 		INTEGER);
	PORT 	  (clk: 		IN STD_LOGIC;
				enable: 	IN STD_LOGIC;
				clearN: 	IN STD_LOGIC;
				regIN: 	IN SIGNED (N-1 DOWNTO 0);
				regOUT: 	OUT SIGNED (N-1 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT D_FF IS
	PORT (clk, enable, clearN: IN STD_LOGIC;
			dffIN: IN STD_LOGIC;
			dffOUT: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT sat IS
	PORT 	  (SatIN: 	IN SIGNED (11 downto 0);
				SatOUT: 	OUT SIGNED (10 downto 0));
	END COMPONENT;
	
	-- STATUS:
	TYPE STATE_TYPE IS (resetState, activeState, waitState);
	SIGNAL presentState, nextState: STATE_TYPE;
	
	-- CONTROL SIGNALS:
	SIGNAL regClearN, regEnable, VReg5ClearN: STD_LOGIC;
	
	-- DATA SIGNALS:
	SIGNAL InRegOUT, Reg1OUT, Reg2IN, Reg2OUT, Reg3OUT, Reg4OUT, OutRegIN, subOUT: SIGNED (10 DOWNTO 0);
	SIGNAL Reg5IN, Reg6IN, Reg5OUT, Reg6OUT: SIGNED (10 DOWNTO 0);
	SIGNAL LoopRegA_IN, LoopRegA_OUT, LoopRegB_IN, LoopRegB_OUT: SIGNED (10 DOWNTO 0);
	SIGNAL Mul1, Mul2, Mul3, Mul4: SIGNED (21 DOWNTO 0);
	SIGNAL r, r1, r2, q, q1, q2, t1, t2, t: SIGNED (11 DOWNTO 0);
	SIGNAL VReg2_IN, VReg3_IN, VReg4_IN, VReg5_IN: STD_LOGIC;

	BEGIN
		-- DATAPATH:
		InReg: 				reg GENERIC MAP(11) PORT MAP(clk, '1', regClearN, din, InRegOUT);
		Reg1:					reg GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, InRegOUT, Reg1OUT);
		Mul1					<= Reg1OUT * a1;
		Reg2IN				<= Mul1(20 DOWNTO 10);
		Reg2:					reg GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, Reg2IN, Reg2OUT);
		LoopRegA:			reg GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, LoopRegA_IN, LoopRegA_OUT);
		Mul2					<= LoopRegA_OUT * a1quad;
		LoopRegB_IN 		<= Mul2(20 DOWNTO 10);
		LoopRegB:			reg GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, LoopRegB_IN, LoopRegB_OUT);
		r1 (10 downto 0) 	<= LoopRegB_OUT;
      r1 (11) 				<= r1(10);
      r2 (10 downto 0) 	<= Reg2OUT;
      r2 (11) 				<= r2(10);
		r						<= r1 - r2;
		Sat1: 				sat PORT MAP (r, subOUT);
		q1 (10 downto 0) 	<= subOUT;
      q1 (11) 				<= q1(10);
      q2 (10 downto 0) 	<= Reg1OUT;
      q2 (11) 				<= q2(10);
		q						<= q1 + q2;
		Sat2: 				sat PORT MAP (q, LoopRegA_IN);
		Reg3:					reg GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, LoopRegA_IN, Reg3OUT);
		Reg4:					reg GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, LoopRegA_OUT, Reg4OUT);
		Mul3					<= Reg3OUT * b0;
		Reg5IN				<= Mul3(20 DOWNTO 10);
		Mul4					<= Reg4OUT * b1;
		Reg6IN				<= Mul4(20 DOWNTO 10);
		Reg5:					reg GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, Reg5IN, Reg5OUT);
		Reg6:					reg GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, Reg6IN, Reg6OUT);
		t1 (10 downto 0) 	<= Reg5OUT;
      t1 (11) 				<= t1(10);
      t2 (10 downto 0) 	<= Reg6OUT;
      t2 (11) 				<= t2(10);
		t						<= t1 + t2;
		Sat3: 				sat PORT MAP (t, OutRegIN);
		OutReg: 				REG GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, OutRegIN, dout);
		VReg1: 				D_FF PORT MAP(clk, '1', regClearN, '1', VReg2_IN);
		VReg2: 				D_FF PORT MAP(clk, '1', regClearN, VReg2_IN, VReg3_IN);
		VReg3: 				D_FF PORT MAP(clk, '1', regClearN, VReg3_IN, VReg4_IN);
		VReg4: 				D_FF PORT MAP(clk, '1', regClearN, VReg4_IN, VReg5_IN);
		VReg5: 				D_FF PORT MAP(clk, '1', VReg5ClearN, VReg5_IN, vout);
		
		-- CONTROL UNIT:
		-- Next State Evaluation
		nextStateEvaluation: PROCESS(presentState, rstN, vin)
		BEGIN
			IF(rstN = '0') THEN nextState <= resetState;
			ELSE
				CASE presentState IS
					WHEN resetState | activeState | waitState =>
						IF (vin = '1') THEN nextState <= activeState;
						ELSE nextState <= waitState;
						END IF;
				END CASE;
			END IF;
		END PROCESS nextStateEvaluation;
		
		-- State Transition
		stateTransition: PROCESS (clk)
		BEGIN
			IF (rising_edge(clk)) THEN presentState <= nextState;
			END IF;
		END PROCESS stateTransition;
		
		-- Output Evaluation
		outputEvaluation: PROCESS(presentState)
		BEGIN
			-- Default Values :
			regClearN <= '1';
			regEnable <= '1';
			VReg5ClearN <= '1';
			CASE presentState IS
				WHEN resetState =>
					regClearn <= '0';
					VReg5ClearN <= '0';
				WHEN activeState =>
				WHEN waitState =>
					regEnable <= '0';
					VReg5ClearN <= '0';
			END CASE;
		END PROCESS outputEvaluation;
		
END behaviour;

------------------------------------------------------------------------------------------------------------------------------
