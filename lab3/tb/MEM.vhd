LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- MEMORY -------------------------------------------------------------------------------------
ENTITY 	MEM             IS
GENERIC	(N_DATA: 	    INTEGER := 32);
PORT	(clk:           IN  STD_LOGIC;
        clearN:         IN  STD_LOGIC;
        readEn:         IN  STD_LOGIC;
        writeEn:        IN  STD_LOGIC;
        mem_addr:       IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
        mem_in:         IN  STD_LOGIC_VECTOR (N_DATA-1 DOWNTO 0);
        mem_out:        OUT STD_LOGIC_VECTOR (N_DATA-1 DOWNTO 0)
		);
END 	MEM;


-- BEHAVIOUR ----------------------------------------------------------------------------------
ARCHITECTURE behaviour OF MEM IS

    TYPE MEMORY IS ARRAY(0 TO 255) OF STD_LOGIC_VECTOR(N_DATA-1 DOWNTO 0);
    SIGNAL MYMEM: MEMORY;
	SIGNAL myaddr: INTEGER;
	SIGNAL myout: STD_LOGIC_VECTOR (N_DATA-1 DOWNTO 0);

    BEGIN

		myaddr <= TO_INTEGER(UNSIGNED(mem_addr(7 DOWNTO 0)));

		MyMemory: PROCESS (clk, clearN, writeEn, readEn, mem_in, myaddr)
        BEGIN

            IF (rising_edge(clk)) THEN
                IF (clearN = '0') THEN
                    MYMEM <= (OTHERS => (OTHERS => '0'));
                ELSIF (writeEn = '1') THEN
                    MYMEM(myaddr) <= mem_in;
                END IF;
                IF (readEn = '1') THEN
                    myout <= MYMEM(myaddr);
                END IF;
            END IF;

        END PROCESS MyMemory;

		mem_out <= myout;

END behaviour;
