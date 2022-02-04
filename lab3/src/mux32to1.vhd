LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- MULTIPLEXER 32TO1 N BIT ----------------------------------------------------------------------------------
ENTITY 	mux32to1 	IS
GENERIC	(N: 		INTEGER := 32);
PORT	(sel:		IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		in_00000: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_00001: 	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_00010:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_00011:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_00100:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_00101:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_00110:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_00111:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_01000:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_01001:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_01010:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_01011:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_01100:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_01101:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_01110:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_01111:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_10000:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_10001:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_10010:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_10011:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_10100:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_10101:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_10110:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_10111:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_11000:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_11001:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_11010:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_11011:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_11100:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_11101:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_11110:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		in_11111:	IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		muxout  : 	OUT STD_LOGIC_VECTOR (N-1  DOWNTO 0));
END 	mux32to1;


-- ARCHITECTURE ---------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF mux32to1 IS

	SIGNAL res: STD_LOGIC_VECTOR (N-1 DOWNTO 0);

	BEGIN

		MYSEL: PROCESS	(in_00000, in_00001, in_00010, in_00011, in_00100, in_00101, in_00110, in_00111,
						in_01000, in_01001, in_01010, in_01011, in_01100, in_01101, in_01110, in_01111,
						in_10000, in_10001, in_10010, in_10011, in_10100, in_10101, in_10110, in_10111,
						in_11000, in_11001, in_11010, in_11011, in_11100, in_11101, in_11110, in_11111, sel)
		BEGIN
			IF (sel = "00000") THEN
				res <= in_00000;
			ELSIF (sel = "00001") THEN
				res <= in_00001;
			ELSIF (sel = "00010") THEN
				res <= in_00010;
			ELSIF (sel = "00011") THEN
				res <= in_00011;
			ELSIF (sel = "00100") THEN
				res <= in_00100;
			ELSIF (sel = "00101") THEN
				res <= in_00101;
			ELSIF (sel = "00110") THEN
				res <= in_00110;
			ELSIF (sel = "00111") THEN
				res <= in_00111;
			ELSIF (sel = "01000") THEN
				res <= in_01000;
			ELSIF (sel = "01001") THEN
				res <= in_01001;
			ELSIF (sel = "01010") THEN
				res <= in_01010;
			ELSIF (sel = "01011") THEN
				res <= in_01011;
			ELSIF (sel = "01100") THEN
				res <= in_01100;
			ELSIF (sel = "01101") THEN
				res <= in_01101;
			ELSIF (sel = "01110") THEN
				res <= in_01110;
			ELSIF (sel = "01111") THEN
				res <= in_01111;
			ELSIF (sel = "10000") THEN
				res <= in_10000;
			ELSIF (sel = "10001") THEN
				res <= in_10001;
			ELSIF (sel = "10010") THEN
				res <= in_10010;
			ELSIF (sel = "10011") THEN
				res <= in_10011;
			ELSIF (sel = "10100") THEN
				res <= in_10100;
			ELSIF (sel = "10101") THEN
				res <= in_10101;
			ELSIF (sel = "10110") THEN
				res <= in_10110;
			ELSIF (sel = "10111") THEN
				res <= in_10111;
			ELSIF (sel = "11000") THEN
				res <= in_11000;
			ELSIF (sel = "11001") THEN
				res <= in_11001;
			ELSIF (sel = "11010") THEN
				res <= in_11010;
			ELSIF (sel = "11011") THEN
				res <= in_11011;
			ELSIF (sel = "11100") THEN
				res <= in_11100;
			ELSIF (sel = "11101") THEN
				res <= in_11101;
			ELSIF (sel = "11110") THEN
				res <= in_11110;
			ELSE
				res <= in_11111;
			END IF;
		END PROCESS MYSEL;

		muxout <= res;

END behaviour;
