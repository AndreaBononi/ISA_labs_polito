LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-- DADDA TREE - STAGE 6 ----------------------------------------------------------------------------
ENTITY 	dadda_stage6 	IS
PORT	(col0_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
        col1_IN:		IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
        col2_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col3_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
        col4_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col5_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col6_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col7_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col8_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col9_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col10_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col11_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col12_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col13_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col14_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col15_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col16_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col17_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col18_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col19_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col20_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col21_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col22_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col23_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col24_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col25_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col26_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col27_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col28_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col29_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col30_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col31_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col32_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col33_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col34_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col35_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col36_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col37_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col38_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col39_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col40_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col41_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col42_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col43_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col44_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col45_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col46_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col47_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col48_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col49_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col50_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col51_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col52_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col53_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col54_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col55_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col56_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col57_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col58_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col59_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col60_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col61_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col62_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col63_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        col64_IN:		IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
		col0_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col1_OUT:		OUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		col2_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col3_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col4_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col5_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col6_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col7_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col8_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col9_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col10_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col11_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col12_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col13_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col14_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col15_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col16_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col17_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col18_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col19_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col20_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col21_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col22_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col23_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col24_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col25_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col26_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col27_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col28_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col29_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col30_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col31_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col32_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col33_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col34_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col35_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col36_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col37_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col38_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col39_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col40_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col41_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col42_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col43_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col44_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col45_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col46_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col47_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col48_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col49_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col50_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col51_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col52_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col53_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col54_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col55_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col56_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col57_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col58_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col59_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col60_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col61_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col62_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col63_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		col64_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0));
END 	dadda_stage6 ;


