LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;
LIBRARY std;
USE std.textio.all;


-- RESULTS STORING ------------------------------------------------------------------
ENTITY 	storeResults 	IS
PORT	(clk: 			IN STD_LOGIC;
		rstN: 			IN STD_LOGIC;
		valid:			IN STD_LOGIC;
		mulRes:			IN STD_LOGIC_VECTOR (31 DOWNTO 0));
END 	storeResults;


-- ARCHITECTURE ---------------------------------------------------------------------
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
				IF (valid = '1') THEN
					WRITE (outputLine, TO_INTEGER (UNSIGNED(mulRes)));
					WRITELINE (myfile, outputLine);
				END IF;
			END IF;
		END PROCESS storeRes;

END behaviour;
