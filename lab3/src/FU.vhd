LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- FORWARDING UNIT ------------------------------------------------------------------------------------------------
ENTITY 	FU              IS
PORT	(rd_mem:        IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- destination register from operand store cycle
        rd_mem_valid:   IN  STD_LOGIC;                          -- validation signal for rd_mem
        rd_wb:          IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- destination register from write back cycle
        rd_wb_valid:    IN  STD_LOGIC;                          -- validation signal for rd_wb
        rs1:            IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- source register 1 from execute cycle
        rs1_valid:      IN  STD_LOGIC;                          -- validation signal for rs1
        rs2:            IN  STD_LOGIC_VECTOR (4 DOWNTO 0);      -- source register 2 from execute cycle
        rs2_valid:      IN  STD_LOGIC;                          -- validation signal for rs2
        load:           IN  STD_LOGIC;                          -- load instruction identifier
        rs1_fw:         OUT STD_LOGIC_VECTOR (1 DOWNTO 0);      -- rs1 forwarding
        rs2_fw:         OUT STD_LOGIC_VECTOR (1 DOWNTO 0)       -- rs2 forwarding
        );
END 	FU;
-- For the outputs:
--      00 --> no forwarding
--      01 --> ALU FORWARDING
--      10 --> MEM forwarding
--      11 --> no forwarding

-- ARCHITECTURE ---------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF FU IS

    SIGNAL fw1: STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL fw2: STD_LOGIC_VECTOR (1 DOWNTO 0);

	BEGIN

        FW: PROCESS(rd_mem, rd_mem_valid, rd_wb, rd_wb_valid, rs1, rs1_valid, rs2, rs2_valid, load)
        BEGIN
            -- DEFAULT OUTPUT VALUES ------------------------------------------------------------------------------
            fw1 <= "00";    -- No forwarding for rs1
            fw2 <= "00";    -- No forwarding for rs2
            -- RS1 FORWARDING -------------------------------------------------------------------------------------
            IF (rs1_valid = '1' AND load = '0') THEN
                IF (rs1 = rd_wb AND rd_wb_valid = '1') THEN
                    fw1 <= "10";    -- ALU forwarding for rs1
                END IF;
                IF (rs1 = rd_mem AND rd_mem_valid = '1') THEN
                    fw1 <= "01";    -- MEM forwarding for rs1
                END IF;
            END IF;
            -- RS2 FORWARDING -------------------------------------------------------------------------------------
            IF (rs2_valid = '1' AND load = '0') THEN
                IF (rs2 = rd_wb AND rd_wb_valid = '1') THEN
                    fw2 <= "10";    -- ALU forwarding for rs2
                END IF;
                IF (rs2 = rd_mem AND rd_mem_valid = '1') THEN
                    fw2 <= "01";    -- MEM forwarding for rs2
                END IF;
            END IF;
        END PROCESS FW;

        rs1_fw <= fw1;
        rs2_fw <= fw2;

END behaviour;