-- ARCHITECTURE ------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF dadda_stage6 IS

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
        -- col 0
		col0_OUT <= col0_IN;
        -- col 1
		col1_OUT <= col1_IN;
        -- col 2
        col2_OUT(1) <= col2_IN(2);
		HA2: HA PORT MAP (col2_IN(0), col2_IN(1), col2_OUT(0), col3_OUT(0));
		-- col 3
		HA3: HA PORT MAP (col3_IN(0), col3_IN(1), col3_OUT(1), col4_OUT(0));
        -- col 4
		FA4: FA PORT MAP (col4_IN(0), col4_IN(1), col4_IN(2), col4_OUT(1), col5_OUT(0));
        -- col5
        FA5: FA PORT MAP (col5_IN(0), col5_IN(1), col5_IN(2), col5_OUT(1), col6_OUT(0));
        -- col6
        FA6: FA PORT MAP (col6_IN(0), col6_IN(1), col6_IN(2), col6_OUT(1), col7_OUT(0));
        -- col7
        FA7: FA PORT MAP (col7_IN(0), col7_IN(1), col7_IN(2), col7_OUT(1), col8_OUT(0));
        -- col8
        FA8: FA PORT MAP (col8_IN(0), col8_IN(1), col8_IN(2), col8_OUT(1), col9_OUT(0));
        -- col9
        FA9: FA PORT MAP (col9_IN(0), col9_IN(1), col9_IN(2), col9_OUT(1), col10_OUT(0));
        -- col10
        FA10: FA PORT MAP (col10_IN(0), col10_IN(1), col10_IN(2), col10_OUT(1), col11_OUT(0));
        -- col11
        FA11: FA PORT MAP (col11_IN(0), col11_IN(1), col11_IN(2), col11_OUT(1), col12_OUT(0));
        -- col12
        FA12: FA PORT MAP (col12_IN(0), col12_IN(1), col12_IN(2), col12_OUT(1), col13_OUT(0));
        -- col13
        FA13: FA PORT MAP (col13_IN(0), col13_IN(1), col13_IN(2), col13_OUT(1), col14_OUT(0));
        -- col14
        FA14: FA PORT MAP (col14_IN(0), col14_IN(1), col14_IN(2), col14_OUT(1), col15_OUT(0));
        -- col15
        FA15: FA PORT MAP (col15_IN(0), col15_IN(1), col15_IN(2), col15_OUT(1), col16_OUT(0));
        -- col16
        FA16: FA PORT MAP (col16_IN(0), col16_IN(1), col16_IN(2), col16_OUT(1), col17_OUT(0));
        -- col17
        FA17: FA PORT MAP (col17_IN(0), col17_IN(1), col17_IN(2), col17_OUT(1), col18_OUT(0));
        -- col18
        FA18: FA PORT MAP (col18_IN(0), col18_IN(1), col18_IN(2), col18_OUT(1), col19_OUT(0));
        -- col19
        FA19: FA PORT MAP (col19_IN(0), col19_IN(1), col19_IN(2), col19_OUT(1), col20_OUT(0));
        -- col20
        FA20: FA PORT MAP (col20_IN(0), col20_IN(1), col20_IN(2), col20_OUT(1), col21_OUT(0));
        -- col21
        FA21: FA PORT MAP (col21_IN(0), col21_IN(1), col21_IN(2), col21_OUT(1), col22_OUT(0));
        -- col22
        FA22: FA PORT MAP (col22_IN(0), col22_IN(1), col22_IN(2), col22_OUT(1), col23_OUT(0));
        -- col23
        FA23: FA PORT MAP (col23_IN(0), col23_IN(1), col23_IN(2), col23_OUT(1), col24_OUT(0));
        -- col24
        FA24: FA PORT MAP (col24_IN(0), col24_IN(1), col24_IN(2), col24_OUT(1), col25_OUT(0));
        -- col25
        FA25: FA PORT MAP (col25_IN(0), col25_IN(1), col25_IN(2), col25_OUT(1), col26_OUT(0));
        -- col26
        FA26: FA PORT MAP (col26_IN(0), col26_IN(1), col26_IN(2), col26_OUT(1), col27_OUT(0));
        -- col27
        FA27: FA PORT MAP (col27_IN(0), col27_IN(1), col27_IN(2), col27_OUT(1), col28_OUT(0));
        -- col28
        FA28: FA PORT MAP (col28_IN(0), col28_IN(1), col28_IN(2), col28_OUT(1), col29_OUT(0));
        -- col29
        FA29: FA PORT MAP (col29_IN(0), col29_IN(1), col29_IN(2), col29_OUT(1), col30_OUT(0));
        -- col30
        FA30: FA PORT MAP (col30_IN(0), col30_IN(1), col30_IN(2), col30_OUT(1), col31_OUT(0));
        -- col31
        FA31: FA PORT MAP (col31_IN(0), col31_IN(1), col31_IN(2), col31_OUT(1), col32_OUT(0));
        -- col32
        FA32: FA PORT MAP (col32_IN(0), col32_IN(1), col32_IN(2), col32_OUT(1), col33_OUT(0));
        -- col33
        FA33: FA PORT MAP (col33_IN(0), col33_IN(1), col33_IN(2), col33_OUT(1), col34_OUT(0));
        -- col34
        FA34: FA PORT MAP (col34_IN(0), col34_IN(1), col34_IN(2), col34_OUT(1), col35_OUT(0));
        -- col35
        FA35: FA PORT MAP (col35_IN(0), col35_IN(1), col35_IN(2), col35_OUT(1), col36_OUT(0));
        -- col36
        FA36: FA PORT MAP (col36_IN(0), col36_IN(1), col36_IN(2), col36_OUT(1), col37_OUT(0));
        -- col37
        FA37: FA PORT MAP (col37_IN(0), col37_IN(1), col37_IN(2), col37_OUT(1), col38_OUT(0));
        -- col38
        FA38: FA PORT MAP (col38_IN(0), col38_IN(1), col38_IN(2), col38_OUT(1), col39_OUT(0));
        -- col39
        FA39: FA PORT MAP (col39_IN(0), col39_IN(1), col39_IN(2), col39_OUT(1), col40_OUT(0));
        -- col40
        FA40: FA PORT MAP (col40_IN(0), col40_IN(1), col40_IN(2), col40_OUT(1), col41_OUT(0));
        -- col41
        FA41: FA PORT MAP (col41_IN(0), col41_IN(1), col41_IN(2), col41_OUT(1), col42_OUT(0));
        -- col42
        FA42: FA PORT MAP (col42_IN(0), col42_IN(1), col42_IN(2), col42_OUT(1), col43_OUT(0));
        -- col43
        FA43: FA PORT MAP (col43_IN(0), col43_IN(1), col43_IN(2), col43_OUT(1), col44_OUT(0));
        -- col44
        FA44: FA PORT MAP (col44_IN(0), col44_IN(1), col44_IN(2), col44_OUT(1), col45_OUT(0));
        -- col45
        FA45: FA PORT MAP (col45_IN(0), col45_IN(1), col45_IN(2), col45_OUT(1), col46_OUT(0));
        -- col46
        FA46: FA PORT MAP (col46_IN(0), col46_IN(1), col46_IN(2), col46_OUT(1), col47_OUT(0));
        -- col47
        FA47: FA PORT MAP (col47_IN(0), col47_IN(1), col47_IN(2), col47_OUT(1), col48_OUT(0));
        -- col48
        FA48: FA PORT MAP (col48_IN(0), col48_IN(1), col48_IN(2), col48_OUT(1), col49_OUT(0));
        -- col49
        FA49: FA PORT MAP (col49_IN(0), col49_IN(1), col49_IN(2), col49_OUT(1), col50_OUT(0));
        -- col50
        FA50: FA PORT MAP (col50_IN(0), col50_IN(1), col50_IN(2), col50_OUT(1), col51_OUT(0));
        -- col51
        FA51: FA PORT MAP (col51_IN(0), col51_IN(1), col51_IN(2), col51_OUT(1), col52_OUT(0));
        -- col52
        FA52: FA PORT MAP (col52_IN(0), col52_IN(1), col52_IN(2), col52_OUT(1), col53_OUT(0));
        -- col53
        FA53: FA PORT MAP (col53_IN(0), col53_IN(1), col53_IN(2), col53_OUT(1), col54_OUT(0));
        -- col54
        FA54: FA PORT MAP (col54_IN(0), col54_IN(1), col54_IN(2), col54_OUT(1), col55_OUT(0));
        -- col55
        FA55: FA PORT MAP (col55_IN(0), col55_IN(1), col55_IN(2), col55_OUT(1), col56_OUT(0));
        -- col56
        FA56: FA PORT MAP (col56_IN(0), col56_IN(1), col56_IN(2), col56_OUT(1), col57_OUT(0));
        -- col57
        FA57: FA PORT MAP (col57_IN(0), col57_IN(1), col57_IN(2), col57_OUT(1), col58_OUT(0));
        -- col58
        FA58: FA PORT MAP (col58_IN(0), col58_IN(1), col58_IN(2), col58_OUT(1), col59_OUT(0));
        -- col59
        FA59: FA PORT MAP (col59_IN(0), col59_IN(1), col59_IN(2), col59_OUT(1), col60_OUT(0));
        -- col60
        FA60: FA PORT MAP (col60_IN(0), col60_IN(1), col60_IN(2), col60_OUT(1), col61_OUT(0));
        -- col61
        FA61: FA PORT MAP (col61_IN(0), col61_IN(1), col61_IN(2), col61_OUT(1), col62_OUT(0));
        -- col62
        FA62: FA PORT MAP (col62_IN(0), col62_IN(1), col62_IN(2), col62_OUT(1), col63_OUT(0));
        -- col63
        FA63: FA PORT MAP (col63_IN(0), col63_IN(1), col63_IN(2), col63_OUT(1), col64_OUT(0));
        -- col64
        col64_OUT(1) <= col64_IN(0);

END behaviour;
