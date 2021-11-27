LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-- DADDA TREE - STAGE 1 ----------------------------------------------------------------------------
ENTITY 	dadda_stage1 	IS
PORT	(col0_IN:		IN   STD_LOGIC_VECTOR (1 DOWNTO 0);
      	col1_IN:		IN   STD_LOGIC_VECTOR (0 DOWNTO 0);
		col2_IN:		IN   STD_LOGIC_VECTOR (2 DOWNTO 0);
		col3_IN:		IN   STD_LOGIC_VECTOR (1 DOWNTO 0);
		col4_IN:		IN   STD_LOGIC_VECTOR (3 DOWNTO 0);
		col5_IN:		IN   STD_LOGIC_VECTOR (2 DOWNTO 0);
		col6_IN:		IN   STD_LOGIC_VECTOR (4 DOWNTO 0);
		col7_IN:		IN   STD_LOGIC_VECTOR (3 DOWNTO 0);
		col8_IN:		IN   STD_LOGIC_VECTOR (5 DOWNTO 0);
		col9_IN:		IN   STD_LOGIC_VECTOR (4 DOWNTO 0);
		col10_IN:		IN   STD_LOGIC_VECTOR (6 DOWNTO 0);
		col11_IN:		IN   STD_LOGIC_VECTOR (5 DOWNTO 0);
		col12_IN:		IN   STD_LOGIC_VECTOR (7 DOWNTO 0);
		col13_IN:		IN   STD_LOGIC_VECTOR (6 DOWNTO 0);
		col14_IN:		IN   STD_LOGIC_VECTOR (8 DOWNTO 0);
		col15_IN:		IN   STD_LOGIC_VECTOR (7 DOWNTO 0);
		col16_IN:		IN   STD_LOGIC_VECTOR (9 DOWNTO 0);
		col17_IN:		IN   STD_LOGIC_VECTOR (8 DOWNTO 0);
		col18_IN:		IN   STD_LOGIC_VECTOR (10 DOWNTO 0);
		col19_IN:		IN   STD_LOGIC_VECTOR (9 DOWNTO 0);
		col20_IN:		IN   STD_LOGIC_VECTOR (11 DOWNTO 0);
		col21_IN:		IN   STD_LOGIC_VECTOR (10 DOWNTO 0);
		col22_IN:		IN   STD_LOGIC_VECTOR (12 DOWNTO 0);
		col23_IN:		IN   STD_LOGIC_VECTOR (11 DOWNTO 0);
		col24_IN:		IN   STD_LOGIC_VECTOR (13 DOWNTO 0);
		col25_IN:		IN   STD_LOGIC_VECTOR (12 DOWNTO 0);
		col26_IN:		IN   STD_LOGIC_VECTOR (14 DOWNTO 0);
		col27_IN:		IN   STD_LOGIC_VECTOR (13 DOWNTO 0);
		col28_IN:		IN   STD_LOGIC_VECTOR (15 DOWNTO 0);
		col29_IN:		IN   STD_LOGIC_VECTOR (14 DOWNTO 0);
		col30_IN:		IN   STD_LOGIC_VECTOR (16 DOWNTO 0);
		col31_IN:		IN   STD_LOGIC_VECTOR (15 DOWNTO 0);
		col32_IN:		IN   STD_LOGIC_VECTOR (16 DOWNTO 0);
		col33_IN:		IN   STD_LOGIC_VECTOR (16 DOWNTO 0);
		col34_IN:		IN   STD_LOGIC_VECTOR (16 DOWNTO 0);
		col35_IN:		IN   STD_LOGIC_VECTOR (16 DOWNTO 0);
		col36_IN:		IN   STD_LOGIC_VECTOR (15 DOWNTO 0);
		col37_IN:		IN   STD_LOGIC_VECTOR (14 DOWNTO 0);
		col38_IN:		IN   STD_LOGIC_VECTOR (14 DOWNTO 0);
		col39_IN:		IN   STD_LOGIC_VECTOR (13 DOWNTO 0);
		col40_IN:		IN   STD_LOGIC_VECTOR (13 DOWNTO 0);
		col41_IN:		IN   STD_LOGIC_VECTOR (12 DOWNTO 0);
		col42_IN:		IN   STD_LOGIC_VECTOR (12 DOWNTO 0);
		col43_IN:		IN   STD_LOGIC_VECTOR (11 DOWNTO 0);
		col44_IN:		IN   STD_LOGIC_VECTOR (11 DOWNTO 0);
		col45_IN:		IN   STD_LOGIC_VECTOR (10 DOWNTO 0);
		col46_IN:		IN   STD_LOGIC_VECTOR (10 DOWNTO 0);
		col47_IN:		IN   STD_LOGIC_VECTOR (9 DOWNTO 0);
		col48_IN:		IN   STD_LOGIC_VECTOR (9 DOWNTO 0);
		col49_IN:		IN   STD_LOGIC_VECTOR (8 DOWNTO 0);
		col50_IN:		IN   STD_LOGIC_VECTOR (8 DOWNTO 0);
		col51_IN:		IN   STD_LOGIC_VECTOR (7 DOWNTO 0);
		col52_IN:		IN   STD_LOGIC_VECTOR (7 DOWNTO 0);
		col53_IN:		IN   STD_LOGIC_VECTOR (6 DOWNTO 0);
		col54_IN:		IN   STD_LOGIC_VECTOR (6 DOWNTO 0);
		col55_IN:		IN   STD_LOGIC_VECTOR (5 DOWNTO 0);
		col56_IN:		IN   STD_LOGIC_VECTOR (5 DOWNTO 0);
		col57_IN:		IN   STD_LOGIC_VECTOR (4 DOWNTO 0);
		col58_IN:		IN   STD_LOGIC_VECTOR (4 DOWNTO 0);
		col59_IN:		IN   STD_LOGIC_VECTOR (3 DOWNTO 0);
		col60_IN:		IN   STD_LOGIC_VECTOR (3 DOWNTO 0);
		col61_IN:		IN   STD_LOGIC_VECTOR (2 DOWNTO 0);
		col62_IN:		IN   STD_LOGIC_VECTOR (2 DOWNTO 0);
		col63_IN:		IN   STD_LOGIC_VECTOR (1 DOWNTO 0);
		col64_IN:		IN   STD_LOGIC_VECTOR (0 DOWNTO 0);
		col0_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col1_OUT:		OUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		col2_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col3_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col4_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col5_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col6_OUT:		OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		col7_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col8_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col9_OUT:		OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		col10_OUT:		OUT  STD_LOGIC_VECTOR (6 DOWNTO 0);
		col11_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col12_OUT:		OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		col13_OUT:		OUT  STD_LOGIC_VECTOR (6 DOWNTO 0);
		col14_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col15_OUT:		OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		col16_OUT:		OUT  STD_LOGIC_VECTOR (9 DOWNTO 0);
		col17_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col18_OUT:		OUT  STD_LOGIC_VECTOR (10 DOWNTO 0);
		col19_OUT:		OUT  STD_LOGIC_VECTOR (9 DOWNTO 0);
		col20_OUT:		OUT  STD_LOGIC_VECTOR (11 DOWNTO 0);
		col21_OUT:		OUT  STD_LOGIC_VECTOR (10 DOWNTO 0);
		col22_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col23_OUT:		OUT  STD_LOGIC_VECTOR (11 DOWNTO 0);
		col24_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col25_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col26_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col27_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col28_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col29_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col30_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col31_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col32_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col33_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col34_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col35_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col36_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col37_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col38_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col39_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col40_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col41_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col42_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col43_OUT:		OUT  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col44_OUT:		OUT  STD_LOGIC_VECTOR (11 DOWNTO 0);
		col45_OUT:		OUT  STD_LOGIC_VECTOR (10 DOWNTO 0);
		col46_OUT:		OUT  STD_LOGIC_VECTOR (10 DOWNTO 0);
		col47_OUT:		OUT  STD_LOGIC_VECTOR (9 DOWNTO 0);
		col48_OUT:		OUT  STD_LOGIC_VECTOR (9 DOWNTO 0);
		col49_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col50_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col51_OUT:		OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		col52_OUT:		OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		col53_OUT:		OUT  STD_LOGIC_VECTOR (6 DOWNTO 0);
		col54_OUT:		OUT  STD_LOGIC_VECTOR (6 DOWNTO 0);
		col55_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col56_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col57_OUT:		OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		col58_OUT:		OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		col59_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col60_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col61_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col62_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col63_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col64_OUT:		OUT  STD_LOGIC_VECTOR (0 DOWNTO 0));
