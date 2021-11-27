LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- GENERATOR OF A SINGLE PARTIAL PRODUCT ----------------------------------------------
ENTITY 	ppgen		IS
PORT	(b:			IN 	STD_LOGIC;
		b_plus:	 	IN 	STD_LOGIC;
		b_minus: 	IN 	STD_LOGIC;
		in_0: 		IN  STD_LOGIC_VECTOR (32 DOWNTO 0);
		in_A: 		IN  STD_LOGIC_VECTOR (32 DOWNTO 0);
		in_2A: 		IN  STD_LOGIC_VECTOR (32 DOWNTO 0);
		P:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0));
END 	ppgen;


-- ARCHITECTURE -----------------------------------------------------------------------
ARCHITECTURE behaviour OF ppgen IS

	-- Modified Booth Encoder ---------------------------------------------------------
	COMPONENT 	MB_Encoder 	IS
	PORT		(b:			IN	STD_LOGIC;
				b_plus:		IN	STD_LOGIC;
				b_minus:	IN	STD_LOGIC;
				sel:		OUT	STD_LOGIC_VECTOR (1 DOWNTO 0));
	END 		COMPONENT;

	-- Multiplexer 4to1 ---------------------------------------------------------------
	COMPONENT 	mux4to1 IS
	GENERIC		(N: 	INTEGER);
	PORT		(sel:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
				in_00: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_01: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_10: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_11:	IN 	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				muxout: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
	END 		COMPONENT;


	SIGNAL sel: 	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL mux_out:	STD_LOGIC_VECTOR (32 DOWNTO 0);
	SIGNAL res: 	STD_LOGIC_VECTOR (32 DOWNTO 0);

	BEGIN

		-- Datapath -------------------------------------------------------------------
		enc: MB_Encoder PORT MAP (b, b_plus, b_minus, sel);
		mux: mux4to1 GENERIC MAP (33) PORT MAP (sel, in_2A, in_0, in_A, in_0, mux_out);
		P(0) <= mux_out(0) XOR b_plus;
		P(1) <= mux_out(1) XOR b_plus;
		P(2) <= mux_out(2) XOR b_plus;
		P(3) <= mux_out(3) XOR b_plus;
		P(4) <= mux_out(4) XOR b_plus;
		P(5) <= mux_out(5) XOR b_plus;
		P(6) <= mux_out(6) XOR b_plus;
		P(7) <= mux_out(7) XOR b_plus;
		P(8) <= mux_out(8) XOR b_plus;
		P(9) <= mux_out(9) XOR b_plus;
		P(10) <= mux_out(10) XOR b_plus;
		P(11) <= mux_out(11) XOR b_plus;
		P(12) <= mux_out(12) XOR b_plus;
		P(13) <= mux_out(13) XOR b_plus;
		P(14) <= mux_out(14) XOR b_plus;
		P(15) <= mux_out(15) XOR b_plus;
		P(16) <= mux_out(16) XOR b_plus;
		P(17) <= mux_out(17) XOR b_plus;
		P(18) <= mux_out(18) XOR b_plus;
		P(19) <= mux_out(19) XOR b_plus;
		P(20) <= mux_out(20) XOR b_plus;
		P(21) <= mux_out(21) XOR b_plus;
		P(22) <= mux_out(22) XOR b_plus;
		P(23) <= mux_out(23) XOR b_plus;
		P(24) <= mux_out(24) XOR b_plus;
		P(25) <= mux_out(25) XOR b_plus;
		P(26) <= mux_out(26) XOR b_plus;
		P(27) <= mux_out(27) XOR b_plus;
		P(28) <= mux_out(28) XOR b_plus;
		P(29) <= mux_out(29) XOR b_plus;
		P(30) <= mux_out(30) XOR b_plus;
		P(31) <= mux_out(31) XOR b_plus;
		P(32) <= mux_out(32) XOR b_plus;

END behaviour;
