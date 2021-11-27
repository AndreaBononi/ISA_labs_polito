LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-- MODIFIED BOOTH ENCODING MULTPLIER ---------------------------------------------------
ENTITY 	MBE_Multiplier IS
PORT	(in_A:         IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		in_B:		   IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
        result:        OUT STD_LOGIC_VECTOR (63 DOWNTO 0));
END 	MBE_Multiplier;


-- ARCHITECTURE ------------------------------------------------------------------------
ARCHITECTURE behaviour OF MBE_Multiplier IS

	-- RIPPLE CARRY ADDER
	COMPONENT	RCA     IS
	GENERIC 	(N:     INTEGER := 8);
	PORT    	(in1:   IN  STD_LOGIC_VECTOR (N-1 downto 0);
	        	in2:    IN  STD_LOGIC_VECTOR (N-1 downto 0);
				cin:    IN  STD_LOGIC;
				res:    OUT STD_LOGIC_VECTOR (N-1 downto 0));
	END     	COMPONENT;

	-- PARTIAL PRODUCTS GENERATOR ------------------------------------------------------
    COMPONENT 	partProd	IS
    PORT	    (in_A:		IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
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
    END 	    COMPONENT;

    -- DADDA TREE - STAGE 1 ----------------------------------------------------------------------------
    COMPONENT 	dadda_stage1 	IS
    PORT	    (col0_IN:		IN   STD_LOGIC_VECTOR (1 DOWNTO 0);
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
    END 	    COMPONENT;

    COMPONENT 	dadda_stage2 	IS
    PORT	    (col0_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
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
    END 	    COMPONENT;

    -- DADDA TREE - STAGE 3 ----------------------------------------------------------------------------
    COMPONENT 	dadda_stage3 	IS
    PORT	    (col0_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
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
    END 	    COMPONENT;

    -- DADDA TREE - STAGE 4 ----------------------------------------------------------------------------
    COMPONENT 	dadda_stage4 	IS
    PORT	    (col0_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
                col1_IN:		IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
                col2_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
                col3_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
                col4_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col5_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
                col6_IN:		IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
                col7_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col8_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col9_IN:		IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
                col10_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col11_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col12_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col13_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col14_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col15_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col16_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col17_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col18_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col19_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col20_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col21_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col22_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col23_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col24_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col25_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col26_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col27_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col28_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col29_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col30_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col31_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col32_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col33_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col34_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col35_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col36_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col37_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col38_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col39_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col40_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col41_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col42_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col43_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col44_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col45_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col46_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col47_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col48_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col49_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col50_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col51_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col52_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col53_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col54_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col55_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col56_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
                col57_IN:		IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
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
        		col6_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col7_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col8_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col9_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col10_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col11_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col12_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col13_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col14_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col15_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col16_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col17_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col18_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col19_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col20_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col21_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col22_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col23_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col24_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col25_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col26_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col27_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col28_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col29_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col30_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col31_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col32_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col33_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col34_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col35_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col36_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col37_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col38_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col39_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col40_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col41_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col42_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col43_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col44_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col45_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col46_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col47_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col48_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col49_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col50_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col51_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col52_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col53_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col54_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col55_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col56_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col57_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col58_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col59_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col60_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col61_OUT:		OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
        		col62_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col63_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
        		col64_OUT:		OUT  STD_LOGIC_VECTOR (0 DOWNTO 0));
    END 	    COMPONENT ;

    -- DADDA TREE - STAGE 5 ----------------------------------------------------------------------------
    COMPONENT 	dadda_stage5 	IS
    PORT	    (col0_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
                col1_IN:		IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
                col2_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
                col3_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
                col4_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col5_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
                col6_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col7_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col8_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col9_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col10_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col11_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col12_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col13_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col14_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col15_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col16_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col17_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col18_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col19_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col20_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col21_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col22_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col23_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col24_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col25_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col26_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col27_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col28_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col29_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col30_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col31_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col32_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col33_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col34_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col35_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col36_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col37_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col38_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col39_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col40_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col41_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col42_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col43_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col44_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col45_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col46_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col47_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col48_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col49_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col50_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col51_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col52_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col53_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col54_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col55_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col56_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col57_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col58_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col59_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col60_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col61_IN:		IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
                col62_IN:		IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
                col63_IN:		IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
                col64_IN:		IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
        		col0_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
        		col1_OUT:		OUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
        		col2_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col3_OUT:		OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
        		col4_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col5_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col6_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col7_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col8_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col9_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col10_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col11_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col12_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col13_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col14_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col15_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col16_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col17_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col18_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col19_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col20_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col21_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col22_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col23_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col24_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col25_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col26_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col27_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col28_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col29_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col30_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col31_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col32_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col33_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col34_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col35_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col36_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col37_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col38_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col39_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col40_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col41_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col42_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col43_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col44_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col45_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col46_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col47_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col48_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col49_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col50_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col51_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col52_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col53_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col54_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col55_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col56_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col57_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col58_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col59_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col60_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col61_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col62_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col63_OUT:		OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
        		col64_OUT:		OUT  STD_LOGIC_VECTOR (0 DOWNTO 0));
    END 	    COMPONENT ;

    -- DADDA TREE - STAGE 6 ----------------------------------------------------------------------------
    COMPONENT 	dadda_stage6 	IS
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
    END 	COMPONENT;

	-- SIGNALS ------------------------------------------------------------------------------
    SIGNAL P0:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P1:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P2:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P3:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P4:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P5:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P6:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P7:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P8:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P9:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P10:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P11:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P12:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P13:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P14:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P15:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL P16:		STD_LOGIC_VECTOR (32 DOWNTO 0);
    SIGNAL S0:		STD_LOGIC;
    SIGNAL S1:		STD_LOGIC;
    SIGNAL S2:		STD_LOGIC;
    SIGNAL S3:		STD_LOGIC;
    SIGNAL S4:		STD_LOGIC;
    SIGNAL S5:		STD_LOGIC;
    SIGNAL S6:		STD_LOGIC;
    SIGNAL S7:		STD_LOGIC;
    SIGNAL S8:		STD_LOGIC;
    SIGNAL S9:		STD_LOGIC;
    SIGNAL S10:		STD_LOGIC;
    SIGNAL S11:		STD_LOGIC;
    SIGNAL S12:		STD_LOGIC;
    SIGNAL S13:		STD_LOGIC;
    SIGNAL S14:		STD_LOGIC;
    SIGNAL S15:		STD_LOGIC;
    SIGNAL col0:	STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL col1:	STD_LOGIC_VECTOR (0 DOWNTO 0);
    SIGNAL col2:	STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL col3: 	STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL col4: 	STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL col5: 	STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL col6: 	STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL col7: 	STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL col8: 	STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL col9: 	STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL col10:	STD_LOGIC_VECTOR (6 DOWNTO 0);
    SIGNAL col11:	STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL col12:	STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL col13:	STD_LOGIC_VECTOR (6 DOWNTO 0);
    SIGNAL col14:	STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL col15:	STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL col16:	STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL col17:	STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL col18:	STD_LOGIC_VECTOR (10 DOWNTO 0);
    SIGNAL col19:	STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL col20:	STD_LOGIC_VECTOR (11 DOWNTO 0);
    SIGNAL col21:	STD_LOGIC_VECTOR (10 DOWNTO 0);
    SIGNAL col22:	STD_LOGIC_VECTOR (12 DOWNTO 0);
    SIGNAL col23:	STD_LOGIC_VECTOR (11 DOWNTO 0);
    SIGNAL col24:	STD_LOGIC_VECTOR (13 DOWNTO 0);
    SIGNAL col25:	STD_LOGIC_VECTOR (12 DOWNTO 0);
    SIGNAL col26:	STD_LOGIC_VECTOR (14 DOWNTO 0);
    SIGNAL col27:	STD_LOGIC_VECTOR (13 DOWNTO 0);
    SIGNAL col28:	STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL col29:	STD_LOGIC_VECTOR (14 DOWNTO 0);
    SIGNAL col30:	STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL col31:	STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL col32:	STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL col33:	STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL col34:	STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL col35:	STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL col36:	STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL col37:	STD_LOGIC_VECTOR (14 DOWNTO 0);
    SIGNAL col38:	STD_LOGIC_VECTOR (14 DOWNTO 0);
    SIGNAL col39:	STD_LOGIC_VECTOR (13 DOWNTO 0);
    SIGNAL col40:	STD_LOGIC_VECTOR (13 DOWNTO 0);
    SIGNAL col41:	STD_LOGIC_VECTOR (12 DOWNTO 0);
    SIGNAL col42:	STD_LOGIC_VECTOR (12 DOWNTO 0);
    SIGNAL col43:	STD_LOGIC_VECTOR (11 DOWNTO 0);
    SIGNAL col44:	STD_LOGIC_VECTOR (11 DOWNTO 0);
    SIGNAL col45:	STD_LOGIC_VECTOR (10 DOWNTO 0);
    SIGNAL col46:	STD_LOGIC_VECTOR (10 DOWNTO 0);
    SIGNAL col47:	STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL col48:	STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL col49:	STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL col50:	STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL col51:	STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL col52:	STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL col53:	STD_LOGIC_VECTOR (6 DOWNTO 0);
    SIGNAL col54:	STD_LOGIC_VECTOR (6 DOWNTO 0);
    SIGNAL col55:	STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL col56:	STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL col57:	STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL col58:	STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL col59:	STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL col60:	STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL col61:	STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL col62:	STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL col63:	STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL col64:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col0_dadda1_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col1_dadda1_OUT:		STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col2_dadda1_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col3_dadda1_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col4_dadda1_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col5_dadda1_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col6_dadda1_OUT:		STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col7_dadda1_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col8_dadda1_OUT:		STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col9_dadda1_OUT:		STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col10_dadda1_OUT:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL col11_dadda1_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col12_dadda1_OUT:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL col13_dadda1_OUT:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL col14_dadda1_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col15_dadda1_OUT:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL col16_dadda1_OUT:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL col17_dadda1_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col18_dadda1_OUT:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	SIGNAL col19_dadda1_OUT:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL col20_dadda1_OUT:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	SIGNAL col21_dadda1_OUT:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	SIGNAL col22_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col23_dadda1_OUT:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	SIGNAL col24_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col25_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col26_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col27_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col28_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col29_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col30_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col31_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col32_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col33_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col34_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col35_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col36_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col37_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col38_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col39_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col40_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col41_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col42_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col43_dadda1_OUT:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL col44_dadda1_OUT:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	SIGNAL col45_dadda1_OUT:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	SIGNAL col46_dadda1_OUT:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	SIGNAL col47_dadda1_OUT:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL col48_dadda1_OUT:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL col49_dadda1_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col50_dadda1_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col51_dadda1_OUT:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL col52_dadda1_OUT:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL col53_dadda1_OUT:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL col54_dadda1_OUT:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL col55_dadda1_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col56_dadda1_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col57_dadda1_OUT:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col58_dadda1_OUT:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col59_dadda1_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col60_dadda1_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col61_dadda1_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col62_dadda1_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col63_dadda1_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col64_dadda1_OUT:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col0_dadda2_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col1_dadda2_OUT:		STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col2_dadda2_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col3_dadda2_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col4_dadda2_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col5_dadda2_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col6_dadda2_OUT:		STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col7_dadda2_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col8_dadda2_OUT:		STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col9_dadda2_OUT:		STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col10_dadda2_OUT:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL col11_dadda2_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col12_dadda2_OUT:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL col13_dadda2_OUT:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL col14_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col15_dadda2_OUT:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL col16_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col17_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col18_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col19_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col20_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col21_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col22_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col23_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col24_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col25_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col26_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col27_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col28_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col29_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col30_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col31_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col32_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col33_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col34_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col35_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col36_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col37_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col38_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col39_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col40_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col41_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col42_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col43_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col44_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col45_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col46_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col47_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col48_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col49_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col50_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col51_dadda2_OUT:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL col52_dadda2_OUT:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL col53_dadda2_OUT:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL col54_dadda2_OUT:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL col55_dadda2_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col56_dadda2_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col57_dadda2_OUT:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col58_dadda2_OUT:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col59_dadda2_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col60_dadda2_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col61_dadda2_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col62_dadda2_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col63_dadda2_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col64_dadda2_OUT:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col0_dadda3_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col1_dadda3_OUT:		STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col2_dadda3_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col3_dadda3_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col4_dadda3_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col5_dadda3_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col6_dadda3_OUT:		STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col7_dadda3_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col8_dadda3_OUT:		STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col9_dadda3_OUT:		STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col10_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col11_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col12_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col13_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col14_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col15_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col16_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col17_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col18_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col19_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col20_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col21_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col22_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col23_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col24_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col25_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col26_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col27_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col28_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col29_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col30_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col31_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col32_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col33_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col34_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col35_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col36_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col37_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col38_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col39_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col40_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col41_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col42_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col43_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col44_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col45_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col46_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col47_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col48_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col49_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col50_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col51_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col52_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col53_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col54_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col55_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col56_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col57_dadda3_OUT:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL col58_dadda3_OUT:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL col59_dadda3_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col60_dadda3_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col61_dadda3_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col62_dadda3_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col63_dadda3_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col64_dadda3_OUT:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col0_dadda4_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col1_dadda4_OUT:		STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col2_dadda4_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col3_dadda4_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col4_dadda4_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col5_dadda4_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col6_dadda4_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col7_dadda4_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col8_dadda4_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col9_dadda4_OUT:		STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col10_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col11_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col12_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col13_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col14_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col15_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col16_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col17_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col18_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col19_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col20_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col21_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col22_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col23_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col24_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col25_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col26_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col27_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col28_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col29_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col30_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col31_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col32_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col33_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col34_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col35_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col36_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col37_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col38_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col39_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col40_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col41_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col42_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col43_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col44_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col45_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col46_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col47_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col48_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col49_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col50_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col51_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col52_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col53_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col54_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col55_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col56_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col57_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col58_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col59_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col60_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col61_dadda4_OUT:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL col62_dadda4_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col63_dadda4_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col64_dadda4_OUT:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col0_dadda5_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col1_dadda5_OUT:		STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col2_dadda5_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col3_dadda5_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col4_dadda5_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col5_dadda5_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col6_dadda5_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col7_dadda5_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col8_dadda5_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col9_dadda5_OUT:		STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col10_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col11_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col12_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col13_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col14_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col15_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col16_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col17_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col18_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col19_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col20_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col21_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col22_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col23_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col24_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col25_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col26_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col27_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col28_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col29_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col30_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col31_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col32_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col33_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col34_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col35_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col36_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col37_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col38_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col39_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col40_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col41_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col42_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col43_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col44_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col45_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col46_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col47_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col48_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col49_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col50_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col51_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col52_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col53_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col54_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col55_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col56_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col57_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col58_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col59_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col60_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col61_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col62_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col63_dadda5_OUT:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL col64_dadda5_OUT:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col0_dadda6_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col1_dadda6_OUT:		STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL col2_dadda6_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col3_dadda6_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col4_dadda6_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col5_dadda6_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col6_dadda6_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col7_dadda6_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col8_dadda6_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col9_dadda6_OUT:		STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col10_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col11_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col12_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col13_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col14_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col15_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col16_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col17_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col18_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col19_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col20_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col21_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col22_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col23_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col24_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col25_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col26_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col27_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col28_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col29_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col30_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col31_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col32_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col33_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col34_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col35_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col36_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col37_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col38_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col39_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col40_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col41_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col42_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col43_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col44_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col45_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col46_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col47_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col48_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col49_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col50_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col51_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col52_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col53_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col54_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col55_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col56_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col57_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col58_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col59_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col60_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col61_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col62_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col63_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL col64_dadda6_OUT:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL operand1:			STD_LOGIC_VECTOR (64 DOWNTO 0);
	SIGNAL operand2:			STD_LOGIC_VECTOR (64 DOWNTO 0);
	SIGNAL res:					STD_LOGIC_VECTOR (64 DOWNTO 0);

	BEGIN
		-- DATAPATH --------------------------------------------------------------------------------------------------
		-- Partial products generation -------------------------------------------------------------------------------
        pp: partprod PORT MAP 	(in_A,
								in_B,
								P0,
								P1,
								P2,
								P3,
								P4,
								P5,
								P6,
								P7,
								P8,
								P9,
								P10,
								P11,
								P12,
								P13,
								P14,
								P15,
								P16,
                        	   	S0,
								S1,
								S2,
								S3,
								S4,
								S5,
								S6,
								S7,
								S8,
								S9,
								S10,
								S11,
								S12,
								S13,
								S14,
								S15);

		-- From rows to columns: generation of the inputs of the dadda tree -----------------------------------------
		col0(0) <= P0(0);
		col0(1) <= S0;
		col1(0) <= P0(1);
		col2(0) <= P0(2);
		col2(1) <= P1(0);
		col2(2) <= S1;
		col3(0) <= P0(3);
		col3(1) <= P1(1);
		col4(0) <= P0(4);
		col4(1) <= P1(2);
		col4(2) <= P2(0);
		col4(3) <= S2;
		col5(0) <= P0(5);
		col5(1) <= P1(3);
		col5(2) <= P2(1);
		col6(0) <= P0(6);
		col6(1) <= P1(4);
		col6(2) <= P2(2);
		col6(3) <= P3(0);
		col6(4) <= S3;
		col7(0) <= P0(7);
		col7(1) <= P1(5);
		col7(2) <= P2(3);
		col7(3) <= P3(1);
		col8(0) <= P0(8);
		col8(1) <= P1(6);
		col8(2) <= P2(4);
		col8(3) <= P3(2);
		col8(4) <= P4(0);
		col8(5) <= S4;
		col9(0) <= P0(9);
		col9(1) <= P1(7);
		col9(2) <= P2(5);
		col9(3) <= P3(3);
		col9(4) <= P4(1);
		col10(0) <= P0(10);
		col10(1) <= P1(8);
		col10(2) <= P2(6);
		col10(3) <= P3(4);
		col10(4) <= P4(2);
		col10(5) <= P5(0);
		col10(6) <= S5;
		col11(0) <= P0(11);
		col11(1) <= P1(9);
		col11(2) <= P2(7);
		col11(3) <= P3(5);
		col11(4) <= P4(3);
		col11(5) <= P5(1);
		col12(0) <= P0(12);
		col12(1) <= P1(10);
		col12(2) <= P2(8);
		col12(3) <= P3(6);
		col12(4) <= P4(4);
		col12(5) <= P5(2);
		col12(6) <= P6(0);
		col12(7) <= S6;
		col13(0) <= P0(13);
		col13(1) <= P1(11);
		col13(2) <= P2(9);
		col13(3) <= P3(7);
		col13(4) <= P4(5);
		col13(5) <= P5(3);
		col13(6) <= P6(1);
		col14(0) <= P0(14);
		col14(1) <= P1(12);
		col14(2) <= P2(10);
		col14(3) <= P3(8);
		col14(4) <= P4(6);
		col14(5) <= P5(4);
		col14(6) <= P6(2);
		col14(7) <= P7(0);
		col14(8) <= S7;
		col15(0) <= P0(15);
		col15(1) <= P1(13);
		col15(2) <= P2(11);
		col15(3) <= P3(9);
		col15(4) <= P4(7);
		col15(5) <= P5(5);
		col15(6) <= P6(3);
		col15(7) <= P7(1);
		col16(0) <= P0(16);
		col16(1) <= P1(14);
		col16(2) <= P2(12);
		col16(3) <= P3(10);
		col16(4) <= P4(8);
		col16(5) <= P5(6);
		col16(6) <= P6(4);
		col16(7) <= P7(2);
		col16(8) <= P8(0);
		col16(9) <= S8;
		col17(0) <= P0(17);
		col17(1) <= P1(15);
		col17(2) <= P2(13);
		col17(3) <= P3(11);
		col17(4) <= P4(9);
		col17(5) <= P5(7);
		col17(6) <= P6(5);
		col17(7) <= P7(3);
		col17(8) <= P8(1);
		col18(0) <= P0(18);
		col18(1) <= P1(16);
		col18(2) <= P2(14);
		col18(3) <= P3(12);
		col18(4) <= P4(10);
		col18(5) <= P5(8);
		col18(6) <= P6(6);
		col18(7) <= P7(4);
		col18(8) <= P8(2);
		col18(9) <= P9(0);
		col18(10) <= S9;
		col19(0) <= P0(19);
		col19(1) <= P1(17);
		col19(2) <= P2(15);
		col19(3) <= P3(13);
		col19(4) <= P4(11);
		col19(5) <= P5(9);
		col19(6) <= P6(7);
		col19(7) <= P7(5);
		col19(8) <= P8(3);
		col19(9) <= P9(1);
		col20(0) <= P0(20);
		col20(1) <= P1(18);
		col20(2) <= P2(16);
		col20(3) <= P3(14);
		col20(4) <= P4(12);
		col20(5) <= P5(10);
		col20(6) <= P6(8);
		col20(7) <= P7(6);
		col20(8) <= P8(4);
		col20(9) <= P9(2);
		col20(10) <= P10(0);
		col20(11) <= S10;
		col21(0) <= P0(21);
		col21(1) <= P1(19);
		col21(2) <= P2(17);
		col21(3) <= P3(15);
		col21(4) <= P4(13);
		col21(5) <= P5(11);
		col21(6) <= P6(9);
		col21(7) <= P7(7);
		col21(8) <= P8(5);
		col21(9) <= P9(3);
		col21(10) <= P10(1);
		col22(0) <= P0(22);
		col22(1) <= P1(20);
		col22(2) <= P2(18);
		col22(3) <= P3(16);
		col22(4) <= P4(14);
		col22(5) <= P5(12);
		col22(6) <= P6(10);
		col22(7) <= P7(8);
		col22(8) <= P8(6);
		col22(9) <= P9(4);
		col22(10) <= P10(2);
		col22(11) <= P11(0);
		col22(12) <= S11;
		col23(0) <= P0(23);
		col23(1) <= P1(21);
		col23(2) <= P2(19);
		col23(3) <= P3(17);
		col23(4) <= P4(15);
		col23(5) <= P5(13);
		col23(6) <= P6(11);
		col23(7) <= P7(9);
		col23(8) <= P8(7);
		col23(9) <= P9(5);
		col23(10) <= P10(3);
		col23(11) <= P11(1);
		col24(0) <= P0(24);
		col24(1) <= P1(22);
		col24(2) <= P2(20);
		col24(3) <= P3(18);
		col24(4) <= P4(16);
		col24(5) <= P5(14);
		col24(6) <= P6(12);
		col24(7) <= P7(10);
		col24(8) <= P8(8);
		col24(9) <= P9(6);
		col24(10) <= P10(4);
		col24(11) <= P11(2);
		col24(12) <= P12(0);
		col24(13) <= S12;
		col25(0) <= P0(25);
		col25(1) <= P1(23);
		col25(2) <= P2(21);
		col25(3) <= P3(19);
		col25(4) <= P4(17);
		col25(5) <= P5(15);
		col25(6) <= P6(13);
		col25(7) <= P7(11);
		col25(8) <= P8(9);
		col25(9) <= P9(7);
		col25(10) <= P10(5);
		col25(11) <= P11(3);
		col25(12) <= P12(1);
		col26(0) <= P0(26);
		col26(1) <= P1(24);
		col26(2) <= P2(22);
		col26(3) <= P3(20);
		col26(4) <= P4(18);
		col26(5) <= P5(16);
		col26(6) <= P6(14);
		col26(7) <= P7(12);
		col26(8) <= P8(10);
		col26(9) <= P9(8);
		col26(10) <= P10(6);
		col26(11) <= P11(4);
		col26(12) <= P12(2);
		col26(13) <= P13(0);
		col26(14) <= S13;
		col27(0) <= P0(27);
		col27(1) <= P1(25);
		col27(2) <= P2(23);
		col27(3) <= P3(21);
		col27(4) <= P4(19);
		col27(5) <= P5(17);
		col27(6) <= P6(15);
		col27(7) <= P7(13);
		col27(8) <= P8(11);
		col27(9) <= P9(9);
		col27(10) <= P10(7);
		col27(11) <= P11(5);
		col27(12) <= P12(3);
		col27(13) <= P13(1);
		col28(0) <= P0(28);
		col28(1) <= P1(26);
		col28(2) <= P2(24);
		col28(3) <= P3(22);
		col28(4) <= P4(20);
		col28(5) <= P5(18);
		col28(6) <= P6(16);
		col28(7) <= P7(14);
		col28(8) <= P8(12);
		col28(9) <= P9(10);
		col28(10) <= P10(8);
		col28(11) <= P11(6);
		col28(12) <= P12(4);
		col28(13) <= P13(2);
		col28(14) <= P14(0);
		col28(15) <= S14;
		col29(0) <= P0(29);
		col29(1) <= P1(27);
		col29(2) <= P2(25);
		col29(3) <= P3(23);
		col29(4) <= P4(21);
		col29(5) <= P5(19);
		col29(6) <= P6(17);
		col29(7) <= P7(15);
		col29(8) <= P8(13);
		col29(9) <= P9(11);
		col29(10) <= P10(9);
		col29(11) <= P11(7);
		col29(12) <= P12(5);
		col29(13) <= P13(3);
		col29(14) <= P14(1);
		col30(0) <= P0(30);
		col30(1) <= P1(28);
		col30(2) <= P2(26);
		col30(3) <= P3(24);
		col30(4) <= P4(22);
		col30(5) <= P5(20);
		col30(6) <= P6(18);
		col30(7) <= P7(16);
		col30(8) <= P8(14);
		col30(9) <= P9(12);
		col30(10) <= P10(10);
		col30(11) <= P11(8);
		col30(12) <= P12(6);
		col30(13) <= P13(4);
		col30(14) <= P14(2);
		col30(15) <= P15(0);
		col30(16) <= S15;
		col31(0) <= P0(31);
		col31(1) <= P1(29);
		col31(2) <= P2(27);
		col31(3) <= P3(25);
		col31(4) <= P4(23);
		col31(5) <= P5(21);
		col31(6) <= P6(19);
		col31(7) <= P7(17);
		col31(8) <= P8(15);
		col31(9) <= P9(13);
		col31(10) <= P10(11);
		col31(11) <= P11(9);
		col31(12) <= P12(7);
		col31(13) <= P13(5);
		col31(14) <= P14(3);
		col31(15) <= P15(1);
		col32(0) <= P0(32);
		col32(1) <= P1(30);
		col32(2) <= P2(28);
		col32(3) <= P3(26);
		col32(4) <= P4(24);
		col32(5) <= P5(22);
		col32(6) <= P6(20);
		col32(7) <= P7(18);
		col32(8) <= P8(16);
		col32(9) <= P9(14);
		col32(10) <= P10(12);
		col32(11) <= P11(10);
		col32(12) <= P12(8);
		col32(13) <= P13(6);
		col32(14) <= P14(4);
		col32(15) <= P15(2);
		col32(16) <= P16(0);
		col33(0) <= S0;
		col33(1) <= P1(31);
		col33(2) <= P2(29);
		col33(3) <= P3(27);
		col33(4) <= P4(25);
		col33(5) <= P5(23);
		col33(6) <= P6(21);
		col33(7) <= P7(19);
		col33(8) <= P8(17);
		col33(9) <= P9(15);
		col33(10) <= P10(13);
		col33(11) <= P11(11);
		col33(12) <= P12(9);
		col33(13) <= P13(7);
		col33(14) <= P14(5);
		col33(15) <= P15(3);
		col33(16) <= P16(1);
		col34(0) <= S0;
		col34(1) <= P1(32);
		col34(2) <= P2(30);
		col34(3) <= P3(28);
		col34(4) <= P4(26);
		col34(5) <= P5(24);
		col34(6) <= P6(22);
		col34(7) <= P7(20);
		col34(8) <= P8(18);
		col34(9) <= P9(16);
		col34(10) <= P10(14);
		col34(11) <= P11(12);
		col34(12) <= P12(10);
		col34(13) <= P13(8);
		col34(14) <= P14(6);
		col34(15) <= P15(4);
		col34(16) <= P16(2);
		col35(0) <= NOT(S0);
		col35(1) <= NOT(S1);
		col35(2) <= P2(31);
		col35(3) <= P3(29);
		col35(4) <= P4(27);
		col35(5) <= P5(25);
		col35(6) <= P6(23);
		col35(7) <= P7(21);
		col35(8) <= P8(19);
		col35(9) <= P9(17);
		col35(10) <= P10(15);
		col35(11) <= P11(13);
		col35(12) <= P12(11);
		col35(13) <= P13(9);
		col35(14) <= P14(7);
		col35(15) <= P15(5);
		col35(16) <= P16(3);
		col36(0) <= '1';
		col36(1) <= P2(32);
		col36(2) <= P3(30);
		col36(3) <= P4(28);
		col36(4) <= P5(26);
		col36(5) <= P6(24);
		col36(6) <= P7(22);
		col36(7) <= P8(20);
		col36(8) <= P9(18);
		col36(9) <= P10(16);
		col36(10) <= P11(14);
		col36(11) <= P12(12);
		col36(12) <= P13(10);
		col36(13) <= P14(8);
		col36(14) <= P15(6);
		col36(15) <= P16(4);
		col37(0) <= NOT(S2);
		col37(1) <= P3(31);
		col37(2) <= P4(29);
		col37(3) <= P5(27);
		col37(4) <= P6(25);
		col37(5) <= P7(23);
		col37(6) <= P8(21);
		col37(7) <= P9(19);
		col37(8) <= P10(17);
		col37(9) <= P11(15);
		col37(10) <= P12(13);
		col37(11) <= P13(11);
		col37(12) <= P14(9);
		col37(13) <= P15(7);
		col37(14) <= P16(5);
		col38(0) <= '1';
		col38(1) <= P3(32);
		col38(2) <= P4(30);
		col38(3) <= P5(28);
		col38(4) <= P6(26);
		col38(5) <= P7(24);
		col38(6) <= P8(22);
		col38(7) <= P9(20);
		col38(8) <= P10(18);
		col38(9) <= P11(16);
		col38(10) <= P12(14);
		col38(11) <= P13(12);
		col38(12) <= P14(10);
		col38(13) <= P15(8);
		col38(14) <= P16(6);
		col39(0) <= NOT(S3);
		col39(1) <= P4(31);
		col39(2) <= P5(29);
		col39(3) <= P6(27);
		col39(4) <= P7(25);
		col39(5) <= P8(23);
		col39(6) <= P9(21);
		col39(7) <= P10(19);
		col39(8) <= P11(17);
		col39(9) <= P12(15);
		col39(10) <= P13(13);
		col39(11) <= P14(11);
		col39(12) <= P15(9);
		col39(13) <= P16(7);
		col40(0) <= '1';
		col40(1) <= P4(32);
		col40(2) <= P5(30);
		col40(3) <= P6(28);
		col40(4) <= P7(26);
		col40(5) <= P8(24);
		col40(6) <= P9(22);
		col40(7) <= P10(20);
		col40(8) <= P11(18);
		col40(9) <= P12(16);
		col40(10) <= P13(14);
		col40(11) <= P14(12);
		col40(12) <= P15(10);
		col40(13) <= P16(8);
		col41(0) <= NOT(S4);
		col41(1) <= P5(31);
		col41(2) <= P6(29);
		col41(3) <= P7(27);
		col41(4) <= P8(25);
		col41(5) <= P9(23);
		col41(6) <= P10(21);
		col41(7) <= P11(19);
		col41(8) <= P12(17);
		col41(9) <= P13(15);
		col41(10) <= P14(13);
		col41(11) <= P15(11);
		col41(12) <= P16(9);
		col42(0) <= '1';
		col42(1) <= P5(32);
		col42(2) <= P6(30);
		col42(3) <= P7(28);
		col42(4) <= P8(26);
		col42(5) <= P9(24);
		col42(6) <= P10(22);
		col42(7) <= P11(20);
		col42(8) <= P12(18);
		col42(9) <= P13(16);
		col42(10) <= P14(14);
		col42(11) <= P15(12);
		col42(12) <= P16(10);
		col43(0) <= NOT(S5);
		col43(1) <= P6(31);
		col43(2) <= P7(29);
		col43(3) <= P8(27);
		col43(4) <= P9(25);
		col43(5) <= P10(23);
		col43(6) <= P11(21);
		col43(7) <= P12(19);
		col43(8) <= P13(17);
		col43(9) <= P14(15);
		col43(10) <= P15(13);
		col43(11) <= P16(11);
		col44(0) <= '1';
		col44(1) <= P6(32);
		col44(2) <= P7(30);
		col44(3) <= P8(28);
		col44(4) <= P9(26);
		col44(5) <= P10(24);
		col44(6) <= P11(22);
		col44(7) <= P12(20);
		col44(8) <= P13(18);
		col44(9) <= P14(16);
		col44(10) <= P15(14);
		col44(11) <= P16(12);
		col45(0) <= NOT(S6);
		col45(1) <= P7(31);
		col45(2) <= P8(29);
		col45(3) <= P9(27);
		col45(4) <= P10(25);
		col45(5) <= P11(23);
		col45(6) <= P12(21);
		col45(7) <= P13(19);
		col45(8) <= P14(17);
		col45(9) <= P15(15);
		col45(10) <= P16(13);
		col46(0) <= '1';
		col46(1) <= P7(32);
		col46(2) <= P8(30);
		col46(3) <= P9(28);
		col46(4) <= P10(26);
		col46(5) <= P11(24);
		col46(6) <= P12(22);
		col46(7) <= P13(20);
		col46(8) <= P14(18);
		col46(9) <= P15(16);
		col46(10) <= P16(14);
		col47(0) <= NOT(S7);
		col47(1) <= P8(31);
		col47(2) <= P9(29);
		col47(3) <= P10(27);
		col47(4) <= P11(25);
		col47(5) <= P12(23);
		col47(6) <= P13(21);
		col47(7) <= P14(19);
		col47(8) <= P15(17);
		col47(9) <= P16(15);
		col48(0) <= '1';
		col48(1) <= P8(32);
		col48(2) <= P9(30);
		col48(3) <= P10(28);
		col48(4) <= P11(26);
		col48(5) <= P12(24);
		col48(6) <= P13(22);
		col48(7) <= P14(20);
		col48(8) <= P15(18);
		col48(9) <= P16(16);
		col49(0) <= NOT(S8);
		col49(1) <= P9(31);
		col49(2) <= P10(29);
		col49(3) <= P11(27);
		col49(4) <= P12(25);
		col49(5) <= P13(23);
		col49(6) <= P14(21);
		col49(7) <= P15(19);
		col49(8) <= P16(17);
		col50(0) <= '1';
		col50(1) <= P9(32);
		col50(2) <= P10(30);
		col50(3) <= P11(28);
		col50(4) <= P12(26);
		col50(5) <= P13(24);
		col50(6) <= P14(22);
		col50(7) <= P15(20);
		col50(8) <= P16(18);
		col51(0) <= NOT(S9);
		col51(1) <= P10(31);
		col51(2) <= P11(29);
		col51(3) <= P12(27);
		col51(4) <= P13(25);
		col51(5) <= P14(23);
		col51(6) <= P15(21);
		col51(7) <= P16(19);
		col52(0) <= '1';
		col52(1) <= P10(32);
		col52(2) <= P11(30);
		col52(3) <= P12(28);
		col52(4) <= P13(26);
		col52(5) <= P14(24);
		col52(6) <= P15(22);
		col52(7) <= P16(20);
		col53(0) <= NOT(S10);
		col53(1) <= P11(31);
		col53(2) <= P12(29);
		col53(3) <= P13(27);
		col53(4) <= P14(25);
		col53(5) <= P15(23);
		col53(6) <= P16(21);
		col54(0) <= '1';
		col54(1) <= P11(32);
		col54(2) <= P12(30);
		col54(3) <= P13(28);
		col54(4) <= P14(26);
		col54(5) <= P15(24);
		col54(6) <= P16(22);
		col55(0) <= NOT(S11);
		col55(1) <= P12(31);
		col55(2) <= P13(29);
		col55(3) <= P14(27);
		col55(4) <= P15(25);
		col55(5) <= P16(23);
		col56(0) <= '1';
		col56(1) <= P12(32);
		col56(2) <= P13(30);
		col56(3) <= P14(28);
		col56(4) <= P15(26);
		col56(5) <= P16(24);
		col57(0) <= NOT(S12);
		col57(1) <= P13(31);
		col57(2) <= P14(29);
		col57(3) <= P15(27);
		col57(4) <= P16(25);
		col58(0) <= '1';
		col58(1) <= P13(32);
		col58(2) <= P14(30);
		col58(3) <= P15(28);
		col58(4) <= P16(26);
		col59(0) <= NOT(S13);
		col59(1) <= P14(31);
		col59(2) <= P15(29);
		col59(3) <= P16(27);
		col60(0) <= '1';
		col60(1) <= P14(32);
		col60(2) <= P15(30);
		col60(3) <= P16(28);
		col61(0) <= NOT(S14);
		col61(1) <= P15(31);
		col61(2) <= P16(29);
		col62(0) <= '1';
		col62(1) <= P15(32);
		col62(2) <= P16(30);
		col63(0) <= NOT(S15);
		col63(1) <= P16(31);
		col64(0) <= P16(32);

		-- Dadda tree ---------------------------------------------------------------------------------------------
		dd1: dadda_stage1 PORT MAP (col0,
									col1,
									col2,
									col3,
									col4,
									col5,
									col6,
									col7,
									col8,
									col9,
									col10,
									col11,
									col12,
									col13,
									col14,
									col15,
									col16,
									col17,
									col18,
									col19,
									col20,
									col21,
									col22,
									col23,
									col24,
									col25,
									col26,
									col27,
									col28,
									col29,
									col30,
									col31,
									col32,
									col33,
									col34,
									col35,
									col36,
									col37,
									col38,
									col39,
									col40,
									col41,
									col42,
									col43,
									col44,
									col45,
									col46,
									col47,
									col48,
									col49,
									col50,
									col51,
									col52,
									col53,
									col54,
									col55,
									col56,
									col57,
									col58,
									col59,
									col60,
									col61,
									col62,
									col63,
									col64,
									col0_dadda1_OUT,
									col1_dadda1_OUT,
									col2_dadda1_OUT,
									col3_dadda1_OUT,
									col4_dadda1_OUT,
									col5_dadda1_OUT,
									col6_dadda1_OUT,
									col7_dadda1_OUT,
									col8_dadda1_OUT,
									col9_dadda1_OUT,
									col10_dadda1_OUT,
									col11_dadda1_OUT,
									col12_dadda1_OUT,
									col13_dadda1_OUT,
									col14_dadda1_OUT,
									col15_dadda1_OUT,
									col16_dadda1_OUT,
									col17_dadda1_OUT,
									col18_dadda1_OUT,
									col19_dadda1_OUT,
									col20_dadda1_OUT,
									col21_dadda1_OUT,
									col22_dadda1_OUT,
									col23_dadda1_OUT,
									col24_dadda1_OUT,
									col25_dadda1_OUT,
									col26_dadda1_OUT,
									col27_dadda1_OUT,
									col28_dadda1_OUT,
									col29_dadda1_OUT,
									col30_dadda1_OUT,
									col31_dadda1_OUT,
									col32_dadda1_OUT,
									col33_dadda1_OUT,
									col34_dadda1_OUT,
									col35_dadda1_OUT,
									col36_dadda1_OUT,
									col37_dadda1_OUT,
									col38_dadda1_OUT,
									col39_dadda1_OUT,
									col40_dadda1_OUT,
									col41_dadda1_OUT,
									col42_dadda1_OUT,
									col43_dadda1_OUT,
									col44_dadda1_OUT,
									col45_dadda1_OUT,
									col46_dadda1_OUT,
									col47_dadda1_OUT,
									col48_dadda1_OUT,
									col49_dadda1_OUT,
									col50_dadda1_OUT,
									col51_dadda1_OUT,
									col52_dadda1_OUT,
									col53_dadda1_OUT,
									col54_dadda1_OUT,
									col55_dadda1_OUT,
									col56_dadda1_OUT,
									col57_dadda1_OUT,
									col58_dadda1_OUT,
									col59_dadda1_OUT,
									col60_dadda1_OUT,
									col61_dadda1_OUT,
									col62_dadda1_OUT,
									col63_dadda1_OUT,
									col64_dadda1_OUT);
		dd2: dadda_stage2 PORT MAP (col0_dadda1_OUT,
									col1_dadda1_OUT,
									col2_dadda1_OUT,
									col3_dadda1_OUT,
									col4_dadda1_OUT,
									col5_dadda1_OUT,
									col6_dadda1_OUT,
									col7_dadda1_OUT,
									col8_dadda1_OUT,
									col9_dadda1_OUT,
									col10_dadda1_OUT,
									col11_dadda1_OUT,
									col12_dadda1_OUT,
									col13_dadda1_OUT,
									col14_dadda1_OUT,
									col15_dadda1_OUT,
									col16_dadda1_OUT,
									col17_dadda1_OUT,
									col18_dadda1_OUT,
									col19_dadda1_OUT,
									col20_dadda1_OUT,
									col21_dadda1_OUT,
									col22_dadda1_OUT,
									col23_dadda1_OUT,
									col24_dadda1_OUT,
									col25_dadda1_OUT,
									col26_dadda1_OUT,
									col27_dadda1_OUT,
									col28_dadda1_OUT,
									col29_dadda1_OUT,
									col30_dadda1_OUT,
									col31_dadda1_OUT,
									col32_dadda1_OUT,
									col33_dadda1_OUT,
									col34_dadda1_OUT,
									col35_dadda1_OUT,
									col36_dadda1_OUT,
									col37_dadda1_OUT,
									col38_dadda1_OUT,
									col39_dadda1_OUT,
									col40_dadda1_OUT,
									col41_dadda1_OUT,
									col42_dadda1_OUT,
									col43_dadda1_OUT,
									col44_dadda1_OUT,
									col45_dadda1_OUT,
									col46_dadda1_OUT,
									col47_dadda1_OUT,
									col48_dadda1_OUT,
									col49_dadda1_OUT,
									col50_dadda1_OUT,
									col51_dadda1_OUT,
									col52_dadda1_OUT,
									col53_dadda1_OUT,
									col54_dadda1_OUT,
									col55_dadda1_OUT,
									col56_dadda1_OUT,
									col57_dadda1_OUT,
									col58_dadda1_OUT,
									col59_dadda1_OUT,
									col60_dadda1_OUT,
									col61_dadda1_OUT,
									col62_dadda1_OUT,
									col63_dadda1_OUT,
									col64_dadda1_OUT,
									col0_dadda2_OUT,
									col1_dadda2_OUT,
									col2_dadda2_OUT,
									col3_dadda2_OUT,
									col4_dadda2_OUT,
									col5_dadda2_OUT,
									col6_dadda2_OUT,
									col7_dadda2_OUT,
									col8_dadda2_OUT,
									col9_dadda2_OUT,
									col10_dadda2_OUT,
									col11_dadda2_OUT,
									col12_dadda2_OUT,
									col13_dadda2_OUT,
									col14_dadda2_OUT,
									col15_dadda2_OUT,
									col16_dadda2_OUT,
									col17_dadda2_OUT,
									col18_dadda2_OUT,
									col19_dadda2_OUT,
									col20_dadda2_OUT,
									col21_dadda2_OUT,
									col22_dadda2_OUT,
									col23_dadda2_OUT,
									col24_dadda2_OUT,
									col25_dadda2_OUT,
									col26_dadda2_OUT,
									col27_dadda2_OUT,
									col28_dadda2_OUT,
									col29_dadda2_OUT,
									col30_dadda2_OUT,
									col31_dadda2_OUT,
									col32_dadda2_OUT,
									col33_dadda2_OUT,
									col34_dadda2_OUT,
									col35_dadda2_OUT,
									col36_dadda2_OUT,
									col37_dadda2_OUT,
									col38_dadda2_OUT,
									col39_dadda2_OUT,
									col40_dadda2_OUT,
									col41_dadda2_OUT,
									col42_dadda2_OUT,
									col43_dadda2_OUT,
									col44_dadda2_OUT,
									col45_dadda2_OUT,
									col46_dadda2_OUT,
									col47_dadda2_OUT,
									col48_dadda2_OUT,
									col49_dadda2_OUT,
									col50_dadda2_OUT,
									col51_dadda2_OUT,
									col52_dadda2_OUT,
									col53_dadda2_OUT,
									col54_dadda2_OUT,
									col55_dadda2_OUT,
									col56_dadda2_OUT,
									col57_dadda2_OUT,
									col58_dadda2_OUT,
									col59_dadda2_OUT,
									col60_dadda2_OUT,
									col61_dadda2_OUT,
									col62_dadda2_OUT,
									col63_dadda2_OUT,
									col64_dadda2_OUT);
		dd3: dadda_stage3 PORT MAP (col0_dadda2_OUT,
									col1_dadda2_OUT,
									col2_dadda2_OUT,
									col3_dadda2_OUT,
									col4_dadda2_OUT,
									col5_dadda2_OUT,
									col6_dadda2_OUT,
									col7_dadda2_OUT,
									col8_dadda2_OUT,
									col9_dadda2_OUT,
									col10_dadda2_OUT,
									col11_dadda2_OUT,
									col12_dadda2_OUT,
									col13_dadda2_OUT,
									col14_dadda2_OUT,
									col15_dadda2_OUT,
									col16_dadda2_OUT,
									col17_dadda2_OUT,
									col18_dadda2_OUT,
									col19_dadda2_OUT,
									col20_dadda2_OUT,
									col21_dadda2_OUT,
									col22_dadda2_OUT,
									col23_dadda2_OUT,
									col24_dadda2_OUT,
									col25_dadda2_OUT,
									col26_dadda2_OUT,
									col27_dadda2_OUT,
									col28_dadda2_OUT,
									col29_dadda2_OUT,
									col30_dadda2_OUT,
									col31_dadda2_OUT,
									col32_dadda2_OUT,
									col33_dadda2_OUT,
									col34_dadda2_OUT,
									col35_dadda2_OUT,
									col36_dadda2_OUT,
									col37_dadda2_OUT,
									col38_dadda2_OUT,
									col39_dadda2_OUT,
									col40_dadda2_OUT,
									col41_dadda2_OUT,
									col42_dadda2_OUT,
									col43_dadda2_OUT,
									col44_dadda2_OUT,
									col45_dadda2_OUT,
									col46_dadda2_OUT,
									col47_dadda2_OUT,
									col48_dadda2_OUT,
									col49_dadda2_OUT,
									col50_dadda2_OUT,
									col51_dadda2_OUT,
									col52_dadda2_OUT,
									col53_dadda2_OUT,
									col54_dadda2_OUT,
									col55_dadda2_OUT,
									col56_dadda2_OUT,
									col57_dadda2_OUT,
									col58_dadda2_OUT,
									col59_dadda2_OUT,
									col60_dadda2_OUT,
									col61_dadda2_OUT,
									col62_dadda2_OUT,
									col63_dadda2_OUT,
									col64_dadda2_OUT,
									col0_dadda3_OUT,
									col1_dadda3_OUT,
									col2_dadda3_OUT,
									col3_dadda3_OUT,
									col4_dadda3_OUT,
									col5_dadda3_OUT,
									col6_dadda3_OUT,
									col7_dadda3_OUT,
									col8_dadda3_OUT,
									col9_dadda3_OUT,
									col10_dadda3_OUT,
									col11_dadda3_OUT,
									col12_dadda3_OUT,
									col13_dadda3_OUT,
									col14_dadda3_OUT,
									col15_dadda3_OUT,
									col16_dadda3_OUT,
									col17_dadda3_OUT,
									col18_dadda3_OUT,
									col19_dadda3_OUT,
									col20_dadda3_OUT,
									col21_dadda3_OUT,
									col22_dadda3_OUT,
									col23_dadda3_OUT,
									col24_dadda3_OUT,
									col25_dadda3_OUT,
									col26_dadda3_OUT,
									col27_dadda3_OUT,
									col28_dadda3_OUT,
									col29_dadda3_OUT,
									col30_dadda3_OUT,
									col31_dadda3_OUT,
									col32_dadda3_OUT,
									col33_dadda3_OUT,
									col34_dadda3_OUT,
									col35_dadda3_OUT,
									col36_dadda3_OUT,
									col37_dadda3_OUT,
									col38_dadda3_OUT,
									col39_dadda3_OUT,
									col40_dadda3_OUT,
									col41_dadda3_OUT,
									col42_dadda3_OUT,
									col43_dadda3_OUT,
									col44_dadda3_OUT,
									col45_dadda3_OUT,
									col46_dadda3_OUT,
									col47_dadda3_OUT,
									col48_dadda3_OUT,
									col49_dadda3_OUT,
									col50_dadda3_OUT,
									col51_dadda3_OUT,
									col52_dadda3_OUT,
									col53_dadda3_OUT,
									col54_dadda3_OUT,
									col55_dadda3_OUT,
									col56_dadda3_OUT,
									col57_dadda3_OUT,
									col58_dadda3_OUT,
									col59_dadda3_OUT,
									col60_dadda3_OUT,
									col61_dadda3_OUT,
									col62_dadda3_OUT,
									col63_dadda3_OUT,
									col64_dadda3_OUT);
		dd4: dadda_stage4 PORT MAP (col0_dadda3_OUT,
									col1_dadda3_OUT,
									col2_dadda3_OUT,
									col3_dadda3_OUT,
									col4_dadda3_OUT,
									col5_dadda3_OUT,
									col6_dadda3_OUT,
									col7_dadda3_OUT,
									col8_dadda3_OUT,
									col9_dadda3_OUT,
									col10_dadda3_OUT,
									col11_dadda3_OUT,
									col12_dadda3_OUT,
									col13_dadda3_OUT,
									col14_dadda3_OUT,
									col15_dadda3_OUT,
									col16_dadda3_OUT,
									col17_dadda3_OUT,
									col18_dadda3_OUT,
									col19_dadda3_OUT,
									col20_dadda3_OUT,
									col21_dadda3_OUT,
									col22_dadda3_OUT,
									col23_dadda3_OUT,
									col24_dadda3_OUT,
									col25_dadda3_OUT,
									col26_dadda3_OUT,
									col27_dadda3_OUT,
									col28_dadda3_OUT,
									col29_dadda3_OUT,
									col30_dadda3_OUT,
									col31_dadda3_OUT,
									col32_dadda3_OUT,
									col33_dadda3_OUT,
									col34_dadda3_OUT,
									col35_dadda3_OUT,
									col36_dadda3_OUT,
									col37_dadda3_OUT,
									col38_dadda3_OUT,
									col39_dadda3_OUT,
									col40_dadda3_OUT,
									col41_dadda3_OUT,
									col42_dadda3_OUT,
									col43_dadda3_OUT,
									col44_dadda3_OUT,
									col45_dadda3_OUT,
									col46_dadda3_OUT,
									col47_dadda3_OUT,
									col48_dadda3_OUT,
									col49_dadda3_OUT,
									col50_dadda3_OUT,
									col51_dadda3_OUT,
									col52_dadda3_OUT,
									col53_dadda3_OUT,
									col54_dadda3_OUT,
									col55_dadda3_OUT,
									col56_dadda3_OUT,
									col57_dadda3_OUT,
									col58_dadda3_OUT,
									col59_dadda3_OUT,
									col60_dadda3_OUT,
									col61_dadda3_OUT,
									col62_dadda3_OUT,
									col63_dadda3_OUT,
									col64_dadda3_OUT,
									col0_dadda4_OUT,
									col1_dadda4_OUT,
									col2_dadda4_OUT,
									col3_dadda4_OUT,
									col4_dadda4_OUT,
									col5_dadda4_OUT,
									col6_dadda4_OUT,
									col7_dadda4_OUT,
									col8_dadda4_OUT,
									col9_dadda4_OUT,
									col10_dadda4_OUT,
									col11_dadda4_OUT,
									col12_dadda4_OUT,
									col13_dadda4_OUT,
									col14_dadda4_OUT,
									col15_dadda4_OUT,
									col16_dadda4_OUT,
									col17_dadda4_OUT,
									col18_dadda4_OUT,
									col19_dadda4_OUT,
									col20_dadda4_OUT,
									col21_dadda4_OUT,
									col22_dadda4_OUT,
									col23_dadda4_OUT,
									col24_dadda4_OUT,
									col25_dadda4_OUT,
									col26_dadda4_OUT,
									col27_dadda4_OUT,
									col28_dadda4_OUT,
									col29_dadda4_OUT,
									col30_dadda4_OUT,
									col31_dadda4_OUT,
									col32_dadda4_OUT,
									col33_dadda4_OUT,
									col34_dadda4_OUT,
									col35_dadda4_OUT,
									col36_dadda4_OUT,
									col37_dadda4_OUT,
									col38_dadda4_OUT,
									col39_dadda4_OUT,
									col40_dadda4_OUT,
									col41_dadda4_OUT,
									col42_dadda4_OUT,
									col43_dadda4_OUT,
									col44_dadda4_OUT,
									col45_dadda4_OUT,
									col46_dadda4_OUT,
									col47_dadda4_OUT,
									col48_dadda4_OUT,
									col49_dadda4_OUT,
									col50_dadda4_OUT,
									col51_dadda4_OUT,
									col52_dadda4_OUT,
									col53_dadda4_OUT,
									col54_dadda4_OUT,
									col55_dadda4_OUT,
									col56_dadda4_OUT,
									col57_dadda4_OUT,
									col58_dadda4_OUT,
									col59_dadda4_OUT,
									col60_dadda4_OUT,
									col61_dadda4_OUT,
									col62_dadda4_OUT,
									col63_dadda4_OUT,
									col64_dadda4_OUT);
		dd5: dadda_stage5 PORT MAP (col0_dadda4_OUT,
									col1_dadda4_OUT,
									col2_dadda4_OUT,
									col3_dadda4_OUT,
									col4_dadda4_OUT,
									col5_dadda4_OUT,
									col6_dadda4_OUT,
									col7_dadda4_OUT,
									col8_dadda4_OUT,
									col9_dadda4_OUT,
									col10_dadda4_OUT,
									col11_dadda4_OUT,
									col12_dadda4_OUT,
									col13_dadda4_OUT,
									col14_dadda4_OUT,
									col15_dadda4_OUT,
									col16_dadda4_OUT,
									col17_dadda4_OUT,
									col18_dadda4_OUT,
									col19_dadda4_OUT,
									col20_dadda4_OUT,
									col21_dadda4_OUT,
									col22_dadda4_OUT,
									col23_dadda4_OUT,
									col24_dadda4_OUT,
									col25_dadda4_OUT,
									col26_dadda4_OUT,
									col27_dadda4_OUT,
									col28_dadda4_OUT,
									col29_dadda4_OUT,
									col30_dadda4_OUT,
									col31_dadda4_OUT,
									col32_dadda4_OUT,
									col33_dadda4_OUT,
									col34_dadda4_OUT,
									col35_dadda4_OUT,
									col36_dadda4_OUT,
									col37_dadda4_OUT,
									col38_dadda4_OUT,
									col39_dadda4_OUT,
									col40_dadda4_OUT,
									col41_dadda4_OUT,
									col42_dadda4_OUT,
									col43_dadda4_OUT,
									col44_dadda4_OUT,
									col45_dadda4_OUT,
									col46_dadda4_OUT,
									col47_dadda4_OUT,
									col48_dadda4_OUT,
									col49_dadda4_OUT,
									col50_dadda4_OUT,
									col51_dadda4_OUT,
									col52_dadda4_OUT,
									col53_dadda4_OUT,
									col54_dadda4_OUT,
									col55_dadda4_OUT,
									col56_dadda4_OUT,
									col57_dadda4_OUT,
									col58_dadda4_OUT,
									col59_dadda4_OUT,
									col60_dadda4_OUT,
									col61_dadda4_OUT,
									col62_dadda4_OUT,
									col63_dadda4_OUT,
									col64_dadda4_OUT,
									col0_dadda5_OUT,
									col1_dadda5_OUT,
									col2_dadda5_OUT,
									col3_dadda5_OUT,
									col4_dadda5_OUT,
									col5_dadda5_OUT,
									col6_dadda5_OUT,
									col7_dadda5_OUT,
									col8_dadda5_OUT,
									col9_dadda5_OUT,
									col10_dadda5_OUT,
									col11_dadda5_OUT,
									col12_dadda5_OUT,
									col13_dadda5_OUT,
									col14_dadda5_OUT,
									col15_dadda5_OUT,
									col16_dadda5_OUT,
									col17_dadda5_OUT,
									col18_dadda5_OUT,
									col19_dadda5_OUT,
									col20_dadda5_OUT,
									col21_dadda5_OUT,
									col22_dadda5_OUT,
									col23_dadda5_OUT,
									col24_dadda5_OUT,
									col25_dadda5_OUT,
									col26_dadda5_OUT,
									col27_dadda5_OUT,
									col28_dadda5_OUT,
									col29_dadda5_OUT,
									col30_dadda5_OUT,
									col31_dadda5_OUT,
									col32_dadda5_OUT,
									col33_dadda5_OUT,
									col34_dadda5_OUT,
									col35_dadda5_OUT,
									col36_dadda5_OUT,
									col37_dadda5_OUT,
									col38_dadda5_OUT,
									col39_dadda5_OUT,
									col40_dadda5_OUT,
									col41_dadda5_OUT,
									col42_dadda5_OUT,
									col43_dadda5_OUT,
									col44_dadda5_OUT,
									col45_dadda5_OUT,
									col46_dadda5_OUT,
									col47_dadda5_OUT,
									col48_dadda5_OUT,
									col49_dadda5_OUT,
									col50_dadda5_OUT,
									col51_dadda5_OUT,
									col52_dadda5_OUT,
									col53_dadda5_OUT,
									col54_dadda5_OUT,
									col55_dadda5_OUT,
									col56_dadda5_OUT,
									col57_dadda5_OUT,
									col58_dadda5_OUT,
									col59_dadda5_OUT,
									col60_dadda5_OUT,
									col61_dadda5_OUT,
									col62_dadda5_OUT,
									col63_dadda5_OUT,
									col64_dadda5_OUT);
		dd6: dadda_stage6 PORT MAP (col0_dadda5_OUT,
									col1_dadda5_OUT,
									col2_dadda5_OUT,
									col3_dadda5_OUT,
									col4_dadda5_OUT,
									col5_dadda5_OUT,
									col6_dadda5_OUT,
									col7_dadda5_OUT,
									col8_dadda5_OUT,
									col9_dadda5_OUT,
									col10_dadda5_OUT,
									col11_dadda5_OUT,
									col12_dadda5_OUT,
									col13_dadda5_OUT,
									col14_dadda5_OUT,
									col15_dadda5_OUT,
									col16_dadda5_OUT,
									col17_dadda5_OUT,
									col18_dadda5_OUT,
									col19_dadda5_OUT,
									col20_dadda5_OUT,
									col21_dadda5_OUT,
									col22_dadda5_OUT,
									col23_dadda5_OUT,
									col24_dadda5_OUT,
									col25_dadda5_OUT,
									col26_dadda5_OUT,
									col27_dadda5_OUT,
									col28_dadda5_OUT,
									col29_dadda5_OUT,
									col30_dadda5_OUT,
									col31_dadda5_OUT,
									col32_dadda5_OUT,
									col33_dadda5_OUT,
									col34_dadda5_OUT,
									col35_dadda5_OUT,
									col36_dadda5_OUT,
									col37_dadda5_OUT,
									col38_dadda5_OUT,
									col39_dadda5_OUT,
									col40_dadda5_OUT,
									col41_dadda5_OUT,
									col42_dadda5_OUT,
									col43_dadda5_OUT,
									col44_dadda5_OUT,
									col45_dadda5_OUT,
									col46_dadda5_OUT,
									col47_dadda5_OUT,
									col48_dadda5_OUT,
									col49_dadda5_OUT,
									col50_dadda5_OUT,
									col51_dadda5_OUT,
									col52_dadda5_OUT,
									col53_dadda5_OUT,
									col54_dadda5_OUT,
									col55_dadda5_OUT,
									col56_dadda5_OUT,
									col57_dadda5_OUT,
									col58_dadda5_OUT,
									col59_dadda5_OUT,
									col60_dadda5_OUT,
									col61_dadda5_OUT,
									col62_dadda5_OUT,
									col63_dadda5_OUT,
									col64_dadda5_OUT,
									col0_dadda6_OUT,
									col1_dadda6_OUT,
									col2_dadda6_OUT,
									col3_dadda6_OUT,
									col4_dadda6_OUT,
									col5_dadda6_OUT,
									col6_dadda6_OUT,
									col7_dadda6_OUT,
									col8_dadda6_OUT,
									col9_dadda6_OUT,
									col10_dadda6_OUT,
									col11_dadda6_OUT,
									col12_dadda6_OUT,
									col13_dadda6_OUT,
									col14_dadda6_OUT,
									col15_dadda6_OUT,
									col16_dadda6_OUT,
									col17_dadda6_OUT,
									col18_dadda6_OUT,
									col19_dadda6_OUT,
									col20_dadda6_OUT,
									col21_dadda6_OUT,
									col22_dadda6_OUT,
									col23_dadda6_OUT,
									col24_dadda6_OUT,
									col25_dadda6_OUT,
									col26_dadda6_OUT,
									col27_dadda6_OUT,
									col28_dadda6_OUT,
									col29_dadda6_OUT,
									col30_dadda6_OUT,
									col31_dadda6_OUT,
									col32_dadda6_OUT,
									col33_dadda6_OUT,
									col34_dadda6_OUT,
									col35_dadda6_OUT,
									col36_dadda6_OUT,
									col37_dadda6_OUT,
									col38_dadda6_OUT,
									col39_dadda6_OUT,
									col40_dadda6_OUT,
									col41_dadda6_OUT,
									col42_dadda6_OUT,
									col43_dadda6_OUT,
									col44_dadda6_OUT,
									col45_dadda6_OUT,
									col46_dadda6_OUT,
									col47_dadda6_OUT,
									col48_dadda6_OUT,
									col49_dadda6_OUT,
									col50_dadda6_OUT,
									col51_dadda6_OUT,
									col52_dadda6_OUT,
									col53_dadda6_OUT,
									col54_dadda6_OUT,
									col55_dadda6_OUT,
									col56_dadda6_OUT,
									col57_dadda6_OUT,
									col58_dadda6_OUT,
									col59_dadda6_OUT,
									col60_dadda6_OUT,
									col61_dadda6_OUT,
									col62_dadda6_OUT,
									col63_dadda6_OUT,
									col64_dadda6_OUT);

		-- From columns to rows: generation of the inputs of the RCA -----------------------------------------------
		operand1(0) <= col0_dadda6_OUT(0);
		operand2(0) <= col0_dadda6_OUT(1);
		operand1(1) <= '0';
		operand2(1) <= col1_dadda6_OUT(0);
		operand1(2) <= col2_dadda6_OUT(0);
		operand2(2) <= col2_dadda6_OUT(1);
		operand1(3) <= col3_dadda6_OUT(0);
		operand2(3) <= col3_dadda6_OUT(1);
		operand1(4) <= col4_dadda6_OUT(0);
		operand2(4) <= col4_dadda6_OUT(1);
		operand1(5) <= col5_dadda6_OUT(0);
		operand2(5) <= col5_dadda6_OUT(1);
		operand1(6) <= col6_dadda6_OUT(0);
		operand2(6) <= col6_dadda6_OUT(1);
		operand1(7) <= col7_dadda6_OUT(0);
		operand2(7) <= col7_dadda6_OUT(1);
		operand1(8) <= col8_dadda6_OUT(0);
		operand2(8) <= col8_dadda6_OUT(1);
		operand1(9) <= col9_dadda6_OUT(0);
		operand2(9) <= col9_dadda6_OUT(1);
		operand1(10) <= col10_dadda6_OUT(0);
		operand2(10) <= col10_dadda6_OUT(1);
		operand1(11) <= col11_dadda6_OUT(0);
		operand2(11) <= col11_dadda6_OUT(1);
		operand1(12) <= col12_dadda6_OUT(0);
		operand2(12) <= col12_dadda6_OUT(1);
		operand1(13) <= col13_dadda6_OUT(0);
		operand2(13) <= col13_dadda6_OUT(1);
		operand1(14) <= col14_dadda6_OUT(0);
		operand2(14) <= col14_dadda6_OUT(1);
		operand1(15) <= col15_dadda6_OUT(0);
		operand2(15) <= col15_dadda6_OUT(1);
		operand1(16) <= col16_dadda6_OUT(0);
		operand2(16) <= col16_dadda6_OUT(1);
		operand1(17) <= col17_dadda6_OUT(0);
		operand2(17) <= col17_dadda6_OUT(1);
		operand1(18) <= col18_dadda6_OUT(0);
		operand2(18) <= col18_dadda6_OUT(1);
		operand1(19) <= col19_dadda6_OUT(0);
		operand2(19) <= col19_dadda6_OUT(1);
		operand1(20) <= col20_dadda6_OUT(0);
		operand2(20) <= col20_dadda6_OUT(1);
		operand1(21) <= col21_dadda6_OUT(0);
		operand2(21) <= col21_dadda6_OUT(1);
		operand1(22) <= col22_dadda6_OUT(0);
		operand2(22) <= col22_dadda6_OUT(1);
		operand1(23) <= col23_dadda6_OUT(0);
		operand2(23) <= col23_dadda6_OUT(1);
		operand1(24) <= col24_dadda6_OUT(0);
		operand2(24) <= col24_dadda6_OUT(1);
		operand1(25) <= col25_dadda6_OUT(0);
		operand2(25) <= col25_dadda6_OUT(1);
		operand1(26) <= col26_dadda6_OUT(0);
		operand2(26) <= col26_dadda6_OUT(1);
		operand1(27) <= col27_dadda6_OUT(0);
		operand2(27) <= col27_dadda6_OUT(1);
		operand1(28) <= col28_dadda6_OUT(0);
		operand2(28) <= col28_dadda6_OUT(1);
		operand1(29) <= col29_dadda6_OUT(0);
		operand2(29) <= col29_dadda6_OUT(1);
		operand1(30) <= col30_dadda6_OUT(0);
		operand2(30) <= col30_dadda6_OUT(1);
		operand1(31) <= col31_dadda6_OUT(0);
		operand2(31) <= col31_dadda6_OUT(1);
		operand1(32) <= col32_dadda6_OUT(0);
		operand2(32) <= col32_dadda6_OUT(1);
		operand1(33) <= col33_dadda6_OUT(0);
		operand2(33) <= col33_dadda6_OUT(1);
		operand1(34) <= col34_dadda6_OUT(0);
		operand2(34) <= col34_dadda6_OUT(1);
		operand1(35) <= col35_dadda6_OUT(0);
		operand2(35) <= col35_dadda6_OUT(1);
		operand1(36) <= col36_dadda6_OUT(0);
		operand2(36) <= col36_dadda6_OUT(1);
		operand1(37) <= col37_dadda6_OUT(0);
		operand2(37) <= col37_dadda6_OUT(1);
		operand1(38) <= col38_dadda6_OUT(0);
		operand2(38) <= col38_dadda6_OUT(1);
		operand1(39) <= col39_dadda6_OUT(0);
		operand2(39) <= col39_dadda6_OUT(1);
		operand1(40) <= col40_dadda6_OUT(0);
		operand2(40) <= col40_dadda6_OUT(1);
		operand1(41) <= col41_dadda6_OUT(0);
		operand2(41) <= col41_dadda6_OUT(1);
		operand1(42) <= col42_dadda6_OUT(0);
		operand2(42) <= col42_dadda6_OUT(1);
		operand1(43) <= col43_dadda6_OUT(0);
		operand2(43) <= col43_dadda6_OUT(1);
		operand1(44) <= col44_dadda6_OUT(0);
		operand2(44) <= col44_dadda6_OUT(1);
		operand1(45) <= col45_dadda6_OUT(0);
		operand2(45) <= col45_dadda6_OUT(1);
		operand1(46) <= col46_dadda6_OUT(0);
		operand2(46) <= col46_dadda6_OUT(1);
		operand1(47) <= col47_dadda6_OUT(0);
		operand2(47) <= col47_dadda6_OUT(1);
		operand1(48) <= col48_dadda6_OUT(0);
		operand2(48) <= col48_dadda6_OUT(1);
		operand1(49) <= col49_dadda6_OUT(0);
		operand2(49) <= col49_dadda6_OUT(1);
		operand1(50) <= col50_dadda6_OUT(0);
		operand2(50) <= col50_dadda6_OUT(1);
		operand1(51) <= col51_dadda6_OUT(0);
		operand2(51) <= col51_dadda6_OUT(1);
		operand1(52) <= col52_dadda6_OUT(0);
		operand2(52) <= col52_dadda6_OUT(1);
		operand1(53) <= col53_dadda6_OUT(0);
		operand2(53) <= col53_dadda6_OUT(1);
		operand1(54) <= col54_dadda6_OUT(0);
		operand2(54) <= col54_dadda6_OUT(1);
		operand1(55) <= col55_dadda6_OUT(0);
		operand2(55) <= col55_dadda6_OUT(1);
		operand1(56) <= col56_dadda6_OUT(0);
		operand2(56) <= col56_dadda6_OUT(1);
		operand1(57) <= col57_dadda6_OUT(0);
		operand2(57) <= col57_dadda6_OUT(1);
		operand1(58) <= col58_dadda6_OUT(0);
		operand2(58) <= col58_dadda6_OUT(1);
		operand1(59) <= col59_dadda6_OUT(0);
		operand2(59) <= col59_dadda6_OUT(1);
		operand1(60) <= col60_dadda6_OUT(0);
		operand2(60) <= col60_dadda6_OUT(1);
		operand1(61) <= col61_dadda6_OUT(0);
		operand2(61) <= col61_dadda6_OUT(1);
		operand1(62) <= col62_dadda6_OUT(0);
		operand2(62) <= col62_dadda6_OUT(1);
		operand1(63) <= col63_dadda6_OUT(0);
		operand2(63) <= col63_dadda6_OUT(1);
		operand1(64) <= col64_dadda6_OUT(0);
		operand2(64) <= col64_dadda6_OUT(1);

		-- Sum of the last two contributes (using a ripple carry adder) -------------------------------------------------
		RCAdder: RCA GENERIC MAP (65) PORT MAP (operand1, operand2, '0', res);

		result <= res (63 DOWNTO 0);

END behaviour;
