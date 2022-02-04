LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- REGISTER FILE 32x32bit --------------------------------------------------------------------------------
ENTITY	RF 			IS
GENERIC (N: 		INTEGER := 32);
PORT 	(clk: 		IN  STD_LOGIC;
		clearN: 	IN  STD_LOGIC;
		regWrite: 	IN  STD_LOGIC;
		read_addr1:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		read_addr2:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		write_addr: IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		write_data: IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		read_out2: 	OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		read_out1: 	OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
		);
END 	RF;

-- ARCHITECTURE ------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF RF IS

	-- Internal signals ----------------------------------------------------------------------------------
	SIGNAL x0_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x1_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x2_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x3_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x4_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x5_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x6_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x7_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x8_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x9_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x10_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x11_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x12_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x13_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x14_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x15_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x16_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x17_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x18_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x19_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x20_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x21_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x22_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x23_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x24_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x25_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x26_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x27_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x28_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x29_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x30_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL x31_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL dec_out: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL enable:  STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL m1_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL m2_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL p1_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL p2_out:	STD_LOGIC_VECTOR (N-1 DOWNTO 0);

	-- Register N bit ------------------------------------------------------------------------------------
	COMPONENT	reg  		IS
	GENERIC		(N: 		INTEGER);
	PORT		(clk: 		IN STD_LOGIC;
				enable: 	IN STD_LOGIC;
				clearN: 	IN STD_LOGIC;
				regIN: 		IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				regOUT: 	OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
				);
	END 	COMPONENT;

	-- Multiplexer 32 to 1 Nbit --------------------------------------------------------------------------
	COMPONENT 	mux32to1 IS
	GENERIC	(N: 		INTEGER := 32);
	PORT 		(sel:		IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
				in_00000: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_00001: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_00010:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_00011:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_00100:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_00101:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_00110:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_00111:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_01000:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_01001:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_01010:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_01011:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_01100:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_01101:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_01110:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_01111:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_10000:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_10001:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_10010:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_10011:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_10100:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_10101:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_10110:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_10111:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_11000:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_11001:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_11010:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_11011:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_11100:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_11101:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_11110:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_11111:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				muxout: 	OUT STD_LOGIC_VECTOR (N-1  DOWNTO 0)
				);
	END 		COMPONENT;

	-- RF decoder ---------------------------------------------------------------------------------------
	COMPONENT 	decoder IS
	PORT		(dec_in:	IN	STD_LOGIC_VECTOR (4 DOWNTO 0);
			 	dec_out: 	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			 	);
	END 		COMPONENT;

	BEGIN
		-- Datapath -------------------------------------------------------------------------------------
		DEC: decoder PORT MAP (write_addr, dec_out);
		enable(0)  <= dec_out(0)  AND regWrite;
		enable(1)  <= dec_out(1)  AND regWrite;
		enable(2)  <= dec_out(2)  AND regWrite;
		enable(3)  <= dec_out(3)  AND regWrite;
		enable(4)  <= dec_out(4)  AND regWrite;
		enable(5)  <= dec_out(5)  AND regWrite;
		enable(6)  <= dec_out(6)  AND regWrite;
		enable(7)  <= dec_out(7)  AND regWrite;
		enable(8)  <= dec_out(8)  AND regWrite;
		enable(9)  <= dec_out(9)  AND regWrite;
		enable(10) <= dec_out(10) AND regWrite;
		enable(11) <= dec_out(11) AND regWrite;
		enable(12) <= dec_out(12) AND regWrite;
		enable(13) <= dec_out(13) AND regWrite;
		enable(14) <= dec_out(14) AND regWrite;
		enable(15) <= dec_out(15) AND regWrite;
		enable(16) <= dec_out(16) AND regWrite;
		enable(17) <= dec_out(17) AND regWrite;
		enable(18) <= dec_out(18) AND regWrite;
		enable(19) <= dec_out(19) AND regWrite;
		enable(20) <= dec_out(20) AND regWrite;
		enable(21) <= dec_out(21) AND regWrite;
		enable(22) <= dec_out(22) AND regWrite;
		enable(23) <= dec_out(23) AND regWrite;
		enable(24) <= dec_out(24) AND regWrite;
		enable(25) <= dec_out(25) AND regWrite;
		enable(26) <= dec_out(26) AND regWrite;
		enable(27) <= dec_out(27) AND regWrite;
		enable(28) <= dec_out(28) AND regWrite;
		enable(29) <= dec_out(29) AND regWrite;
		enable(30) <= dec_out(30) AND regWrite;
		enable(31) <= dec_out(31) AND regWrite;
		x0:  reg GENERIC MAP (N) PORT MAP (clk, enable(0), clearN, write_data, x0_out);
		x1:  reg GENERIC MAP (N) PORT MAP (clk, enable(1), clearN, write_data, x1_out);
		x2:  reg GENERIC MAP (N) PORT MAP (clk, enable(2), clearN, write_data, x2_out);
		x3:  reg GENERIC MAP (N) PORT MAP (clk, enable(3), clearN, write_data, x3_out);
		x4:  reg GENERIC MAP (N) PORT MAP (clk, enable(4), clearN, write_data, x4_out);
		x5:  reg GENERIC MAP (N) PORT MAP (clk, enable(5), clearN, write_data, x5_out);
		x6:  reg GENERIC MAP (N) PORT MAP (clk, enable(6), clearN, write_data, x6_out);
		x7:  reg GENERIC MAP (N) PORT MAP (clk, enable(7), clearN, write_data, x7_out);
		x8:  reg GENERIC MAP (N) PORT MAP (clk, enable(8), clearN, write_data, x8_out);
		x9:  reg GENERIC MAP (N) PORT MAP (clk, enable(9), clearN, write_data, x9_out);
		x10: reg GENERIC MAP (N) PORT MAP (clk, enable(10), clearN, write_data, x10_out);
		x11: reg GENERIC MAP (N) PORT MAP (clk, enable(11), clearN, write_data, x11_out);
		x12: reg GENERIC MAP (N) PORT MAP (clk, enable(12), clearN, write_data, x12_out);
		x13: reg GENERIC MAP (N) PORT MAP (clk, enable(13), clearN, write_data, x13_out);
		x14: reg GENERIC MAP (N) PORT MAP (clk, enable(14), clearN, write_data, x14_out);
		x15: reg GENERIC MAP (N) PORT MAP (clk, enable(15), clearN, write_data, x15_out);
		x16: reg GENERIC MAP (N) PORT MAP (clk, enable(16), clearN, write_data, x16_out);
		x17: reg GENERIC MAP (N) PORT MAP (clk, enable(17), clearN, write_data, x17_out);
		x18: reg GENERIC MAP (N) PORT MAP (clk, enable(18), clearN, write_data, x18_out);
		x19: reg GENERIC MAP (N) PORT MAP (clk, enable(19), clearN, write_data, x19_out);
		x20: reg GENERIC MAP (N) PORT MAP (clk, enable(20), clearN, write_data, x20_out);
		x21: reg GENERIC MAP (N) PORT MAP (clk, enable(21), clearN, write_data, x21_out);
		x22: reg GENERIC MAP (N) PORT MAP (clk, enable(22), clearN, write_data, x22_out);
		x23: reg GENERIC MAP (N) PORT MAP (clk, enable(23), clearN, write_data, x23_out);
		x24: reg GENERIC MAP (N) PORT MAP (clk, enable(24), clearN, write_data, x24_out);
		x25: reg GENERIC MAP (N) PORT MAP (clk, enable(25), clearN, write_data, x25_out);
		x26: reg GENERIC MAP (N) PORT MAP (clk, enable(26), clearN, write_data, x26_out);
		x27: reg GENERIC MAP (N) PORT MAP (clk, enable(27), clearN, write_data, x27_out);
		x28: reg GENERIC MAP (N) PORT MAP (clk, enable(28), clearN, write_data, x28_out);
		x29: reg GENERIC MAP (N) PORT MAP (clk, enable(29), clearN, write_data, x29_out);
		x30: reg GENERIC MAP (N) PORT MAP (clk, enable(30), clearN, write_data, x30_out);
		x31: reg GENERIC MAP (N) PORT MAP (clk, enable(31), clearN, write_data, x31_out);

		Mux1: mux32to1 GENERIC MAP (N) PORT MAP	(read_addr1, x0_out, x1_out, x2_out, x3_out, x4_out, x5_out, x6_out, x7_out,
								x8_out, x9_out, x10_out, x11_out, x12_out, x13_out, x14_out, x15_out,
								x16_out, x17_out, x18_out, x19_out, x20_out, x21_out, x22_out, x23_out,
								x24_out, x25_out, x26_out, x27_out, x28_out, x29_out, x30_out, x31_out, m1_out);
		Mux2: mux32to1 GENERIC MAP (N) PORT MAP	(read_addr2, x0_out, x1_out, x2_out, x3_out, x4_out, x5_out, x6_out, x7_out,
								x8_out, x9_out, x10_out, x11_out, x12_out, x13_out, x14_out, x15_out,
								x16_out, x17_out, x18_out, x19_out, x20_out, x21_out, x22_out, x23_out,
								x24_out, x25_out, x26_out, x27_out, x28_out, x29_out, x30_out, x31_out, m2_out);

		pipe1: reg GENERIC MAP (N) PORT MAP (clk, '1', clearN, m1_out, p1_out);
		pipe2: reg GENERIC MAP (N) PORT MAP (clk, '1', clearN, m2_out, p2_out);

		read_out1 <= p1_out;
		read_out2 <= p2_out;

END behaviour;
