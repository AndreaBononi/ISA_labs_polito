LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- FULL ADDER ---------------------------------------------------------------
ENTITY  FA      IS
PORT	(a:		IN	STD_LOGIC;
        b:		IN	STD_LOGIC;
        cin:	IN	STD_LOGIC;
        sum:	OUT	STD_LOGIC;
        cout:	OUT	STD_LOGIC);
END     FA;

-- ARCHITECTURE -------------------------------------------------------------
ARCHITECTURE Behaviour OF FA IS

    -- HALF ADDER -----------------------------------------------------------
    COMPONENT 	HA
    PORT		(a:		IN	STD_LOGIC;
                b:		IN	STD_LOGIC;
                sum:	OUT	STD_LOGIC;
                c:		OUT	STD_LOGIC);
    END 		COMPONENT;

    -- SIGNALS --------------------------------------------------------------
	SIGNAL HA1_sum, HA1_cout, HA2_sum, HA2_cout: STD_LOGIC;

	BEGIN
    
		HA1: HA PORT MAP (a, b, HA1_sum, HA1_cout);
        HA2: HA PORT MAP (HA1_sum, cin, HA2_sum, HA2_cout);
        sum <= HA2_sum;
        cout <= HA1_cout OR HA2_cout;

END Behaviour;
