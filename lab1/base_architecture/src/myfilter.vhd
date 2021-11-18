LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

 -- In this description, the input data are simply formatted as SIGNED values
-- Actually, they are fixed point numbers ranging from -1 to 1 (fractional point numbers)
-- The product of two fractional point numbers (in this case with a parallelism of 11 bits) is still a fractional point number, but it has more decimal bits (it has a parallelism of 21)
-- Due to the fact that the input data are formatted as SIGNED (the decimal point is not taken into account), the product must have a parallelism of 22, even though the MSB is useless


-- IIR LOW PASS FILTER -------------------------------------------------------------------------------------------------------
ENTITY 	myfilter 	IS
PORT	(clk:		IN 	STD_LOGIC;
		rstN: 		IN 	STD_LOGIC;
		vin: 		IN 	STD_LOGIC;
		a1: 		IN 	SIGNED (10 DOWNTO 0);
		b1: 		IN 	SIGNED (10 DOWNTO 0);
		b0: 		IN 	SIGNED (10 DOWNTO 0);
		din: 		IN 	SIGNED (10 DOWNTO 0);
		dout: 		OUT SIGNED (10 DOWNTO 0);
		vout: 		OUT STD_LOGIC);
END 	myfilter;


-- ARCHITECTURE ---------------------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF myfilter IS

	-- Component: register N bit ----------------------------------------------------------------------------------------------
	COMPONENT 	reg 		IS
	GENERIC 	(N: 			INTEGER);
	PORT 	  	(clk: 		IN 	STD_LOGIC;
				enable: 	IN	STD_LOGIC;
				clearN: 	IN 	STD_LOGIC;
				regIN: 		IN 	SIGNED (N-1 DOWNTO 0);
				regOUT: 	OUT SIGNED (N-1 DOWNTO 0));
	END 		COMPONENT;
	
	-- Component: D flip flop -------------------------------------------------------------------------------------------------
	COMPONENT 	D_FF 		IS
	PORT 		(clk: 		IN 	STD_LOGIC;
				enable: 	IN 	STD_LOGIC;
				clearN: 	IN 	STD_LOGIC;
				dffIN: 		IN 	STD_LOGIC;
				dffOUT: 	OUT STD_LOGIC);
	END 		COMPONENT;

	-- Component: saturation block --------------------------------------------------------------------------------------------
	COMPONENT 	sat 		IS
	PORT 	  	(SatIN: 	IN 	SIGNED (11 downto 0);
				SatOUT: 	OUT SIGNED (10 downto 0));
	END COMPONENT;
	
	-- STATUS -----------------------------------------------------------------------------------------------------------------
	TYPE STATE_TYPE IS (resetState, activeState, waitState);
	SIGNAL presentState, nextState: STATE_TYPE;
	
	-- CONTROL SIGNALS --------------------------------------------------------------------------------------------------------
	SIGNAL regClearN, regEnable: STD_LOGIC;
	
	-- DATA SIGNALS -----------------------------------------------------------------------------------------------------------
	SIGNAL IntRegIN, IntRegOUT, InRegOUT, OutRegIN, OutRegOUT: SIGNED (10 DOWNTO 0);
	SIGNAL ff, fb, w, w2: SIGNED (10 downto 0);
	SIGNAL r, r1, r2, q, q1, q2: SIGNED (11 downto 0);
	SIGNAL mul1, mul2, mul3: SIGNED (21 DOWNTO 0);
	SIGNAL p2IN, p2OUT: STD_LOGIC;

	BEGIN
		-- DATAPATH -----------------------------------------------------------------------------------------------------------
		InReg: reg GENERIC MAP(11) PORT MAP(clk, '1', regClearN, din, InRegOUT);
		OutReg: reg GENERIC MAP(11) PORT MAP(clk, '1', regClearN, OutRegIN, OutRegOUT);
		IntReg: reg GENERIC MAP(11) PORT MAP(clk, regEnable, regClearN, IntRegIN, IntRegOUT);
		p1: D_FF PORT MAP(clk, '1', regClearN, vin, p2IN);
		p2: D_FF PORT MAP(clk, '1', regClearN, p2IN, p2OUT);
		mul1 <= IntRegOUT * b1;
		ff <= mul1 (20 DOWNTO 10);
		mul2 <= IntRegOUT * a1;
		fb <= mul2 (20 DOWNTO 10);
        r1 (10 downto 0) <= InRegOUT;
        r1 (11) <= r1(10);
        r2 (10 downto 0) <= fb;
        r2 (11) <= r2(10);
		r <= r1 - r2;
		Sat1: sat PORT MAP (r, w);
		IntRegIN <= w;
		mul3 <= w * b0;
		w2 <= mul3 (20 DOWNTO 10);
		q1(10 downto 0) <= w2;
        q1(11) <= q1(10);
        q2(10 downto 0) <= ff;
        q2(11) <= q2(10);
		q <= q1 + q2;
		Sat2: sat PORT MAP (q, OutRegIN);
		dout <= OutRegOUT;
		vout <= p2OUT;
		
		-- CONTROL UNIT -------------------------------------------------------------------------------------------------------
		-- Next State Evaluation ----------------------------------------------------------------------------------------------
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
		
		-- State Transition ----------------------------------------------------------------------------------------------------
		stateTransition: PROCESS (clk)
		BEGIN
			IF (rising_edge(clk)) THEN presentState <= nextState;
			END IF;
		END PROCESS stateTransition;
		
		-- Output Evaluation ---------------------------------------------------------------------------------------------------
		outputEvaluation: PROCESS(presentState)
		BEGIN
			-- Default Values --------------------------------------------------------------------------------------------------
			regClearN <= '1';
			regEnable <= '1';
			CASE presentState IS
				WHEN resetState =>
					regClearn <= '0';
				WHEN activeState =>
				WHEN waitState =>
					regEnable <= '0';
			END CASE;
		END PROCESS outputEvaluation;
		
END behaviour;
