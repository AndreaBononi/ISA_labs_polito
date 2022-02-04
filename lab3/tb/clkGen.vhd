LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- CLOCK AND RESET GENERATOR --------------------------------------------------------
ENTITY	clkGen 			IS
GENERIC	(clockperiod: 	TIME := 10 ns;	-- Clock period
		resetStop: 		TIME := 15 ns	-- Initial reset period
		);
PORT	(clk: 			OUT STD_LOGIC;
		rstN: 			OUT STD_LOGIC
		);
END 	clkGen;


-- BEHAVIOUR ------------------------------------------------------------------------
ARCHITECTURE behaviour OF clkGen IS

	SIGNAL myclk: STD_LOGIC := '0';

	BEGIN

		-- Clock Generation Process -------------------------------------------------
		clockGen: PROCESS
		BEGIN
			myclk <= NOT myclk;
			WAIT FOR clockPeriod/2;
		END PROCESS clockGen;
		clk <= myclk;

		-- Reset Generation Process -------------------------------------------------
		resetGen: PROCESS
		BEGIN
			rstN <= '0';
			WAIT FOR resetStop;
			rstN <= '1';
			WAIT;
		END PROCESS resetGen;

END behaviour;
