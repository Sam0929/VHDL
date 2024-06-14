LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY REGISTRADOR IS

    PORT ( 
           CLK, LOAD : IN STD_LOGIC;
           D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
           Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) 
         );
			
END REGISTRADOR;

ARCHITECTURE BEHAVIORAL OF REGISTRADOR IS

BEGIN

    PROCESS (CLK)
    BEGIN
	 
        IF RISING_EDGE(CLK) THEN
            IF LOAD = '1' THEN
                Q <= D;
            END IF;
        END IF;
    END PROCESS;

END BEHAVIORAL;
