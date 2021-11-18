LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- D Flip Flop


ENTITY D_FF IS
	PORT (clk:		IN STD_LOGIC;
			enable:	IN STD_LOGIC;
			clearN: 	IN STD_LOGIC;
			dffIN: 	IN STD_LOGIC;
			dffOUT: 	OUT STD_LOGIC);
END D_FF;


ARCHITECTURE behaviour OF D_FF IS
	
	BEGIN
		PROCESS (clk, clearN, enable)
		BEGIN
			IF (RISING_EDGE (clk)) THEN 
				IF (clearN = '0') THEN dffOUT <= '0';
				ELSIF (enable = '1') THEN dffOUT <= dffIN;
            END IF;
			END IF;
		END PROCESS;
	
END behaviour;