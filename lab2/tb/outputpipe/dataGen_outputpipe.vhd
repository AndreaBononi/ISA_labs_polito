LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;
LIBRARY std;
USE std.textio.all;


-- STIMULI GENERATOR ENTITY ------------------------------------------------
ENTITY 	dataGen_outputpipe 	IS  
PORT	(clk: 		IN  STD_LOGIC;
		rstN:		IN  STD_LOGIC;
		mulA: 		OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		mulB:		OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		valid:		OUT STD_LOGIC;
		endSim:		OUT STD_LOGIC);
END 	dataGen_outputpipe;


-- ARCHITECTURE ------------------------------------------------------------
ARCHITECTURE behaviour OF dataGen_outputpipe IS

	-- SIGNALS -------------------------------------------------------------
	FILE 	myfile: 			TEXT;
	SIGNAL 	flag, end_file: 	STD_LOGIC;
	SIGNAL 	endpipe, flagpipe: 	STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL  start:				STD_LOGIC;
	
	BEGIN
		
		-- Data generation -------------------------------------------------
		dataGen: PROCESS (clk, rstN)
		VARIABLE inputLine: LINE;
		VARIABLE readValue: INTEGER;
		VARIABLE fileStat: FILE_OPEN_STATUS;
		VARIABLE dat: STD_LOGIC_VECTOR (31 DOWNTO 0);
		BEGIN
			file_open (fileStat, myfile, "./fp_samples.hex",  read_mode);
			IF (rstN = '0') THEN
				end_file	<= '0';
				flag 		<= '1';
				mulA 		<= (OTHERS => '0');
				mulB 		<= (OTHERS => '0');
			ELSIF (RISING_EDGE (clk)) THEN
				IF (NOT ENDFILE (myfile)) THEN
					READLINE (myfile, inputLine);
					HREAD (inputLine, dat);
					end_file 	<= '0';
					flag 		<= '0';
				ELSE
					end_file	<= '1';
					flag 		<= '0';
				END IF;
				mulA <= dat;
				mulB <= dat;
			END IF;
		END PROCESS dataGen;
		
		-- Generation of the end of simulation signal ----------------------
		endSimGen: PROCESS (clk, rstN) 
		BEGIN
			IF (rstN = '0') THEN
				endpipe 	<= (OTHERS => '0');
				flagpipe 	<= (OTHERS => '1');
			ELSIF (RISING_EDGE (clk)) THEN
				endpipe(5)	<= end_file;
				endpipe(4)	<= endpipe(5);
				endpipe(3)	<= endpipe(4);
				endpipe(2)	<= endpipe(3);
				endpipe(1)	<= endpipe(2);
				endpipe(0)	<= endpipe(1);
				flagpipe(5)	<= flag;
				flagpipe(4)	<= flagpipe(5);
				flagpipe(3)	<= flagpipe(4);
				flagpipe(2)	<= flagpipe(3);
				flagpipe(1)	<= flagpipe(2);
				flagpipe(0)	<= flagpipe(1);
			END IF;
		END PROCESS endSimGen;
		endSim <= endpipe(0); 
		valid <= flagpipe(0) NOR endpipe(0);
  
END behaviour;
