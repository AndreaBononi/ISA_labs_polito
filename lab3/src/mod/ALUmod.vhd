LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- ARITHMETIC UNIT --------------------------------------------------------------------------------------------------------
ENTITY 	ALU	            IS
GENERIC	(N: 			INTEGER := 32);
PORT 	(in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		sel:		    IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		zero: 			OUT STD_LOGIC
		);
END 	ALU;
-- sel = "000" --> result = in1 + in2
-- sel = "001" --> result = arithmetic right shift of in1
-- sel = "010" --> result = in1 AND in2
-- sel = "011" --> result = in1 XOR in2
-- sel = "100" --> result = '1' if in1 < in2, '0' otherwise ; zero = '1' if in1 < in2, '0' otherwise
-- sel = "101" --> result = abs(in1)
-- sel = "111" --> result = in2
-- other --> result = in2

-- ARCHITECTURE -----------------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF ALU IS

    -- ADDER --------------------------------------------------------------------------------------------------------------
    COMPONENT 	adder			IS
    GENERIC	    (N: 			INTEGER := 32);
    PORT 	    (in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
                in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
                sub_addN:		IN  STD_LOGIC;
                result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
                );
    END 	    COMPONENT;

    -- ARITHMETIC SHIFTER (RIGHT) ------------------------------------------------------------------------------------------
    COMPONENT 	arithShiftRight     IS
    GENERIC	    (N: 			    INTEGER := 32);
    PORT 	    (din:			    IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				nshift:				IN	INTEGER;
    		    dout: 		        OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- BITWISE AND OPERATOR ------------------------------------------------------------------------------------------------
    COMPONENT 	bitwiseAND	    IS
    GENERIC	    (N: 			INTEGER := 32);
    PORT 	    (in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- BITWISE XOR OPERATOR ------------------------------------------------------------------------------------------------
    COMPONENT 	bitwiseXOR	    IS
    GENERIC	    (N: 			INTEGER := 32);
    PORT 	    (in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
    		    result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
    		    );
    END 	    COMPONENT;

    -- MULTIPLEXER 8TO1 N BIT ---------------------------------------------------------------------
	COMPONENT 	mux8to1     IS
	GENERIC		(N: 	    INTEGER := 8);
	PORT		(sel:	    IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				in_000: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in_001: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
				in_010: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
				in_011:	    IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
        		in_100:	    IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
        		in_101: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
				in_110: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
				in_111:	    IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
				muxout:     OUT STD_LOGIC_VECTOR (N-1  DOWNTO 0)
				);
	END 		COMPONENT;

	-- MULTIPLEXER 2TO1 N BIT ---------------------------------------------------------------------
	COMPONENT 	mux2to1 IS
	GENERIC		(N: 	INTEGER := 8);
	PORT		(sel:	IN  STD_LOGIC;
				in0: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				in1: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				muxout: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
				);
	END 		COMPONENT;

    -- Internal signals ----------------------------------------------------------------------------------------------------
    SIGNAL adder_out:   STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL shifter_out: STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL and_out:     STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL xor_out:     STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL mux4_out:    STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL minor:       STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL ctrl: 		STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL mybit: 		STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL inv_in1: 	STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL addMux1_out: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL addMux2_out: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL subAddN:		STD_LOGIC;
	SIGNAL nsh:			INTEGER;

	BEGIN

		ctrl <= (OTHERS => in1(31));
		inv_in1 <= ctrl XOR in1;
		mybit(0) <= in1(31);
		mybit (31 DOWNTO 1) <= "0000000000000000000000000000000";

		addMux1: mux2to1 GENERIC MAP (32) PORT MAP (sel(0), in1, inv_in1, addMux1_out);
		addMux2: mux2to1 GENERIC MAP (32) PORT MAP (sel(0), in2, mybit, addMux2_out);

		subAddN <= sel(2) AND (NOT sel(1)) AND (NOT sel(0));	-- sel = "100" performs a subtraction

		ADD:    adder GENERIC MAP (32) PORT MAP (addMux1_out, addMux2_out, subAddN, adder_out);
        ASR:    arithShiftRight GENERIC MAP (32) PORT MAP (in1, nsh, shifter_out);
        BAND:   bitwiseAND GENERIC MAP (32) PORT MAP (in1, in2, and_out);
        BXOR:   bitwiseXOR GENERIC MAP (32) PORT MAP (in1, in2, xor_out);

		MUX8: 	mux8to1 GENERIC MAP (32) PORT MAP (sel, adder_out, shifter_out, and_out, xor_out, minor, adder_out, in2, in2, result);

        minor(0) <= adder_out(31);
        minor(31 DOWNTO 1) <= (OTHERS => '0');
		nsh <= TO_INTEGER(UNSIGNED(in2));

        zero <= NOT (adder_out(0) OR adder_out(1) OR adder_out(2) OR adder_out(3) OR adder_out(4) OR adder_out(5) OR adder_out(6) 
				OR adder_out(7) OR adder_out(8) OR adder_out(9) OR adder_out(10) OR adder_out(11) OR adder_out(12) OR adder_out(13) 
				OR adder_out(14) OR adder_out(15) OR adder_out(16) OR adder_out(17) OR adder_out(18) OR adder_out(19) OR adder_out(20) 
				OR adder_out(21) OR adder_out(22) OR adder_out(23) OR adder_out(24) OR adder_out(25) OR adder_out(26) OR adder_out(27) 
				OR adder_out(28) OR adder_out(29) OR adder_out(30) OR adder_out(31));

END behaviour;
