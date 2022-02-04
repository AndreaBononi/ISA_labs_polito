LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- MULTIPLEXER 2TO1 N BIT ---------------------------------------------------------------------
ENTITY 	mux2to1 IS
GENERIC	(N: 	INTEGER := 8);
PORT	(sel:	IN  STD_LOGIC;
		in0: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in1: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		muxout: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
		);
END 	mux2to1;


-- ARCHITECTURE -------------------------------------------------------------------------------
ARCHITECTURE behaviour OF mux2to1 IS

	SIGNAL res: STD_LOGIC_VECTOR (N-1 DOWNTO 0);

	BEGIN

	MYSEL: PROCESS(in0, in1, sel)
	BEGIN
		IF (sel = '0') THEN
			res <= in0;
		ELSE
			res <= in1;
		END IF;
	END PROCESS MYSEL;

	muxout <= res;

END behaviour;
