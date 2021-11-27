LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-- PARTIAL PRODUCTS GENERATOR ---------------------------------------------------
ENTITY 	partProd	IS
PORT	(in_A:		IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
		in_B:		IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
		P0:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P1:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P2:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P3:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P4:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P5:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P6:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P7:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P8:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P9:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P10:		OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P11:		OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P12:		OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P13:		OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P14:		OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P15:		OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		P16:		OUT STD_LOGIC_VECTOR (32 DOWNTO 0);
		S0:			OUT STD_LOGIC;
		S1:			OUT STD_LOGIC;
		S2:			OUT STD_LOGIC;
		S3:			OUT STD_LOGIC;
		S4:			OUT STD_LOGIC;
		S5:			OUT STD_LOGIC;
		S6:			OUT STD_LOGIC;
		S7:			OUT STD_LOGIC;
		S8:			OUT STD_LOGIC;
		S9:			OUT STD_LOGIC;
		S10:		OUT STD_LOGIC;
		S11:		OUT STD_LOGIC;
		S12:		OUT STD_LOGIC;
		S13:		OUT STD_LOGIC;
		S14:		OUT STD_LOGIC;
		S15:		OUT STD_LOGIC);
END 	partProd ;


-- ARCHITECTURE ----------------------------------------------------------------
ARCHITECTURE behaviour OF partProd IS

	-- GENERATOR OF A SINGLE PARTIAL PRODUCT -----------------------------------
	COMPONENT 	ppgen		IS
	PORT		(b:			IN 	STD_LOGIC;
				b_plus:	 	IN 	STD_LOGIC;
				b_minus: 	IN 	STD_LOGIC;
				in_0: 		IN  STD_LOGIC_VECTOR (32 DOWNTO 0);
				in_A: 		IN  STD_LOGIC_VECTOR (32 DOWNTO 0);
				in_2A: 		IN  STD_LOGIC_VECTOR (32 DOWNTO 0);
				P:			OUT STD_LOGIC_VECTOR (32 DOWNTO 0));
	END 		COMPONENT;

	-- SIGNALS -----------------------------------------------------------------
	SIGNAL A, doubleA, zero: STD_LOGIC_VECTOR (32 DOWNTO 0);

	BEGIN
		-- DATAPATH ------------------------------------------------------------
		A(31 DOWNTO 0) <= in_A;
		A(32) <= '0';
		doubleA(32 DOWNTO 1) <= in_A;
		doubleA(0) <= '0';
		zero <= (OTHERS => '0');
		ppgen0: ppgen PORT MAP (in_B(0), in_B(1), '0', zero, A, doubleA, P0);
		ppgen1: ppgen PORT MAP (in_B(2), in_B(3), in_B(1), zero, A, doubleA, P1);
		ppgen2: ppgen PORT MAP (in_B(4), in_B(5), in_B(3), zero, A, doubleA, P2);
		ppgen3: ppgen PORT MAP (in_B(6), in_B(7), in_B(5), zero, A, doubleA, P3);
		ppgen4: ppgen PORT MAP (in_B(8), in_B(9), in_B(7), zero, A, doubleA, P4);
		ppgen5: ppgen PORT MAP (in_B(10), in_B(11), in_B(9), zero, A, doubleA, P5);
		ppgen6: ppgen PORT MAP (in_B(12), in_B(13), in_B(11), zero, A, doubleA, P6);
		ppgen7: ppgen PORT MAP (in_B(14), in_B(15), in_B(13), zero, A, doubleA, P7);
		ppgen8: ppgen PORT MAP (in_B(16), in_B(17), in_B(15), zero, A, doubleA, P8);
		ppgen9: ppgen PORT MAP (in_B(18), in_B(19), in_B(17), zero, A, doubleA, P9);
		ppgen10: ppgen PORT MAP (in_B(20), in_B(21), in_B(19), zero, A, doubleA, P10);
		ppgen11: ppgen PORT MAP (in_B(22), in_B(23), in_B(21), zero, A, doubleA, P11);
		ppgen12: ppgen PORT MAP (in_B(24), in_B(25), in_B(23), zero, A, doubleA, P12);
		ppgen13: ppgen PORT MAP (in_B(26), in_B(27), in_B(15), zero, A, doubleA, P13);
		ppgen14: ppgen PORT MAP (in_B(28), in_B(29), in_B(27), zero, A, doubleA, P14);
		ppgen15: ppgen PORT MAP (in_B(30), in_B(31), in_B(29), zero, A, doubleA, P15);
		ppgen16: ppgen PORT MAP ('0', '0', in_B(31), zero, A, doubleA, P16);
		S0 <= in_B(1);
		S1 <= in_B(3);
		S2 <= in_B(5);
		S3 <= in_B(7);
		S4 <= in_B(9);
		S5 <= in_B(11);
		S6 <= in_B(13);
		S7 <= in_B(15);
		S8 <= in_B(17);
		S9 <= in_B(19);
		S10 <= in_B(21);
		S11 <= in_B(23);
		S12 <= in_B(25);
		S13 <= in_B(27);
		S14 <= in_B(29);
		S15 <= in_B(31);

END behaviour;
