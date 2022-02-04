LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- MULTIPLEXER 4TO1 N BIT ---------------------------------------------------------------------
ENTITY 	mux4to1 IS
GENERIC	(N: 	INTEGER := 8);
PORT	(sel:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		in_00: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_01: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
		in_10: 	IN  STD_LOGIC_VECTOR (N-1  DOWNTO 0);
		in_11:	IN 	STD_LOGIC_VECTOR (N-1  DOWNTO 0);
		muxout: OUT STD_LOGIC_VECTOR (N-1  DOWNTO 0)
		);
END 	mux4to1;


-- ARCHITECTURE -------------------------------------------------------------------------------
ARCHITECTURE behaviour OF mux4to1 IS

	SIGNAL res: STD_LOGIC_VECTOR (N-1 DOWNTO 0);

	BEGIN

	MYSEL: PROCESS(in_00, in_01, in_10, in_11, sel)
	BEGIN
		IF (sel = "00") THEN
			res <= in_00;
		ELSIF (sel = "01") THEN
			res <= in_01;
		ELSIF (sel = "10") THEN
			res <= in_10;
		ELSE
			res <= in_11;
		END IF;
	END PROCESS MYSEL;

	muxout <= res;

END behaviour;
