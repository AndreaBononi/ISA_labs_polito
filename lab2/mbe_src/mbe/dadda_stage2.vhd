LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-- DADDA TREE - STAGE 2 ----------------------------------------------------------------------------
ENTITY 	dadda_stage2 	IS
PORT	(col0_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col1_IN:		IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
		col2_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col3_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col4_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col5_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col6_IN:		IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		col7_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col8_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col9_IN:		IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		col10_IN:		IN  STD_LOGIC_VECTOR (6 DOWNTO 0);
		col11_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col12_IN:		IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		col13_IN:		IN  STD_LOGIC_VECTOR (6 DOWNTO 0);
		col14_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col15_IN:		IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		col16_IN:		IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
		col17_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col18_IN:		IN  STD_LOGIC_VECTOR (10 DOWNTO 0);
		col19_IN:		IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
		col20_IN:		IN  STD_LOGIC_VECTOR (11 DOWNTO 0);
		col21_IN:		IN  STD_LOGIC_VECTOR (10 DOWNTO 0);
		col22_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col23_IN:		IN  STD_LOGIC_VECTOR (11 DOWNTO 0);
		col24_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col25_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col26_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col27_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col28_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col29_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col30_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col31_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col32_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col33_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col34_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col35_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col36_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col37_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col38_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col39_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col40_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col41_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col42_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col43_IN:		IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
		col44_IN:		IN  STD_LOGIC_VECTOR (11 DOWNTO 0);
		col45_IN:		IN  STD_LOGIC_VECTOR (10 DOWNTO 0);
		col46_IN:		IN  STD_LOGIC_VECTOR (10 DOWNTO 0);
		col47_IN:		IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
		col48_IN:		IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
		col49_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col50_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col51_IN:		IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		col52_IN:		IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		col53_IN:		IN  STD_LOGIC_VECTOR (6 DOWNTO 0);
		col54_IN:		IN  STD_LOGIC_VECTOR (6 DOWNTO 0);
		col55_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col56_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col57_IN:		IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		col58_IN:		IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		col59_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col60_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col61_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col62_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col63_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col64_IN:		IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
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
		col16_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col17_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col18_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col19_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col20_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col21_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col22_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col23_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col24_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col25_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col26_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col27_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col28_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col29_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col30_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col31_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col32_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col33_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col34_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col35_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col36_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col37_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col38_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col39_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col40_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col41_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col42_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col43_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col44_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col45_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col46_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col47_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col48_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col49_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col50_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
		col51_OUT:		OUT  STD_LOGIC_VECTOR (8 DOWNTO 0);
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
END 	dadda_stage2 ;


-- ARCHITECTURE ------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF dadda_stage2 IS

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
		-- cols from 0 to 15
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
		-- col 16
		col16_OUT(8 DOWNTO 1) <= col16_IN(9 DOWNTO 2);
		HA16: HA PORT MAP (col16_IN(0), col16_IN(1), col16_OUT(0), col17_OUT(0));
		-- col 17
		col17_OUT(8 DOWNTO 2) <= col17_IN(8 DOWNTO 2);
		HA17: HA PORT MAP (col17_IN(0), col17_IN(1), col17_OUT(1), col18_OUT(0));
		-- col 18
		col18_OUT(8 DOWNTO 3) <= col18_IN(10 DOWNTO 5);
		FA18: FA PORT MAP (col18_IN(0), col18_IN(1), col18_IN(2), col18_OUT(1), col19_OUT(0));
		HA18: HA PORT MAP (col18_IN(3), col18_IN(4), col18_OUT(2), col19_OUT(1));
		-- col 19
		col19_OUT(8 DOWNTO 4) <= col19_IN(9 DOWNTO 5);
		FA19: FA PORT MAP (col19_IN(0), col19_IN(1), col19_IN(2), col19_OUT(2), col20_OUT(0));
		HA19: HA PORT MAP (col19_IN(3), col19_IN(4), col19_OUT(3), col20_OUT(1));
		-- col 20
		col20_OUT(8 DOWNTO 5) <= col20_IN(11 DOWNTO 8);
		FA20_1: FA PORT MAP (col20_IN(0), col20_IN(1), col20_IN(2), col20_OUT(2), col21_OUT(0));
		FA20_2: FA PORT MAP (col20_IN(3), col20_IN(4), col20_IN(5), col20_OUT(3), col21_OUT(1));
		HA20: HA PORT MAP (col20_IN(6), col20_IN(7), col20_OUT(4), col21_OUT(2));
		-- col 21
		col21_OUT(8 DOWNTO 6) <= col21_IN(10 DOWNTO 8);
		FA21_1: FA PORT MAP (col21_IN(0), col21_IN(1), col21_IN(2), col21_OUT(3), col22_OUT(0));
		FA21_2: FA PORT MAP (col21_IN(3), col21_IN(4), col21_IN(5), col21_OUT(4), col22_OUT(1));
		HA21: HA PORT MAP (col21_IN(6), col21_IN(7), col21_OUT(5), col22_OUT(2));
		-- col 22
		col22_OUT(8 DOWNTO 7) <= col22_IN(12 DOWNTO 11);
		FA22_1: FA PORT MAP (col22_IN(0), col22_IN(1), col22_IN(2), col22_OUT(3), col23_OUT(0));
		FA22_2: FA PORT MAP (col22_IN(3), col22_IN(4), col22_IN(5), col22_OUT(4), col23_OUT(1));
		FA22_3: FA PORT MAP (col22_IN(6), col22_IN(7), col22_IN(8), col22_OUT(5), col23_OUT(2));
		HA22: HA PORT MAP (col22_IN(9), col22_IN(10), col22_OUT(6), col23_OUT(3));
		-- col 23
		col23_OUT(8) <= col23_IN(11);
		FA23_1: FA PORT MAP (col23_IN(0), col23_IN(1), col23_IN(2), col23_OUT(4), col24_OUT(0));
		FA23_2: FA PORT MAP (col23_IN(3), col23_IN(4), col23_IN(5), col23_OUT(5), col24_OUT(1));
		FA23_3: FA PORT MAP (col23_IN(6), col23_IN(7), col23_IN(8), col23_OUT(6), col24_OUT(2));
		HA23: HA PORT MAP (col23_IN(9), col23_IN(10), col23_OUT(7), col24_OUT(3));

		-- col 24
		col24_OUT(8) <= col24_IN(12);
		FA24_1: FA PORT MAP (col24_IN(0), col24_IN(1), col24_IN(2), col24_OUT(4), col25_OUT(0));
		FA24_2: FA PORT MAP (col24_IN(3), col24_IN(4), col24_IN(5), col24_OUT(5), col25_OUT(1));
		FA24_3: FA PORT MAP (col24_IN(6), col24_IN(7), col24_IN(8), col24_OUT(6), col25_OUT(2));
		FA24_4: FA PORT MAP (col24_IN(9), col24_IN(10), col24_IN(11), col24_OUT(7), col25_OUT(3));
		-- col 25
		col25_OUT(8) <= col25_IN(12);
		FA25_1: FA PORT MAP (col25_IN(0), col25_IN(1), col25_IN(2), col25_OUT(4), col26_OUT(0));
		FA25_2: FA PORT MAP (col25_IN(3), col25_IN(4), col25_IN(5), col25_OUT(5), col26_OUT(1));
		FA25_3: FA PORT MAP (col25_IN(6), col25_IN(7), col25_IN(8), col25_OUT(6), col26_OUT(2));
		FA25_4: FA PORT MAP (col25_IN(9), col25_IN(10), col25_IN(11), col25_OUT(7), col26_OUT(3));
		-- col 26
		col26_OUT(8) <= col26_IN(12);
		FA26_1: FA PORT MAP (col26_IN(0), col26_IN(1), col26_IN(2), col26_OUT(4), col27_OUT(0));
		FA26_2: FA PORT MAP (col26_IN(3), col26_IN(4), col26_IN(5), col26_OUT(5), col27_OUT(1));
		FA26_3: FA PORT MAP (col26_IN(6), col26_IN(7), col26_IN(8), col26_OUT(6), col27_OUT(2));
		FA26_4: FA PORT MAP (col26_IN(9), col26_IN(10), col26_IN(11), col26_OUT(7), col27_OUT(3));
		-- col 27
		col27_OUT(8) <= col27_IN(12);
		FA27_1: FA PORT MAP (col27_IN(0), col27_IN(1), col27_IN(2), col27_OUT(4), col28_OUT(0));
		FA27_2: FA PORT MAP (col27_IN(3), col27_IN(4), col27_IN(5), col27_OUT(5), col28_OUT(1));
		FA27_3: FA PORT MAP (col27_IN(6), col27_IN(7), col27_IN(8), col27_OUT(6), col28_OUT(2));
		FA27_4: FA PORT MAP (col27_IN(9), col27_IN(10), col27_IN(11), col27_OUT(7), col28_OUT(3));
		-- col 28
		col28_OUT(8) <= col28_IN(12);
		FA28_1: FA PORT MAP (col28_IN(0), col28_IN(1), col28_IN(2), col28_OUT(4), col29_OUT(0));
		FA28_2: FA PORT MAP (col28_IN(3), col28_IN(4), col28_IN(5), col28_OUT(5), col29_OUT(1));
		FA28_3: FA PORT MAP (col28_IN(6), col28_IN(7), col28_IN(8), col28_OUT(6), col29_OUT(2));
		FA28_4: FA PORT MAP (col28_IN(9), col28_IN(10), col28_IN(11), col28_OUT(7), col29_OUT(3));
		-- col 29
		col29_OUT(8) <= col29_IN(12);
		FA29_1: FA PORT MAP (col29_IN(0), col29_IN(1), col29_IN(2), col29_OUT(4), col30_OUT(0));
		FA29_2: FA PORT MAP (col29_IN(3), col29_IN(4), col29_IN(5), col29_OUT(5), col30_OUT(1));
		FA29_3: FA PORT MAP (col29_IN(6), col29_IN(7), col29_IN(8), col29_OUT(6), col30_OUT(2));
		FA29_4: FA PORT MAP (col29_IN(9), col29_IN(10), col29_IN(11), col29_OUT(7), col30_OUT(3));
		-- col30
		col30_OUT(8) <= col30_IN(12);
		FA30_1: FA PORT MAP (col30_IN(0), col30_IN(1), col30_IN(2), col30_OUT(4), col31_OUT(0));
		FA30_2: FA PORT MAP (col30_IN(3), col30_IN(4), col30_IN(5), col30_OUT(5), col31_OUT(1));
		FA30_3: FA PORT MAP (col30_IN(6), col30_IN(7), col30_IN(8), col30_OUT(6), col31_OUT(2));
		FA30_4: FA PORT MAP (col30_IN(9), col30_IN(10), col30_IN(11), col30_OUT(7), col31_OUT(3));
		-- col31
		col31_OUT(8) <= col31_IN(12);
		FA31_1: FA PORT MAP (col31_IN(0), col31_IN(1), col31_IN(2), col31_OUT(4), col32_OUT(0));
		FA31_2: FA PORT MAP (col31_IN(3), col31_IN(4), col31_IN(5), col31_OUT(5), col32_OUT(1));
		FA31_3: FA PORT MAP (col31_IN(6), col31_IN(7), col31_IN(8), col31_OUT(6), col32_OUT(2));
		FA31_4: FA PORT MAP (col31_IN(9), col31_IN(10), col31_IN(11), col31_OUT(7), col32_OUT(3));
		-- col32
		col32_OUT(8) <= col32_IN(12);
		FA32_1: FA PORT MAP (col32_IN(0), col32_IN(1), col32_IN(2), col32_OUT(4), col33_OUT(0));
		FA32_2: FA PORT MAP (col32_IN(3), col32_IN(4), col32_IN(5), col32_OUT(5), col33_OUT(1));
		FA32_3: FA PORT MAP (col32_IN(6), col32_IN(7), col32_IN(8), col32_OUT(6), col33_OUT(2));
		FA32_4: FA PORT MAP (col32_IN(9), col32_IN(10), col32_IN(11), col32_OUT(7), col33_OUT(3));
		-- col33
		col33_OUT(8) <= col33_IN(12);
		FA33_1: FA PORT MAP (col33_IN(0), col33_IN(1), col33_IN(2), col33_OUT(4), col34_OUT(0));
		FA33_2: FA PORT MAP (col33_IN(3), col33_IN(4), col33_IN(5), col33_OUT(5), col34_OUT(1));
		FA33_3: FA PORT MAP (col33_IN(6), col33_IN(7), col33_IN(8), col33_OUT(6), col34_OUT(2));
		FA33_4: FA PORT MAP (col33_IN(9), col33_IN(10), col33_IN(11), col33_OUT(7), col34_OUT(3));
		-- col34
		col34_OUT(8) <= col34_IN(12);
		FA34_1: FA PORT MAP (col34_IN(0), col34_IN(1), col34_IN(2), col34_OUT(4), col35_OUT(0));
		FA34_2: FA PORT MAP (col34_IN(3), col34_IN(4), col34_IN(5), col34_OUT(5), col35_OUT(1));
		FA34_3: FA PORT MAP (col34_IN(6), col34_IN(7), col34_IN(8), col34_OUT(6), col35_OUT(2));
		FA34_4: FA PORT MAP (col34_IN(9), col34_IN(10), col34_IN(11), col34_OUT(7), col35_OUT(3));
		-- col35
		col35_OUT(8) <= col35_IN(12);
		FA35_1: FA PORT MAP (col35_IN(0), col35_IN(1), col35_IN(2), col35_OUT(4), col36_OUT(0));
		FA35_2: FA PORT MAP (col35_IN(3), col35_IN(4), col35_IN(5), col35_OUT(5), col36_OUT(1));
		FA35_3: FA PORT MAP (col35_IN(6), col35_IN(7), col35_IN(8), col35_OUT(6), col36_OUT(2));
		FA35_4: FA PORT MAP (col35_IN(9), col35_IN(10), col35_IN(11), col35_OUT(7), col36_OUT(3));
		-- col36
		col36_OUT(8) <= col36_IN(12);
		FA36_1: FA PORT MAP (col36_IN(0), col36_IN(1), col36_IN(2), col36_OUT(4), col37_OUT(0));
		FA36_2: FA PORT MAP (col36_IN(3), col36_IN(4), col36_IN(5), col36_OUT(5), col37_OUT(1));
		FA36_3: FA PORT MAP (col36_IN(6), col36_IN(7), col36_IN(8), col36_OUT(6), col37_OUT(2));
		FA36_4: FA PORT MAP (col36_IN(9), col36_IN(10), col36_IN(11), col36_OUT(7), col37_OUT(3));
		-- col37
		col37_OUT(8) <= col37_IN(12);
		FA37_1: FA PORT MAP (col37_IN(0), col37_IN(1), col37_IN(2), col37_OUT(4), col38_OUT(0));
		FA37_2: FA PORT MAP (col37_IN(3), col37_IN(4), col37_IN(5), col37_OUT(5), col38_OUT(1));
		FA37_3: FA PORT MAP (col37_IN(6), col37_IN(7), col37_IN(8), col37_OUT(6), col38_OUT(2));
		FA37_4: FA PORT MAP (col37_IN(9), col37_IN(10), col37_IN(11), col37_OUT(7), col38_OUT(3));
		-- col38
		col38_OUT(8) <= col38_IN(12);
		FA38_1: FA PORT MAP (col38_IN(0), col38_IN(1), col38_IN(2), col38_OUT(4), col39_OUT(0));
		FA38_2: FA PORT MAP (col38_IN(3), col38_IN(4), col38_IN(5), col38_OUT(5), col39_OUT(1));
		FA38_3: FA PORT MAP (col38_IN(6), col38_IN(7), col38_IN(8), col38_OUT(6), col39_OUT(2));
		FA38_4: FA PORT MAP (col38_IN(9), col38_IN(10), col38_IN(11), col38_OUT(7), col39_OUT(3));
		-- col39
		col39_OUT(8) <= col39_IN(12);
		FA39_1: FA PORT MAP (col39_IN(0), col39_IN(1), col39_IN(2), col39_OUT(4), col40_OUT(0));
		FA39_2: FA PORT MAP (col39_IN(3), col39_IN(4), col39_IN(5), col39_OUT(5), col40_OUT(1));
		FA39_3: FA PORT MAP (col39_IN(6), col39_IN(7), col39_IN(8), col39_OUT(6), col40_OUT(2));
		FA39_4: FA PORT MAP (col39_IN(9), col39_IN(10), col39_IN(11), col39_OUT(7), col40_OUT(3));
		-- col40
		col40_OUT(8) <= col40_IN(12);
		FA40_1: FA PORT MAP (col40_IN(0), col40_IN(1), col40_IN(2), col40_OUT(4), col41_OUT(0));
		FA40_2: FA PORT MAP (col40_IN(3), col40_IN(4), col40_IN(5), col40_OUT(5), col41_OUT(1));
		FA40_3: FA PORT MAP (col40_IN(6), col40_IN(7), col40_IN(8), col40_OUT(6), col41_OUT(2));
		FA40_4: FA PORT MAP (col40_IN(9), col40_IN(10), col40_IN(11), col40_OUT(7), col41_OUT(3));
		-- col41
		col41_OUT(8) <= col41_IN(12);
		FA41_1: FA PORT MAP (col41_IN(0), col41_IN(1), col41_IN(2), col41_OUT(4), col42_OUT(0));
		FA41_2: FA PORT MAP (col41_IN(3), col41_IN(4), col41_IN(5), col41_OUT(5), col42_OUT(1));
		FA41_3: FA PORT MAP (col41_IN(6), col41_IN(7), col41_IN(8), col41_OUT(6), col42_OUT(2));
		FA41_4: FA PORT MAP (col41_IN(9), col41_IN(10), col41_IN(11), col41_OUT(7), col42_OUT(3));
		-- col42
		col42_OUT(8) <= col42_IN(12);
		FA42_1: FA PORT MAP (col42_IN(0), col42_IN(1), col42_IN(2), col42_OUT(4), col43_OUT(0));
		FA42_2: FA PORT MAP (col42_IN(3), col42_IN(4), col42_IN(5), col42_OUT(5), col43_OUT(1));
		FA42_3: FA PORT MAP (col42_IN(6), col42_IN(7), col42_IN(8), col42_OUT(6), col43_OUT(2));
		FA42_4: FA PORT MAP (col42_IN(9), col42_IN(10), col42_IN(11), col42_OUT(7), col43_OUT(3));
		-- col43
		col43_OUT(8) <= col43_IN(12);
		FA43_1: FA PORT MAP (col43_IN(0), col43_IN(1), col43_IN(2), col43_OUT(4), col44_OUT(0));
		FA43_2: FA PORT MAP (col43_IN(3), col43_IN(4), col43_IN(5), col43_OUT(5), col44_OUT(1));
		FA43_3: FA PORT MAP (col43_IN(6), col43_IN(7), col43_IN(8), col43_OUT(6), col44_OUT(2));
		FA43_4: FA PORT MAP (col43_IN(9), col43_IN(10), col43_IN(11), col43_OUT(7), col44_OUT(3));
		-- col 44
		col44_OUT(8) <= col44_IN(11);
		FA44_1: FA PORT MAP (col44_IN(0), col44_IN(1), col44_IN(2), col44_OUT(4), col45_OUT(0));
		FA44_2: FA PORT MAP (col44_IN(3), col44_IN(4), col44_IN(5), col44_OUT(5), col45_OUT(1));
		FA44_3: FA PORT MAP (col44_IN(6), col44_IN(7), col44_IN(8), col44_OUT(6), col45_OUT(2));
		HA44: HA PORT MAP (col44_IN(9), col44_IN(10), col44_OUT(7), col45_OUT(3));
		-- col 45
		col45_OUT(8 DOWNTO 7) <= col45_IN(10 DOWNTO 9);
		FA45_1: FA PORT MAP (col45_IN(0), col45_IN(1), col45_IN(2), col45_OUT(4), col46_OUT(0));
		FA45_2: FA PORT MAP (col45_IN(3), col45_IN(4), col45_IN(5), col45_OUT(5), col46_OUT(1));
		FA45_3: FA PORT MAP (col45_IN(6), col45_IN(7), col45_IN(8), col45_OUT(6), col46_OUT(2));
		-- col 46
		col46_OUT(8 DOWNTO 6) <= col46_IN(10 DOWNTO 8);
		FA46_1: FA PORT MAP (col46_IN(0), col46_IN(1), col46_IN(2), col46_OUT(3), col47_OUT(0));
		FA46_2: FA PORT MAP (col46_IN(3), col46_IN(4), col46_IN(5), col46_OUT(4), col47_OUT(1));
		HA46: HA PORT MAP (col46_IN(6), col46_IN(7), col46_OUT(5), col47_OUT(2));
		-- col 47
		col47_OUT(8 DOWNTO 5) <= col47_IN(9 DOWNTO 6);
		FA47_1: FA PORT MAP (col47_IN(0), col47_IN(1), col47_IN(2), col47_OUT(3), col48_OUT(0));
		FA47_2: FA PORT MAP (col47_IN(3), col47_IN(4), col47_IN(5), col47_OUT(4), col48_OUT(1));
		-- col 48
		col48_OUT(8 DOWNTO 4) <= col48_IN(9 DOWNTO 5);
		FA48: FA PORT MAP (col48_IN(0), col48_IN(1), col48_IN(2), col48_OUT(2), col49_OUT(0));
		HA48: HA PORT MAP (col48_IN(3), col48_IN(4), col48_OUT(3), col49_OUT(1));
		-- col 49
		col49_OUT(8 DOWNTO 3) <= col49_IN(8 DOWNTO 3);
		FA49: FA PORT MAP (col49_IN(0), col49_IN(1), col49_IN(2), col49_OUT(2), col50_OUT(0));
		-- col 50
		col50_OUT(8 DOWNTO 2) <= col50_IN(8 DOWNTO 2);
		HA50: HA PORT MAP (col50_IN(0), col50_IN(1), col50_OUT(1), col51_OUT(0));
		-- col 51
		col51_OUT(8 DOWNTO 1) <= col51_IN(7 DOWNTO 0);
		-- cols from 52 to 64
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
