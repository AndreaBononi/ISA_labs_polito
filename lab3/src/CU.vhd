LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- CONTROL UNIT -------------------------------------------------------------
ENTITY 	CU 		   IS
PORT	(opcode:   IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
        funct3:    IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        funct7:    IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
        regWrite:  OUT STD_LOGIC;
        writeSel:  OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        writeEn:   OUT STD_LOGIC;
        readEn:    OUT STD_LOGIC;
        branch:    OUT STD_LOGIC;
        load:      OUT STD_LOGIC;
        isRS1:     OUT STD_LOGIC;
        isRS2:     OUT STD_LOGIC;
        jump:      OUT STD_LOGIC;
        aluOp:     OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        aluSel2:   OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        aluSel1:   OUT STD_LOGIC
        );
END 	CU;

-- ARCHITECTURE -----------------------------------------------------------------
ARCHITECTURE behaviour OF CU IS

    -- OPCODES ------------------------------------------------------------------
    CONSTANT OP_IMM:    STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010011";
    CONSTANT OP:        STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110011";
    CONSTANT BRNC:      STD_LOGIC_VECTOR(6 DOWNTO 0) := "1100011";
    CONSTANT JAL:       STD_LOGIC_VECTOR(6 DOWNTO 0) := "1101111";
    CONSTANT LUI:       STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110111";
    CONSTANT AUIPC:     STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010111";
    CONSTANT LD:        STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000011";
    CONSTANT STORE:     STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100011";
    -- FUNCT3 -------------------------------------------------------------------
    CONSTANT F3_ADDI:   STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    CONSTANT F3_ANDI:   STD_LOGIC_VECTOR(2 DOWNTO 0) := "111";
    CONSTANT F3_ADD:    STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    CONSTANT F3_SLT:    STD_LOGIC_VECTOR(2 DOWNTO 0) := "010";
    CONSTANT F3_XOR:    STD_LOGIC_VECTOR(2 DOWNTO 0) := "100";
    CONSTANT F3_BEQ:    STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    CONSTANT F3_LOAD:   STD_LOGIC_VECTOR(2 DOWNTO 0) := "010";
    CONSTANT F3_STORE:  STD_LOGIC_VECTOR(2 DOWNTO 0) := "010";
    CONSTANT F3_SRAI:   STD_LOGIC_VECTOR(2 DOWNTO 0) := "101";
    -- FUNCT7 -------------------------------------------------------------------
    CONSTANT F7_ADD_SLT_XOR:    STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
    CONSTANT F7_SRAI:           STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100000";

	BEGIN

        CTRL: PROCESS(opcode, funct3, funct7)
        BEGIN
            -- DEFAULT VALES (BUBBLE) -------------------------------------------
            regWrite  <= '0';
            writeSel  <= "00";  -- ALU output
            writeEn   <= '0';
            readEn    <= '0';
            branch    <= '0';
            isRS1     <= '0';
            isRS2     <= '0';
            jump      <= '0';
            aluOp     <= "000"; -- ADD
            aluSel2   <= "000"; -- RF output
            aluSel1   <= '0';   -- RF output
            load      <= '0';
            -- OPCODE CHECK -----------------------------------------------------
            IF (opcode = OP_IMM) THEN
                IF (funct3 = F3_ADDI) THEN
                    regWrite  <= '1';
                    isRS1     <= '1';
                    aluOp     <= "000";  -- ADD
                    aluSel2   <= "001";  -- I_IMM
                ELSIF (funct3 = F3_ANDI) THEN
                    regWrite  <= '1';
                    isRS1     <= '1';
                    aluOp     <= "010";  -- AND
                    aluSel2  <= "001";   -- I_IMM
                ELSIF (funct3 = F3_SRAI) THEN
                    IF (funct7 = F7_SRAI) THEN
                    regWrite  <= '1';
                    isRS1     <= '1';
                    aluOp     <= "001";  -- ARITHMETIC SHIFT
                    aluSel2   <= "011";  -- SH_IMM
                    END IF;
                END IF;
            ELSIF (opcode = OP) THEN
                IF (funct7 = F7_ADD_SLT_XOR) THEN
                    IF (funct3 = F3_ADD) THEN
                        regWrite  <= '1';
                        isRS1     <= '1';
                        isRS2     <= '1';
                        aluOp     <= "000"; -- ADD
                    ELSIF (funct3 = F3_SLT) THEN
                        regWrite  <= '1';
                        isRS1     <= '1';
                        isRS2     <= '1';
                        aluOp     <= "100"; -- COMP
                    ELSIF (funct3 = F3_XOR) THEN
                        regWrite  <= '1';
                        isRS1     <= '1';
                        isRS2     <= '1';
                        aluOp     <= "011"; -- XOR
                    END IF;
                END IF;
            ELSIF (opcode = BRNC) THEN
                IF (funct3 = F3_BEQ) THEN
                    branch    <= '1';
                    isRS1     <= '1';
                    isRS2     <= '1';
                    aluOp     <= "100"; -- COMP
                END IF;
            ELSIF (opcode = JAL) THEN
                regWrite  <= '1';
                writeSel  <= "11";  -- PC+4
                jump      <= '1';
            ELSIF (opcode = LUI) THEN
                regWrite  <= '1';
                writeSel  <= "00";  -- U_IMM
				aluSel2  <= "010";  -- U_IMM
				aluOp     <= "111"; -- WIRE	
            ELSIF (opcode = AUIPC) THEN
                regWrite  <= '1';
                aluOp     <= "000"; -- ADD
                aluSel2   <= "010"; -- U_IMM
                aluSel1   <= '1';   -- RF output
            ELSIF (opcode = LD) THEN
                IF (funct3 = F3_LOAD) THEN
                    regWrite  <= '1';
                    writeSel  <= "01";  -- ALU output
                    readEn    <= '1';
                    isRS1     <= '1';
                    aluOp     <= "000"; -- ADD
                    aluSel2   <= "001";  -- I_IMM
                    load      <= '1';
                END IF;
            ELSIF (opcode = STORE) THEN
                IF (funct3 = F3_STORE) THEN
                    writeEn   <= '1';
                    isRS1     <= '1';
                    isRS2     <= '1';
                    aluOp     <= "000";  -- ADD
                    aluSel2   <= "100";  -- S_IMM
                    aluSel1   <= '0';    -- RF output
                END IF;
            END IF;
        END PROCESS CTRL;

END behaviour;
