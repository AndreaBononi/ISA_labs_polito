LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;
LIBRARY std;
USE std.textio.all;


-- RSEULTS STORING COMPONENT ------------------------------------------------------------------
ENTITY 	storeResults 	IS
PORT 	(clk: 			IN STD_LOGIC;
		rstN: 			IN STD_LOGIC;
		validOut: 		IN STD_LOGIC;
		filterOut:		IN SIGNED (10 downto 0));
END 	storeResults;


-- BEHAVIOR -----------------------------------------------------------------------------------
ARCHITECTURE behaviour OF storeResults IS

	FILE myfile: TEXT;

	BEGIN

		storeRes: PROCESS (clk, rstN)
		VARIABLE outputLine: LINE;
		VARIABLE fileStat: FILE_OPEN_STATUS;    
		BEGIN
			file_open (fileStat, myfile, "./results.txt",  write_mode);
			IF (rstN = '0') THEN NULL;
			ELSIF (RISING_EDGE (clk)) THEN
				IF (validOut = '1') THEN
					WRITE (outputLine, TO_INTEGER (filterOut));
					WRITELINE (myfile, outputLine);
				END IF;
			END IF;
		END PROCESS storeRes;

END behaviour;
