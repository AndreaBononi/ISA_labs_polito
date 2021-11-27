LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-- DADDA TREE - STAGE 3 ----------------------------------------------------------------------------
ENTITY 	dadda_stage3 	IS
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
        col16_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col17_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col18_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col19_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col20_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col21_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col22_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col23_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col24_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col25_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col26_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col27_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col28_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col29_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col30_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col31_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col32_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col33_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col34_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col35_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col36_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col37_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col38_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col39_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col40_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col41_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col42_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col43_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col44_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col45_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col46_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col47_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col48_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col49_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col50_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
        col51_IN:		IN  STD_LOGIC_VECTOR (8 DOWNTO 0);
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
		col10_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col11_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col12_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col13_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col14_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col15_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col16_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col17_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col18_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col19_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col20_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col21_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col22_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col23_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col24_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col25_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col26_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col27_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col28_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col29_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col30_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col31_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col32_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col33_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col34_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col35_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col36_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col37_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col38_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col39_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col40_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col41_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col42_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col43_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col44_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col45_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col46_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col47_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col48_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col49_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col50_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col51_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col52_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col53_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col54_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col55_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col56_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col57_OUT:		OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		col58_OUT:		OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		col59_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col60_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
		col61_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col62_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
		col63_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col64_OUT:		OUT  STD_LOGIC_VECTOR (0 DOWNTO 0));
END 	dadda_stage3 ;


