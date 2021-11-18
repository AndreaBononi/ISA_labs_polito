LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- SATURATION BLOCK -----------------------------------------------------------
ENTITY 	sat 	IS
PORT	(SatIN: IN 	SIGNED (11 downto 0);
		SatOUT: OUT SIGNED (10 downto 0));
END sat;


-- ARCHITECTURE ---------------------------------------------------------------
ARCHITECTURE behaviour OF sat IS
	
	SIGNAL res: SIGNED (10 downto 0);

	BEGIN

		PROCESS (SatIN)
		BEGIN
			IF (SatIN > "001111111111") THEN res <= "01111111111";
			ELSIF (SatIN < "110000000001") THEN res <= "10000000001";
			ELSE res <= SatIN (10 DOWNTO 0);
			END IF;			
		END PROCESS;

	SatOUT <= res;
	
END behaviour;
