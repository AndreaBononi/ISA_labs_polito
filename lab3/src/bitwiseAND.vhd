LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- BITWISE AND OPERATOR --------------------------------------------------------------
ENTITY 	bitwiseAND	    IS
GENERIC	(N: 			INTEGER := 32);
PORT 	(in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
		);
END 	bitwiseAND;

-- ARCHITECTURE ----------------------------------------------------------------------
ARCHITECTURE behaviour OF bitwiseAND IS

	BEGIN

		result <= in1 AND in2;

END behaviour;
