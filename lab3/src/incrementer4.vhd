LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- INCREMENTER BY 4 ------------------------------------------------
ENTITY	incrementer4	IS
GENERIC	(N: 			INTEGER := 32);
PORT 	(inc_in:		IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		inc_out: 	    OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
		);
END 	incrementer4;

-- ARCHITECTURE ----------------------------------------------------
ARCHITECTURE behaviour OF incrementer4 IS

	CONSTANT inc: UNSIGNED (2 DOWNTO 0) := "100";
	SIGNAL res: UNSIGNED (N-1 DOWNTO 0);

	BEGIN

		res <= UNSIGNED(inc_in) + inc;
		inc_out <= STD_LOGIC_VECTOR(res);

END behaviour;
