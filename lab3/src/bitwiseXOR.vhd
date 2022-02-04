LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- BITWISE XOR OPERATOR --------------------------------------------------------------
ENTITY 	bitwiseXOR	    IS
GENERIC	(N: 			INTEGER := 32);
PORT 	(in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
		);
END 	bitwiseXOR;

-- ARCHITECTURE ----------------------------------------------------------------------
ARCHITECTURE behaviour OF bitwiseXOR IS

	BEGIN

		result <= in1 XOR in2;

END behaviour;
