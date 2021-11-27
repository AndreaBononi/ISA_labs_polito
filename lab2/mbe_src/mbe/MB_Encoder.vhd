LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- MODIFIED BOOTH ENCODER -----------------------------------------------------
ENTITY 	MB_Encoder	IS
PORT	(b:			IN	STD_LOGIC;
		b_plus:		IN	STD_LOGIC;
		b_minus:	IN	STD_LOGIC;
		sel:		OUT	STD_LOGIC_VECTOR (1 DOWNTO 0));
END 	MB_Encoder;


-- ARCHITECTURE ---------------------------------------------------------------
ARCHITECTURE behaviour OF MB_Encoder IS 
	
	SIGNAL res: STD_LOGIC_VECTOR (1 DOWNTO 0);
	
	BEGIN
	res(1) <= b XOR b_minus;
	res(0) <= NOT(res(1)) AND (NOT(b XOR b_plus));
	sel <= res;

END behaviour;
