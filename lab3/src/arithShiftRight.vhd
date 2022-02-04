LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- ARITHMETIC SHIFTER (RIGHT) --------------------------------------------------------------------------------------------------------
ENTITY 	arithShiftRight     IS
GENERIC	(N: 			    INTEGER := 32);	-- N must be equal or greater than 32
PORT 	(din:			    IN  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		nshift:				IN	INTEGER;
		dout: 		        OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
		);
END 	arithShiftRight;

-- BEHAVIOUR -------------------------------------------------------------------------------------------------------------------------
ARCHITECTURE behaviour OF arithShiftRight IS

	BEGIN

		ASR: PROCESS (nshift, din)
		BEGIN
			IF (nshift = 0) THEN
				dout <= din;
			ELSIF (nshift = 1) THEN
				dout <= din(N-1) & din(N-1 DOWNTO 1);
			ELSIF (nshift = 2) THEN
				dout <= din(N-1) & din(N-1) & din(N-1 DOWNTO 2);
			ELSIF (nshift = 3) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 3);
			ELSIF (nshift = 4) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 4);
			ELSIF (nshift = 5) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 5);
			ELSIF (nshift = 6) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 6);
			ELSIF (nshift = 7) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 7);
			ELSIF (nshift = 8) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 8);
			ELSIF (nshift = 9) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 9);
			ELSIF (nshift = 10) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 10);
			ELSIF (nshift = 11) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 11);
			ELSIF (nshift = 12) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 12);
			ELSIF (nshift = 13) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 13);
			ELSIF (nshift = 14) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 14);
			ELSIF (nshift = 15) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 15);
			ELSIF (nshift = 16) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 16);
			ELSIF (nshift = 17) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 17);
			ELSIF (nshift = 18) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 18);
			ELSIF (nshift = 19) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 19);
			ELSIF (nshift = 20) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 20);
			ELSIF (nshift = 21) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 21);
			ELSIF (nshift = 22) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 22);
			ELSIF (nshift = 23) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 23);
			ELSIF (nshift = 24) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 24);
			ELSIF (nshift = 25) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 25);
			ELSIF (nshift = 26) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 26);
			ELSIF (nshift = 27) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 27);
			ELSIF (nshift = 28) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 28);
			ELSIF (nshift = 29) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 29);
			ELSIF (nshift = 30) THEN
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 30);
			ELSE
				dout <= din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
				        & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1) & din(N-1)
						& din(N-1) & din(N-1) & din(N-1) & din(N-1 DOWNTO 31);
			END IF;

		END PROCESS ASR;

END behaviour;
