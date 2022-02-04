LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- HAZARD DETECTION UNIT ----------------------------------------------------------------------------------------------
ENTITY 	HDU             IS
PORT	(rd_ex:         IN  STD_LOGIC_VECTOR (4 DOWNTO 0);        -- destination register from the execution cycle
        rd_ex_valid:    IN  STD_LOGIC;                          -- validation signal for rd_ex
        rs1:            IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- source register 1
        rs1_valid:      IN  STD_LOGIC;                          -- validation signal for rs1
        rs2:            IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- source register 2
        rs2_valid:      IN  STD_LOGIC;                          -- validation signal for rs2
        load:           IN  STD_LOGIC;                          -- load instruction identifier
        fetchDisable:   OUT STD_LOGIC;                          -- fetch disable request
        pcDisable:      OUT STD_LOGIC;                          -- program counter disable request
        hazardBubble:   OUT STD_LOGIC                           -- bubble generation request
        );
END 	HDU;

-- ARCHITECTURE --------------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF HDU IS

    SIGNAL bubble:  STD_LOGIC;

	BEGIN

        HD: PROCESS(rd_ex, rd_ex_valid, rs1, rs1_valid, rs2, rs2_valid, load)
        BEGIN
            -- DEFAULT OUTPUT VALUES -----------------------------------------------------------------------------------
            bubble <= '0';
            IF (rd_ex_valid = '1' AND load = '1') THEN
                IF (rs1_valid = '1' AND rs1 = rd_ex) THEN
                    bubble <= '1';
                END IF;
                IF (rs2_valid = '1' AND rs2 = rd_ex) THEN
                    bubble <= '1';
                END IF;
            END IF;
        END PROCESS HD;

        fetchDisable <= bubble;
        pcDisable <= bubble;
        hazardBubble <= bubble;

END behaviour;
