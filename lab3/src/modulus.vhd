LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- ARITHMETIC UNIT --------------------------------------------------------------------------------------------------------
ENTITY 	modulus	            IS
GENERIC	(N: 			INTEGER := 32);
PORT 	(in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		sel:		    IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		zero: 			OUT STD_LOGIC
		);
END 	ALU;


-- ARCHITECTURE -----------------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF ALU IS

    -- Internal signals ----------------------------------------------------------------------------------------------------

	BEGIN

        

END behaviour;
