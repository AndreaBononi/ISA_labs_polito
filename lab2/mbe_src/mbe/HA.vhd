LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- HALF ADDER -----------------------------------------------------------
ENTITY 	HA    IS
PORT	(a:		IN	STD_LOGIC;
        b:		IN	STD_LOGIC;
        sum:	OUT	STD_LOGIC;
        c:		OUT	STD_LOGIC);
END 	HA;

-- ARCHITECTURE -------------------------------------------------------------
ARCHITECTURE Behaviour OF HA IS

    -- SIGNALS --------------------------------------------------------------
	SIGNAL HA1_sum, HA1_cout, HA2_sum, HA2_cout: STD_LOGIC;

	BEGIN

        sum <= a XOR b;
        c <= a AND b;

END Behaviour;
