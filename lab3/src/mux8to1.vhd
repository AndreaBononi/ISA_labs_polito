LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- MULTIPLEXER 8TO1 N BIT ---------------------------------------------------------------------
ENTITY 	mux8to1     IS
GENERIC	(N: 	    INTEGER := 8);
PORT	(sel:	    IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		in_000: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_001: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
		in_010: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
		in_011:	    IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
        in_100:	    IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
        in_101: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
		in_110: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
		in_111:	    IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
		muxout:     OUT STD_LOGIC_VECTOR (N-1  DOWNTO 0)
		);
END 	mux8to1;


-- ARCHITECTURE -------------------------------------------------------------------------------
ARCHITECTURE behaviour OF mux8to1 IS

	SIGNAL res: STD_LOGIC_VECTOR (N-1 DOWNTO 0);

	BEGIN

	MYSEL: PROCESS(in_000, in_001, in_010, in_011, in_100, in_101, in_110, in_111, sel)
	BEGIN
		IF (sel = "000") THEN
			res <= in_000;
		ELSIF (sel = "001") THEN
			res <= in_001;
		ELSIF (sel = "010") THEN
			res <= in_010;
        ELSIF (sel = "011") THEN
    		res <= in_011;
        ELSIF (sel = "100") THEN
    		res <= in_100;
    	ELSIF (sel = "101") THEN
    		res <= in_101;
        ELSIF (sel = "110") THEN
        	res <= in_110;
		ELSE
			res <= in_111;
		END IF;
	END PROCESS MYSEL;

	muxout <= res;

END behaviour;
