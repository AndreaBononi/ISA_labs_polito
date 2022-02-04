LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- BUBBLE MULTIPLEXER ---------------------------------------------------------------------
ENTITY 	bubbleMultiplexer   IS
PORT	(bubble:            IN  STD_LOGIC;
        regWrite:	        IN  STD_LOGIC;
		writeSel: 	        IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		writeEn: 	        IN  STD_LOGIC;
        branch:             IN  STD_LOGIC;
        load:               IN  STD_LOGIC;
        readEn:             IN  STD_LOGIC;
        isRS1:              IN  STD_LOGIC;
        isRS2:              IN  STD_LOGIC;
        jump:               IN  STD_LOGIC;
        ALUsel1:            IN  STD_LOGIC;
        ALUsel2:            IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        ALUop:              IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        regWrite_out:       OUT STD_LOGIC;
        writeSel_out: 	    OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        writeEn_out: 	    OUT STD_LOGIC;
        branch_out:         OUT STD_LOGIC;
        load_out:           OUT STD_LOGIC;
        readEn_out:         OUT STD_LOGIC;
        isRS1_out:          OUT STD_LOGIC;
        isRS2_out:          OUT STD_LOGIC;
        jump_out:           OUT STD_LOGIC;
        ALUsel1_out:        OUT STD_LOGIC;
        ALUsel2_out:        OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        ALUop_out:          OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
		);
END 	bubbleMultiplexer;
-- bubble = 0 --> the outputs are exactly equal to the inputs
-- bubble = 1 --> the outputs correspond to their disabled value


-- ARCHITECTURE -------------------------------------------------------------------------------
ARCHITECTURE behaviour OF bubbleMultiplexer IS

	BEGIN

    BM: PROCESS (bubble, regWrite, writeSel, writeEn, branch, readEn, isRS1, isRS2, jump, ALUsel1, ALUsel2, ALUop, load)
    BEGIN
        IF (bubble = '1') THEN
            regWrite_out <= '0';
            writeSel_out <= "00";
            writeEn_out <= '0';
            branch_out <= '0';
            readEn_out <= '0';
            isRS1_out <= '0';
            isRS2_out <= '0';
            jump_out <= '0';
            ALUsel1_out <= '0';
            ALUsel2_out <= "000";
            ALUop_out <= "000";
            load_out <= '0';
        ELSE
            regWrite_out <= regWrite;
            writeSel_out <= writeSel;
            writeEn_out <= writeEn;
            branch_out <= branch;
            readEn_out <= readEn;
            isRS1_out <= isRS1;
            isRS2_out <= isRS2;
            jump_out <= jump;
            ALUsel1_out <= ALUsel1;
            ALUsel2_out <= ALUsel2;
            ALUop_out <= ALUop;
            load_out <= load;
        END IF;
    END PROCESS BM;

END behaviour;
