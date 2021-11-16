LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;
LIBRARY std;
USE std.textio.all;


-- STIMULI GENERATOR -------------------------------------------------------------------------------------------
ENTITY dataGen IS  
	PORT (clk: 				IN  STD_LOGIC;
			rstN:				IN  STD_LOGIC;
			valid:			OUT STD_LOGIC;
			filterInput:	OUT SIGNED (10 DOWNTO 0);
			a1:				OUT SIGNED (10 DOWNTO 0);
			b1:				OUT SIGNED (10 DOWNTO 0);
			b0:				OUT SIGNED (10 DOWNTO 0);
			endSim:			OUT STD_LOGIC);
END dataGen;


-- BEHAVIOR ----------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF dataGen IS

	CONSTANT	mydelay: TIME := 1 ns;
	FILE myfile: TEXT;
	SIGNAL end_file: STD_LOGIC;
	SIGNAL pipe: STD_LOGIC_VECTOR (2 DOWNTO 0);
	
	BEGIN

		-- Coefficients generation -----------------------------------------------------------------------------
		a1 <= TO_SIGNED (-163, 11);
		b1 <= TO_SIGNED (430, 11);
		b0 <= TO_SIGNED (430, 11);
		
		-- Input data generation -------------------------------------------------------------------------------
		dataGen: PROCESS (clk, rstN)
		VARIABLE inputLine: LINE;
		VARIABLE readValue: INTEGER;
		VARIABLE fileStat: FILE_OPEN_STATUS;
		VARIABLE flag: INTEGER := 0;
		BEGIN
			file_open (fileStat, myfile, "../samples.txt",  read_mode);
			IF (rstN = '0') THEN
				filterInput	<= (OTHERS => '0') AFTER mydelay;      
				valid <= '0' AFTER mydelay;
				end_file <= '0' AFTER mydelay;
			ELSIF (RISING_EDGE (clk)) THEN
				flag := flag + 1;
				IF (flag = 10) THEN
					-- A non-valid input data is provided every 10 cycles
					filterInput <= TO_SIGNED (0, 11);
					valid <= '0' AFTER mydelay;
					flag := 0;
				ELSIF (NOT ENDFILE (myfile)) THEN
					READLINE (myfile, inputLine);
					READ (inputLine, readValue);
					filterInput <= TO_SIGNED (readValue, 11) AFTER mydelay;
					valid <= '1' AFTER mydelay;
					end_file <= '0' AFTER mydelay;
				ELSE
					valid <= '0' AFTER mydelay;        
					end_file <= '1' AFTER mydelay;
				END IF;
			END IF;
		END PROCESS dataGen;
		
		-- End of simulation -----------------------------------------------------------------------------------
		-- We must consider 2 clock cycles of latency in order to set the signal endSim
		endSimGen: PROCESS (clk, rstN) 
		BEGIN
			IF (rstN = '0') THEN
				pipe <= (OTHERS => '0') AFTER mydelay;
			ELSIF (RISING_EDGE (clk)) THEN
				pipe(1) <= end_file AFTER mydelay;
				pipe(0) <= pipe(1) AFTER mydelay;
			END IF;
		END PROCESS endSimGen;
		endSim <= pipe(0); 
  
END behaviour;