-- ARCHITECTURE ------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF dadda_stage3 IS

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
        -- cols from 0 to 9
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
        -- col 10
        col10_OUT(5 DOWNTO 1) <= col10_IN(6 DOWNTO 2);
		HA10: HA PORT MAP (col10_IN(0), col10_IN(1), col10_OUT(0), col11_OUT(0));
		-- col 11
		col11_OUT(5 DOWNTO 2) <= col11_IN(5 DOWNTO 2);
		HA11: HA PORT MAP (col11_IN(0), col11_IN(1), col11_OUT(1), col12_OUT(0));
        -- col 12
        col12_OUT(5 DOWNTO 3) <= col12_IN(7 DOWNTO 5);
		FA12: FA PORT MAP (col12_IN(0), col12_IN(1), col12_IN(2), col12_OUT(1), col13_OUT(0));
		HA12: HA PORT MAP (col12_IN(3), col12_IN(4), col12_OUT(2), col13_OUT(1));
		-- col 13
		col13_OUT(5 DOWNTO 4) <= col13_IN(6 DOWNTO 5);
		FA13: FA PORT MAP (col13_IN(0), col13_IN(1), col13_IN(2), col13_OUT(2), col14_OUT(0));
		HA13: HA PORT MAP (col13_IN(3), col13_IN(4), col13_OUT(3), col14_OUT(1));
        -- col 14
		col14_OUT(5) <= col14_IN(8);
		FA14_1: FA PORT MAP (col14_IN(0), col14_IN(1), col14_IN(2), col14_OUT(2), col15_OUT(0));
		FA14_2: FA PORT MAP (col14_IN(3), col14_IN(4), col14_IN(5), col14_OUT(3), col15_OUT(1));
		HA14: HA PORT MAP (col14_IN(6), col14_IN(7), col14_OUT(4), col15_OUT(2));
		-- col 15
		FA15_1: FA PORT MAP (col15_IN(0), col15_IN(1), col15_IN(2), col15_OUT(3), col16_OUT(0));
		FA15_2: FA PORT MAP (col15_IN(3), col15_IN(4), col15_IN(5), col15_OUT(4), col16_OUT(1));
		HA15: HA PORT MAP (col15_IN(6), col15_IN(7), col15_OUT(5), col16_OUT(2));
        -- col 16
        FA16_1: FA PORT MAP (col16_IN(0), col16_IN(1), col16_IN(2), col16_OUT(3), col17_OUT(0));
		FA16_2: FA PORT MAP (col16_IN(3), col16_IN(4), col16_IN(5), col16_OUT(4), col17_OUT(1));
		FA16_3: FA PORT MAP (col16_IN(6), col16_IN(7), col16_IN(8), col16_OUT(5), col17_OUT(2));
        -- col17
        FA17_1: FA PORT MAP (col17_IN(0), col17_IN(1), col17_IN(2), col17_OUT(3), col18_OUT(0));
        FA17_2: FA PORT MAP (col17_IN(3), col17_IN(4), col17_IN(5), col17_OUT(4), col18_OUT(1));
        FA17_3: FA PORT MAP (col17_IN(6), col17_IN(7), col17_IN(8), col17_OUT(5), col18_OUT(2));
        -- col18
        FA18_1: FA PORT MAP (col18_IN(0), col18_IN(1), col18_IN(2), col18_OUT(3), col19_OUT(0));
        FA18_2: FA PORT MAP (col18_IN(3), col18_IN(4), col18_IN(5), col18_OUT(4), col19_OUT(1));
        FA18_3: FA PORT MAP (col18_IN(6), col18_IN(7), col18_IN(8), col18_OUT(5), col19_OUT(2));
        -- col19
        FA19_1: FA PORT MAP (col19_IN(0), col19_IN(1), col19_IN(2), col19_OUT(3), col20_OUT(0));
        FA19_2: FA PORT MAP (col19_IN(3), col19_IN(4), col19_IN(5), col19_OUT(4), col20_OUT(1));
        FA19_3: FA PORT MAP (col19_IN(6), col19_IN(7), col19_IN(8), col19_OUT(5), col20_OUT(2));
        -- col20
        FA20_1: FA PORT MAP (col20_IN(0), col20_IN(1), col20_IN(2), col20_OUT(3), col21_OUT(0));
        FA20_2: FA PORT MAP (col20_IN(3), col20_IN(4), col20_IN(5), col20_OUT(4), col21_OUT(1));
        FA20_3: FA PORT MAP (col20_IN(6), col20_IN(7), col20_IN(8), col20_OUT(5), col21_OUT(2));
        -- col21
        FA21_1: FA PORT MAP (col21_IN(0), col21_IN(1), col21_IN(2), col21_OUT(3), col22_OUT(0));
        FA21_2: FA PORT MAP (col21_IN(3), col21_IN(4), col21_IN(5), col21_OUT(4), col22_OUT(1));
        FA21_3: FA PORT MAP (col21_IN(6), col21_IN(7), col21_IN(8), col21_OUT(5), col22_OUT(2));
        -- col22
        FA22_1: FA PORT MAP (col22_IN(0), col22_IN(1), col22_IN(2), col22_OUT(3), col23_OUT(0));
        FA22_2: FA PORT MAP (col22_IN(3), col22_IN(4), col22_IN(5), col22_OUT(4), col23_OUT(1));
        FA22_3: FA PORT MAP (col22_IN(6), col22_IN(7), col22_IN(8), col22_OUT(5), col23_OUT(2));
        -- col23
        FA23_1: FA PORT MAP (col23_IN(0), col23_IN(1), col23_IN(2), col23_OUT(3), col24_OUT(0));
        FA23_2: FA PORT MAP (col23_IN(3), col23_IN(4), col23_IN(5), col23_OUT(4), col24_OUT(1));
        FA23_3: FA PORT MAP (col23_IN(6), col23_IN(7), col23_IN(8), col23_OUT(5), col24_OUT(2));
        -- col24
        FA24_1: FA PORT MAP (col24_IN(0), col24_IN(1), col24_IN(2), col24_OUT(3), col25_OUT(0));
        FA24_2: FA PORT MAP (col24_IN(3), col24_IN(4), col24_IN(5), col24_OUT(4), col25_OUT(1));
        FA24_3: FA PORT MAP (col24_IN(6), col24_IN(7), col24_IN(8), col24_OUT(5), col25_OUT(2));
        -- col25
        FA25_1: FA PORT MAP (col25_IN(0), col25_IN(1), col25_IN(2), col25_OUT(3), col26_OUT(0));
        FA25_2: FA PORT MAP (col25_IN(3), col25_IN(4), col25_IN(5), col25_OUT(4), col26_OUT(1));
        FA25_3: FA PORT MAP (col25_IN(6), col25_IN(7), col25_IN(8), col25_OUT(5), col26_OUT(2));
        -- col26
        FA26_1: FA PORT MAP (col26_IN(0), col26_IN(1), col26_IN(2), col26_OUT(3), col27_OUT(0));
        FA26_2: FA PORT MAP (col26_IN(3), col26_IN(4), col26_IN(5), col26_OUT(4), col27_OUT(1));
        FA26_3: FA PORT MAP (col26_IN(6), col26_IN(7), col26_IN(8), col26_OUT(5), col27_OUT(2));
        -- col27
        FA27_1: FA PORT MAP (col27_IN(0), col27_IN(1), col27_IN(2), col27_OUT(3), col28_OUT(0));
        FA27_2: FA PORT MAP (col27_IN(3), col27_IN(4), col27_IN(5), col27_OUT(4), col28_OUT(1));
        FA27_3: FA PORT MAP (col27_IN(6), col27_IN(7), col27_IN(8), col27_OUT(5), col28_OUT(2));
        -- col28
        FA28_1: FA PORT MAP (col28_IN(0), col28_IN(1), col28_IN(2), col28_OUT(3), col29_OUT(0));
        FA28_2: FA PORT MAP (col28_IN(3), col28_IN(4), col28_IN(5), col28_OUT(4), col29_OUT(1));
        FA28_3: FA PORT MAP (col28_IN(6), col28_IN(7), col28_IN(8), col28_OUT(5), col29_OUT(2));
        -- col29
        FA29_1: FA PORT MAP (col29_IN(0), col29_IN(1), col29_IN(2), col29_OUT(3), col30_OUT(0));
        FA29_2: FA PORT MAP (col29_IN(3), col29_IN(4), col29_IN(5), col29_OUT(4), col30_OUT(1));
        FA29_3: FA PORT MAP (col29_IN(6), col29_IN(7), col29_IN(8), col29_OUT(5), col30_OUT(2));
        -- col30
        FA30_1: FA PORT MAP (col30_IN(0), col30_IN(1), col30_IN(2), col30_OUT(3), col31_OUT(0));
        FA30_2: FA PORT MAP (col30_IN(3), col30_IN(4), col30_IN(5), col30_OUT(4), col31_OUT(1));
        FA30_3: FA PORT MAP (col30_IN(6), col30_IN(7), col30_IN(8), col30_OUT(5), col31_OUT(2));
        -- col31
        FA31_1: FA PORT MAP (col31_IN(0), col31_IN(1), col31_IN(2), col31_OUT(3), col32_OUT(0));
        FA31_2: FA PORT MAP (col31_IN(3), col31_IN(4), col31_IN(5), col31_OUT(4), col32_OUT(1));
        FA31_3: FA PORT MAP (col31_IN(6), col31_IN(7), col31_IN(8), col31_OUT(5), col32_OUT(2));
        -- col32
        FA32_1: FA PORT MAP (col32_IN(0), col32_IN(1), col32_IN(2), col32_OUT(3), col33_OUT(0));
        FA32_2: FA PORT MAP (col32_IN(3), col32_IN(4), col32_IN(5), col32_OUT(4), col33_OUT(1));
        FA32_3: FA PORT MAP (col32_IN(6), col32_IN(7), col32_IN(8), col32_OUT(5), col33_OUT(2));
        -- col33
        FA33_1: FA PORT MAP (col33_IN(0), col33_IN(1), col33_IN(2), col33_OUT(3), col34_OUT(0));
        FA33_2: FA PORT MAP (col33_IN(3), col33_IN(4), col33_IN(5), col33_OUT(4), col34_OUT(1));
        FA33_3: FA PORT MAP (col33_IN(6), col33_IN(7), col33_IN(8), col33_OUT(5), col34_OUT(2));
        -- col34
        FA34_1: FA PORT MAP (col34_IN(0), col34_IN(1), col34_IN(2), col34_OUT(3), col35_OUT(0));
        FA34_2: FA PORT MAP (col34_IN(3), col34_IN(4), col34_IN(5), col34_OUT(4), col35_OUT(1));
        FA34_3: FA PORT MAP (col34_IN(6), col34_IN(7), col34_IN(8), col34_OUT(5), col35_OUT(2));
        -- col35
        FA35_1: FA PORT MAP (col35_IN(0), col35_IN(1), col35_IN(2), col35_OUT(3), col36_OUT(0));
        FA35_2: FA PORT MAP (col35_IN(3), col35_IN(4), col35_IN(5), col35_OUT(4), col36_OUT(1));
        FA35_3: FA PORT MAP (col35_IN(6), col35_IN(7), col35_IN(8), col35_OUT(5), col36_OUT(2));
        -- col36
        FA36_1: FA PORT MAP (col36_IN(0), col36_IN(1), col36_IN(2), col36_OUT(3), col37_OUT(0));
        FA36_2: FA PORT MAP (col36_IN(3), col36_IN(4), col36_IN(5), col36_OUT(4), col37_OUT(1));
        FA36_3: FA PORT MAP (col36_IN(6), col36_IN(7), col36_IN(8), col36_OUT(5), col37_OUT(2));
        -- col37
        FA37_1: FA PORT MAP (col37_IN(0), col37_IN(1), col37_IN(2), col37_OUT(3), col38_OUT(0));
        FA37_2: FA PORT MAP (col37_IN(3), col37_IN(4), col37_IN(5), col37_OUT(4), col38_OUT(1));
        FA37_3: FA PORT MAP (col37_IN(6), col37_IN(7), col37_IN(8), col37_OUT(5), col38_OUT(2));
        -- col38
        FA38_1: FA PORT MAP (col38_IN(0), col38_IN(1), col38_IN(2), col38_OUT(3), col39_OUT(0));
        FA38_2: FA PORT MAP (col38_IN(3), col38_IN(4), col38_IN(5), col38_OUT(4), col39_OUT(1));
        FA38_3: FA PORT MAP (col38_IN(6), col38_IN(7), col38_IN(8), col38_OUT(5), col39_OUT(2));
        -- col39
        FA39_1: FA PORT MAP (col39_IN(0), col39_IN(1), col39_IN(2), col39_OUT(3), col40_OUT(0));
        FA39_2: FA PORT MAP (col39_IN(3), col39_IN(4), col39_IN(5), col39_OUT(4), col40_OUT(1));
        FA39_3: FA PORT MAP (col39_IN(6), col39_IN(7), col39_IN(8), col39_OUT(5), col40_OUT(2));
        -- col40
        FA40_1: FA PORT MAP (col40_IN(0), col40_IN(1), col40_IN(2), col40_OUT(3), col41_OUT(0));
        FA40_2: FA PORT MAP (col40_IN(3), col40_IN(4), col40_IN(5), col40_OUT(4), col41_OUT(1));
        FA40_3: FA PORT MAP (col40_IN(6), col40_IN(7), col40_IN(8), col40_OUT(5), col41_OUT(2));
        -- col41
        FA41_1: FA PORT MAP (col41_IN(0), col41_IN(1), col41_IN(2), col41_OUT(3), col42_OUT(0));
        FA41_2: FA PORT MAP (col41_IN(3), col41_IN(4), col41_IN(5), col41_OUT(4), col42_OUT(1));
        FA41_3: FA PORT MAP (col41_IN(6), col41_IN(7), col41_IN(8), col41_OUT(5), col42_OUT(2));
        -- col42
        FA42_1: FA PORT MAP (col42_IN(0), col42_IN(1), col42_IN(2), col42_OUT(3), col43_OUT(0));
        FA42_2: FA PORT MAP (col42_IN(3), col42_IN(4), col42_IN(5), col42_OUT(4), col43_OUT(1));
        FA42_3: FA PORT MAP (col42_IN(6), col42_IN(7), col42_IN(8), col42_OUT(5), col43_OUT(2));
        -- col43
        FA43_1: FA PORT MAP (col43_IN(0), col43_IN(1), col43_IN(2), col43_OUT(3), col44_OUT(0));
        FA43_2: FA PORT MAP (col43_IN(3), col43_IN(4), col43_IN(5), col43_OUT(4), col44_OUT(1));
        FA43_3: FA PORT MAP (col43_IN(6), col43_IN(7), col43_IN(8), col43_OUT(5), col44_OUT(2));
        -- col44
        FA44_1: FA PORT MAP (col44_IN(0), col44_IN(1), col44_IN(2), col44_OUT(3), col45_OUT(0));
        FA44_2: FA PORT MAP (col44_IN(3), col44_IN(4), col44_IN(5), col44_OUT(4), col45_OUT(1));
        FA44_3: FA PORT MAP (col44_IN(6), col44_IN(7), col44_IN(8), col44_OUT(5), col45_OUT(2));
        -- col45
        FA45_1: FA PORT MAP (col45_IN(0), col45_IN(1), col45_IN(2), col45_OUT(3), col46_OUT(0));
        FA45_2: FA PORT MAP (col45_IN(3), col45_IN(4), col45_IN(5), col45_OUT(4), col46_OUT(1));
        FA45_3: FA PORT MAP (col45_IN(6), col45_IN(7), col45_IN(8), col45_OUT(5), col46_OUT(2));
        -- col46
        FA46_1: FA PORT MAP (col46_IN(0), col46_IN(1), col46_IN(2), col46_OUT(3), col47_OUT(0));
        FA46_2: FA PORT MAP (col46_IN(3), col46_IN(4), col46_IN(5), col46_OUT(4), col47_OUT(1));
        FA46_3: FA PORT MAP (col46_IN(6), col46_IN(7), col46_IN(8), col46_OUT(5), col47_OUT(2));
        -- col47
        FA47_1: FA PORT MAP (col47_IN(0), col47_IN(1), col47_IN(2), col47_OUT(3), col48_OUT(0));
        FA47_2: FA PORT MAP (col47_IN(3), col47_IN(4), col47_IN(5), col47_OUT(4), col48_OUT(1));
        FA47_3: FA PORT MAP (col47_IN(6), col47_IN(7), col47_IN(8), col47_OUT(5), col48_OUT(2));
        -- col48
        FA48_1: FA PORT MAP (col48_IN(0), col48_IN(1), col48_IN(2), col48_OUT(3), col49_OUT(0));
        FA48_2: FA PORT MAP (col48_IN(3), col48_IN(4), col48_IN(5), col48_OUT(4), col49_OUT(1));
        FA48_3: FA PORT MAP (col48_IN(6), col48_IN(7), col48_IN(8), col48_OUT(5), col49_OUT(2));
        -- col49
        FA49_1: FA PORT MAP (col49_IN(0), col49_IN(1), col49_IN(2), col49_OUT(3), col50_OUT(0));
        FA49_2: FA PORT MAP (col49_IN(3), col49_IN(4), col49_IN(5), col49_OUT(4), col50_OUT(1));
        FA49_3: FA PORT MAP (col49_IN(6), col49_IN(7), col49_IN(8), col49_OUT(5), col50_OUT(2));
        -- col50
        FA50_1: FA PORT MAP (col50_IN(0), col50_IN(1), col50_IN(2), col50_OUT(3), col51_OUT(0));
        FA50_2: FA PORT MAP (col50_IN(3), col50_IN(4), col50_IN(5), col50_OUT(4), col51_OUT(1));
        FA50_3: FA PORT MAP (col50_IN(6), col50_IN(7), col50_IN(8), col50_OUT(5), col51_OUT(2));
        -- col51
        FA51_1: FA PORT MAP (col51_IN(0), col51_IN(1), col51_IN(2), col51_OUT(3), col52_OUT(0));
        FA51_2: FA PORT MAP (col51_IN(3), col51_IN(4), col51_IN(5), col51_OUT(4), col52_OUT(1));
        FA51_3: FA PORT MAP (col51_IN(6), col51_IN(7), col51_IN(8), col51_OUT(5), col52_OUT(2));
        -- col 52
		FA52_1: FA PORT MAP (col52_IN(0), col52_IN(1), col52_IN(2), col52_OUT(3), col53_OUT(0));
		FA52_2: FA PORT MAP (col52_IN(3), col52_IN(4), col52_IN(5), col52_OUT(4), col53_OUT(1));
		HA52: HA PORT MAP (col52_IN(6), col52_IN(7), col52_OUT(5), col53_OUT(2));
        -- col 53
        col53_OUT(5) <= col53_IN(6);
		FA53_1: FA PORT MAP (col53_IN(0), col53_IN(1), col53_IN(2), col53_OUT(3), col54_OUT(0));
		FA53_2: FA PORT MAP (col53_IN(3), col53_IN(4), col53_IN(5), col53_OUT(4), col54_OUT(1));
        -- col 54
		col54_OUT(5 DOWNTO 4) <= col54_IN(6 DOWNTO 5);
		FA54: FA PORT MAP (col54_IN(0), col54_IN(1), col54_IN(2), col54_OUT(2), col55_OUT(0));
		HA54: HA PORT MAP (col54_IN(3), col54_IN(4), col54_OUT(3), col55_OUT(1));
        -- col 55
		col55_OUT(5 DOWNTO 3) <= col55_IN(5 DOWNTO 3);
		FA55: FA PORT MAP (col55_IN(0), col55_IN(1), col55_IN(2), col55_OUT(2), col56_OUT(0));
        -- col 56
		col56_OUT(5 DOWNTO 2) <= col56_IN(5 DOWNTO 2);
		HA56: HA PORT MAP (col56_IN(0), col56_IN(1), col56_OUT(1), col57_OUT(0));
        -- col 57
		col57_OUT(5 DOWNTO 1) <= col57_IN(4 DOWNTO 0);
		-- cols from 58 to 64
        col58_OUT <= col58_IN;
		col59_OUT <= col59_IN;
		col60_OUT <= col60_IN;
		col61_OUT <= col61_IN;
		col62_OUT <= col62_IN;
		col63_OUT <= col63_IN;
		col64_OUT <= col64_IN;

END behaviour;