END 	dadda_stage1 ;


-- ARCHITECTURE ------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF dadda_stage1 IS

	-- HALF ADDER ----------------------------------------------------------------------------------
	COMPONENT 	HA
	PORT		(a:		IN	STD_LOGIC;
		  		b:		IN	STD_LOGIC;
		  		sum:	OUT	STD_LOGIC;
		  		c:		OUT	STD_LOGIC);
	END 		COMPONENT;

	-- FULL ADDER ----------------------------------------------------------------------------------
	COMPONENT 	FA
	PORT		(a:		IN	STD_LOGIC;
		  		b:		IN	STD_LOGIC;
				cin:	IN	STD_LOGIC;
		  		sum:	OUT	STD_LOGIC;
		  		cout:	OUT	STD_LOGIC);
	END 		COMPONENT;


	BEGIN

		-- DATAPATH --------------------------------------------------------------------------------
		-- cols from 0 to 23
		col0_OUT <= col0_IN;
		col1_OUT <= col1_IN;
		col2_OUT <= col2_IN;
		col3_OUT <= col3_IN;
		col4_OUT <= col4_IN;
		col5_OUT <= col5_IN;
		col6_OUT <= col6_IN;
		col7_OUT <= col7_IN;
		col8_OUT <= col8_IN;
		col9_OUT <= col9_IN;
		col10_OUT <= col10_IN;
		col11_OUT <= col11_IN;
		col12_OUT <= col12_IN;
		col13_OUT <= col13_IN;
		col14_OUT <= col14_IN;
		col15_OUT <= col15_IN;
		col16_OUT <= col16_IN;
		col17_OUT <= col17_IN;
		col18_OUT <= col18_IN;
		col19_OUT <= col19_IN;
		col20_OUT <= col20_IN;
		col21_OUT <= col21_IN;
		col22_OUT <= col22_IN;
		col23_OUT <= col23_IN;
		-- col 24
		col24_OUT(12 DOWNTO 1) <= col24_IN(13 DOWNTO 2);
		HA24: HA PORT MAP (col24_IN(0), col24_IN(1), col24_OUT(0), col25_OUT(0));
		-- col 25
		col25_OUT(12 DOWNTO 2) <= col25_IN(12 DOWNTO 2);
		HA25: HA PORT MAP (col25_IN(0), col25_IN(1), col25_OUT(1), col26_OUT(0));
		-- col 26
		col26_OUT(12 DOWNTO 3) <= col26_IN(14 DOWNTO 5);
		FA26: FA PORT MAP (col26_IN(0), col26_IN(1), col26_IN(2), col26_OUT(1), col27_OUT(0));
		HA26: HA PORT MAP (col26_IN(3), col26_IN(4), col26_OUT(2), col27_OUT(1));
		-- col 27
		col27_OUT(12 DOWNTO 4) <= col27_IN(13 DOWNTO 5);
		FA27: FA PORT MAP (col27_IN(0), col27_IN(1), col27_IN(2), col27_OUT(2), col28_OUT(0));
		HA27: HA PORT MAP (col27_IN(3), col27_IN(4), col27_OUT(3), col28_OUT(1));
		-- col 28
		col28_OUT(12 DOWNTO 5) <= col28_IN(15 DOWNTO 8);
		FA28_1: FA PORT MAP (col28_IN(0), col28_IN(1), col28_IN(2), col28_OUT(2), col29_OUT(0));
		FA28_2: FA PORT MAP (col28_IN(3), col28_IN(4), col28_IN(5), col28_OUT(3), col29_OUT(1));
		HA28: HA PORT MAP (col28_IN(6), col28_IN(7), col28_OUT(4), col29_OUT(2));
		-- col 29
		col29_OUT(12 DOWNTO 6) <= col29_IN(14 DOWNTO 8);
		FA29_1: FA PORT MAP (col29_IN(0), col29_IN(1), col29_IN(2), col29_OUT(3), col30_OUT(0));
		FA29_2: FA PORT MAP (col29_IN(3), col29_IN(4), col29_IN(5), col29_OUT(4), col30_OUT(1));
		HA29: HA PORT MAP (col29_IN(6), col29_IN(7), col29_OUT(5), col30_OUT(2));
		-- col 30
		col30_OUT(12 DOWNTO 7) <= col30_IN(16 DOWNTO 11);
		FA30_1: FA PORT MAP (col30_IN(0), col30_IN(1), col30_IN(2), col30_OUT(3), col31_OUT(0));
		FA30_2: FA PORT MAP (col30_IN(3), col30_IN(4), col30_IN(5), col30_OUT(4), col31_OUT(1));
		FA30_3: FA PORT MAP (col30_IN(6), col30_IN(7), col30_IN(8), col30_OUT(5), col31_OUT(2));
		HA30: HA PORT MAP (col30_IN(9), col30_IN(10), col30_OUT(6), col31_OUT(3));
		-- col 31
		col31_OUT(12 DOWNTO 8) <= col31_IN(15 DOWNTO 11);
		FA31_1: FA PORT MAP (col31_IN(0), col31_IN(1), col31_IN(2), col31_OUT(4), col32_OUT(0));
		FA31_2: FA PORT MAP (col31_IN(3), col31_IN(4), col31_IN(5), col31_OUT(5), col32_OUT(1));
		FA31_3: FA PORT MAP (col31_IN(6), col31_IN(7), col31_IN(8), col31_OUT(6), col32_OUT(2));
		HA31: HA PORT MAP (col31_IN(9), col31_IN(10), col31_OUT(7), col32_OUT(3));

		-- col 32
		col32_OUT(12 DOWNTO 8) <= col32_IN(16 DOWNTO 12);
		FA32_1: FA PORT MAP (col32_IN(0), col32_IN(1), col32_IN(2), col32_OUT(4), col33_OUT(0));
		FA32_2: FA PORT MAP (col32_IN(3), col32_IN(4), col32_IN(5), col32_OUT(5), col33_OUT(1));
		FA32_3: FA PORT MAP (col32_IN(6), col32_IN(7), col32_IN(8), col32_OUT(6), col33_OUT(2));
		FA32_4: FA PORT MAP (col32_IN(9), col32_IN(10), col32_IN(11), col32_OUT(7), col33_OUT(3));
		-- col 33
		col33_OUT(12 DOWNTO 8) <= col33_IN(16 DOWNTO 12);
		FA33_1: FA PORT MAP (col33_IN(0), col33_IN(1), col33_IN(2), col33_OUT(4), col34_OUT(0));
		FA33_2: FA PORT MAP (col33_IN(3), col33_IN(4), col33_IN(5), col33_OUT(5), col34_OUT(1));
		FA33_3: FA PORT MAP (col33_IN(6), col33_IN(7), col33_IN(8), col33_OUT(6), col34_OUT(2));
		FA33_4: FA PORT MAP (col33_IN(9), col33_IN(10), col33_IN(11), col33_OUT(7), col34_OUT(3));
		-- col 34
		col34_OUT(12 DOWNTO 8) <= col34_IN(16 DOWNTO 12);
		FA34_1: FA PORT MAP (col34_IN(0), col34_IN(1), col34_IN(2), col34_OUT(4), col35_OUT(0));
		FA34_2: FA PORT MAP (col34_IN(3), col34_IN(4), col34_IN(5), col34_OUT(5), col35_OUT(1));
		FA34_3: FA PORT MAP (col34_IN(6), col34_IN(7), col34_IN(8), col34_OUT(6), col35_OUT(2));
		FA34_4: FA PORT MAP (col34_IN(9), col34_IN(10), col34_IN(11), col34_OUT(7), col35_OUT(3));
		-- col 35
		col35_OUT(12 DOWNTO 8) <= col35_IN(16 DOWNTO 12);
		FA35_1: FA PORT MAP (col35_IN(0), col35_IN(1), col35_IN(2), col35_OUT(4), col36_OUT(0));
		FA35_2: FA PORT MAP (col35_IN(3), col35_IN(4), col35_IN(5), col35_OUT(5), col36_OUT(1));
		FA35_3: FA PORT MAP (col35_IN(6), col35_IN(7), col35_IN(8), col35_OUT(6), col36_OUT(2));
		FA35_4: FA PORT MAP (col35_IN(9), col35_IN(10), col35_IN(11), col35_OUT(7), col36_OUT(3));

		-- col 36
        col36_OUT(12 DOWNTO 8) <= col36_IN(15 DOWNTO 11);
		FA36_1: FA PORT MAP (col36_IN(0), col36_IN(1), col36_IN(2), col36_OUT(4), col37_OUT(0));
		FA36_2: FA PORT MAP (col36_IN(3), col36_IN(4), col36_IN(5), col36_OUT(5), col37_OUT(1));
		FA36_3: FA PORT MAP (col36_IN(6), col36_IN(7), col36_IN(8), col36_OUT(6), col37_OUT(2));
		HA36: HA PORT MAP (col36_IN(9), col36_IN(10), col36_OUT(7), col37_OUT(3));
		-- col 37
		col37_OUT(12 DOWNTO 7) <= col37_IN(14 DOWNTO 9);
		FA37_1: FA PORT MAP (col37_IN(0), col37_IN(1), col37_IN(2), col37_OUT(4), col38_OUT(0));
		FA37_2: FA PORT MAP (col37_IN(3), col37_IN(4), col37_IN(5), col37_OUT(5), col38_OUT(1));
		FA37_3: FA PORT MAP (col37_IN(6), col37_IN(7), col37_IN(8), col37_OUT(6), col38_OUT(2));
		-- col 38
		col38_OUT(12 DOWNTO 6) <= col38_IN(14 DOWNTO 8);
		FA38_1: FA PORT MAP (col38_IN(0), col38_IN(1), col38_IN(2), col38_OUT(3), col39_OUT(0));
		FA38_2: FA PORT MAP (col38_IN(3), col38_IN(4), col38_IN(5), col38_OUT(4), col39_OUT(1));
		HA38: HA PORT MAP (col38_IN(6), col38_IN(7), col38_OUT(5), col39_OUT(2));
		-- col 39
		col39_OUT(12 DOWNTO 5) <= col39_IN(13 DOWNTO 6);
		FA39_1: FA PORT MAP (col39_IN(0), col39_IN(1), col39_IN(2), col39_OUT(3), col40_OUT(0));
		FA39_2: FA PORT MAP (col39_IN(3), col39_IN(4), col39_IN(5), col39_OUT(4), col40_OUT(1));
		-- col 40
		col40_OUT(12 DOWNTO 4) <= col40_IN(13 DOWNTO 5);
		FA40: FA PORT MAP (col40_IN(0), col40_IN(1), col40_IN(2), col40_OUT(2), col41_OUT(0));
		HA40: HA PORT MAP (col40_IN(3), col40_IN(4), col40_OUT(3), col41_OUT(1));
		-- col 41
		col41_OUT(12 DOWNTO 3) <= col41_IN(12 DOWNTO 3);
		FA41: FA PORT MAP (col41_IN(0), col41_IN(1), col41_IN(2), col41_OUT(2), col42_OUT(0));
		-- col 42
		col42_OUT(12 DOWNTO 2) <= col42_IN(12 DOWNTO 2);
		HA42: HA PORT MAP (col42_IN(0), col42_IN(1), col42_OUT(1), col43_OUT(0));
		-- col 43
		col43_OUT(12 DOWNTO 1) <= col43_IN(11 DOWNTO 0);
		-- cols from 44 to 64
		col44_OUT <= col44_IN;
		col45_OUT <= col45_IN;
		col46_OUT <= col46_IN;
		col47_OUT <= col47_IN;
		col48_OUT <= col48_IN;
		col49_OUT <= col49_IN;
		col50_OUT <= col50_IN;
		col51_OUT <= col51_IN;
		col52_OUT <= col52_IN;
		col53_OUT <= col53_IN;
		col54_OUT <= col54_IN;
		col55_OUT <= col55_IN;
		col56_OUT <= col56_IN;
		col57_OUT <= col57_IN;
		col58_OUT <= col58_IN;
		col59_OUT <= col59_IN;
		col60_OUT <= col60_IN;
		col61_OUT <= col61_IN;
		col62_OUT <= col62_IN;
		col63_OUT <= col63_IN;
		col64_OUT <= col64_IN;

END behaviour;
