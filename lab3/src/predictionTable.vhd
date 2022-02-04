LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- PREDICTION TABLE ------------------------------------------------------------------------------------------------------------------
ENTITY 	predictionTable     IS
PORT	(clk:	            IN  STD_LOGIC;
        readAddress: 	    IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
		writeAddress: 	    IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
        clearPT: 	        IN  STD_LOGIC;
        data: 	            IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
        writePT: 	        IN  STD_LOGIC;
		readPT:				IN 	STD_LOGIC;
        addressPT:          OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        prediction:         OUT STD_LOGIC
        );
END 	predictionTable;
-- The table must be initialized by means of the signal clearPT, otherwise its content is unknown

-- ARCHITECTURE ----------------------------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF predictionTable IS
    
	TYPE TABLE IS ARRAY(0 TO 1023) OF STD_LOGIC_VECTOR(32 DOWNTO 0);
    SIGNAL PT: TABLE;
    -- PT(i)(31 DOWNTO 0) represents the stored branch address
    -- PT(i)(32) represents the prevision

	BEGIN       

		prediction <= PT(TO_INTEGER(UNSIGNED(readAddress)))(32);
        addressPT <= PT(TO_INTEGER(UNSIGNED(readAddress)))(31 DOWNTO 0);	

        writeTable: PROCESS (clk, clearPT, writePT, data, writeAddress)
        BEGIN
            IF (rising_edge(clk)) THEN
                IF (clearPT = '1') THEN
                    PT <= (OTHERS => (OTHERS => '0'));
                ELSIF (writePT = '1') THEN
                    PT(TO_INTEGER(UNSIGNED(writeAddress)))(31 DOWNTO 0) <= data;
					PT(TO_INTEGER(UNSIGNED(writeAddress)))(32) <= NOT(PT(TO_INTEGER(UNSIGNED(writeAddress)))(32));
                END IF;
            END IF;
        END PROCESS writeTable;

END behaviour;
