LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;
LIBRARY std;
USE std.textio.all;


-- INSTRUCTION AND DATA GENERATOR ------------------------------------------------
ENTITY 	dataGen 		IS
PORT	(clk: 			IN  STD_LOGIC;
		rstN:			IN  STD_LOGIC;
		riscV_rstN:     OUT STD_LOGIC;
		pc_rstN:     	OUT STD_LOGIC;
		pcEn:			OUT STD_LOGIC;
		pcSel:			OUT STD_LOGIC;
		pcInit:			OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		instr: 			OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		instr_addr:		OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		valid_instr:	OUT STD_LOGIC;
		data:			OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		data_addr:		OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		valid_data:		OUT STD_LOGIC
		);
END 	dataGen;


-- ARCHITECTURE -------------------------------------------------------------------
ARCHITECTURE behaviour OF dataGen IS

	FILE 	dataFile: 			TEXT;
	FILE 	instrFile: 			TEXT;
	SIGNAL  endGen:				STD_LOGIC;
	SIGNAL  d_endGen:			STD_LOGIC;
	SIGNAL  i_endGen:			STD_LOGIC;
	SIGNAL  pcInit_valid:		STD_LOGIC;

	BEGIN

		-- Data generation --------------------------------------------------------
		dataGen: PROCESS (clk, rstN)
		VARIABLE d_inputLine: 	LINE;
		VARIABLE d_fileStat: 	FILE_OPEN_STATUS;
		VARIABLE d_val:			STD_LOGIC_VECTOR (31 DOWNTO 0);
		VARIABLE d_addr:		STD_LOGIC_VECTOR (31 DOWNTO 0);
		BEGIN
			file_open (d_fileStat, dataFile, "./vector.txt", read_mode);
			IF (rstN = '0') THEN
				data <= (OTHERS => '0');
				data_addr <= (OTHERS => '0');
				valid_data <= '0';
				d_endGen <= '0';
			ELSIF (RISING_EDGE (clk)) THEN
				IF (NOT ENDFILE (dataFile)) THEN
					READLINE (dataFile, d_inputLine);
					HREAD (d_inputLine, d_addr);
					READLINE (dataFile, d_inputLine);
					HREAD (d_inputLine, d_val);
					d_endGen <= '0';
					valid_data <= '1';
				ELSE
					d_endGen <= '1';
					valid_data <= '0';
				END IF;
				data <= d_val;
				data_addr <= d_addr;
			END IF;
		END PROCESS dataGen;

		-- Instructions generation ------------------------------------------------
		instrGen: PROCESS (clk, rstN)
		VARIABLE i_inputLine: 	LINE;
		VARIABLE i_fileStat: 	FILE_OPEN_STATUS;
		VARIABLE i_val:			STD_LOGIC_VECTOR (31 DOWNTO 0);
		VARIABLE i_addr:		STD_LOGIC_VECTOR (31 DOWNTO 0);
		VARIABLE flag: 			INTEGER := 0;
		BEGIN
			file_open (i_fileStat, instrFile, "./instructions.txt", read_mode);
			IF (rstN = '0') THEN
				instr <= (OTHERS => '0');
				instr_addr <= (OTHERS => '0');
				valid_instr <= '0';
				i_endGen <= '0';
				pcInit_valid <= '0';
			ELSIF (RISING_EDGE (clk)) THEN
				IF (NOT ENDFILE (instrFile)) THEN
					READLINE (instrFile, i_inputLine);
					HREAD (i_inputLine, i_addr);
					READLINE (instrFile, i_inputLine);
					HREAD (i_inputLine, i_val);
					i_endGen <= '0';
					valid_instr <= '1';
					IF (flag = 0) THEN
						flag := 1;
						pcInit <= i_addr;
						pcInit_valid <= '1';
					ELSE
						pcInit_valid <= '0';
					END IF;
				ELSE
					i_endGen <= '1';
					pcInit_valid <= '0';
					valid_instr <= '0';
				END IF;
				instr <= i_val;
				instr_addr <= i_addr;
			END IF;
		END PROCESS instrGen;

	endGen <= d_endGen AND i_endGen;

	-- The PC is enabled at the end of the memory writing, but also when its initia valued is availabe:
	pcEn <= pcInit_valid OR endGen;
	pcSel <= pcInit_valid;

	-- The processor does not start until the end of the memory writing (with the exception of the PC):
	riscV_rstN <= rstN AND (endGen);
	pc_rstN <= rstN;

END behaviour;
