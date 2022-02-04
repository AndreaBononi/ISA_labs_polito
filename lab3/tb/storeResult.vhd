LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;
LIBRARY std;
USE std.textio.all;


-- RESULTS STORING ------------------------------------------------------------------
ENTITY 	storeResult 	IS
PORT	(clk: 			IN STD_LOGIC;
		rstN: 			IN STD_LOGIC;
        result:			IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		valid:			IN STD_LOGIC
        );
END 	storeResult;


-- BEHAVIOUR ------------------------------------------------------------------------
ARCHITECTURE behaviour OF storeResult IS

	FILE myfile: TEXT;

	BEGIN

		storeRes: PROCESS (clk, rstN)
		VARIABLE outputLine: LINE;
		VARIABLE fileStat: FILE_OPEN_STATUS;
		BEGIN
			file_open (fileStat, myfile, "./result.txt",  write_mode);
			IF (rstN = '0') THEN NULL;
			ELSIF (RISING_EDGE (clk)) THEN
				IF (valid = '1') THEN
					WRITE (outputLine, TO_INTEGER(UNSIGNED(result)));
					WRITELINE (myfile, outputLine);
				END IF;
			END IF;
		END PROCESS storeRes;

END behaviour;
