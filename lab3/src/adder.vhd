LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- ADDER --------------------------------------------------------------
ENTITY 	adder			IS
GENERIC	(N: 			INTEGER := 32);
PORT 	(in1:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in2:			IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		sub_addN:		IN  STD_LOGIC;
		result: 		OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
		);
END 	adder;

-- BEHAVIOR (the internal architecture is not specified) --------------
ARCHITECTURE behaviour OF adder IS

	SIGNAL res: SIGNED (N-1 DOWNTO 0);

	BEGIN

		ADD: PROCESS (sub_addN, in1, in2)
		BEGIN
			IF (sub_addN = '0') THEN
				res <= SIGNED(in1) + SIGNED(in2);
			ELSE
				res <= SIGNED(in1) - SIGNED(in2);
			END IF;
		END PROCESS ADD;

		result <= STD_LOGIC_VECTOR(res);

END behaviour;
