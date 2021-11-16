LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- REGISTER N BITS ---------------------------------------------------
ENTITY 	reg 	IS
GENERIC (N: 		INTEGER:=8);
PORT 	(clk: 	IN 	STD_LOGIC;
		enable:	IN 	STD_LOGIC;
		clearN:	IN 	STD_LOGIC;
		regIN: 	IN 	SIGNED (N-1 downto 0);
		regOUT:	OUT SIGNED (N-1 downto 0));
END 	reg;


-- ARCHITECTURE ------------------------------------------------------
ARCHITECTURE behaviour OF reg IS
	
	BEGIN

		PROCESS (clk, clearn, enable)
		BEGIN
			IF (RISING_EDGE (clk)) THEN 
				IF (clearN = '0') THEN regOUT <= (OTHERS => '0');
				ELSIF (enable = '1') THEN regOUT <= regIN;
            	END IF;
			END IF;
		END PROCESS;
	
END behaviour;
