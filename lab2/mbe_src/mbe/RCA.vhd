LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- RIPPLE CARRY ADDER N BITS ---------------------------------------------------------------------
ENTITY  RCA     IS
GENERIC (N:     INTEGER := 8);
PORT    (in1:   IN  STD_LOGIC_VECTOR (N-1 downto 0);
        in2:    IN  STD_LOGIC_VECTOR (N-1 downto 0);
		cin:    IN  STD_LOGIC;
		res:    OUT STD_LOGIC_VECTOR (N-1 downto 0));
END     RCA;

-- ARCHITECTURE ----------------------------------------------------------------------------------
ARCHITECTURE Behaviour OF RCA IS

    -- FULL ADDER --------------------------------------------------------------------------------
    COMPONENT 	FA
	PORT		(a:		IN	STD_LOGIC;
		  		b:		IN	STD_LOGIC;
				cin:	IN	STD_LOGIC;
		  		sum:	OUT	STD_LOGIC;
		  		cout:	OUT	STD_LOGIC);
	END 		COMPONENT;

    -- SIGNALS ----------------------------------------------------------------------------------
	SIGNAL C: STD_LOGIC_VECTOR (N downto 0);
	SIGNAL O: STD_LOGIC_VECTOR (N-1 downto 0);

	BEGIN

		C(0) <= cin;
		G1: FOR i IN 0 TO N-1 GENERATE
			FullAdder: FA PORT MAP(in1(i), in2(i), C(i), O(i), C(i+1));
		END GENERATE;
		res <= O;

END Behaviour;
