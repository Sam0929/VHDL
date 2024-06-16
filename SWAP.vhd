LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SWAP IS
    PORT (
        CLOCK : IN STD_LOGIC;
        RESET : IN STD_LOGIC;
        START : IN STD_LOGIC;
        R1_IN : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        R2_IN : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        R1_OUT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        R2_OUT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        
    );
END SWAP;

ARCHITECTURE BEHAVIOR OF SWAP IS

    TYPE STATE_TYPE IS (IDLE, SWAP_1, SWAP_2, DONE_STATE);
	 
    SIGNAL STATE : STATE_TYPE := IDLE;
	 
BEGIN

    PROCESS (CLOCK, RESET)
	 
    BEGIN
	 
        IF RESET = '1' THEN
		  
            
            R1_OUT <= (OTHERS => '0');
            R2_OUT <= (OTHERS => '0');
				STATE <= IDLE;
				
        ELSIF RISING_EDGE(CLOCK) THEN
		  
            CASE STATE IS
				
                WHEN IDLE =>
					 
                    IF START = '1' THEN
						  
                        STATE <= SWAP_1;
								
                    END IF;
						  
                WHEN SWAP_1 =>
					 
                    R1_OUT <= R2_IN;
						  
                    STATE <= SWAP_2;
						  
                WHEN SWAP_2 =>
					 
                    R2_OUT <= R1_IN;
                    STATE <= IDLE;
						  
                WHEN OTHERS =>
					 
                    STATE <= IDLE;
						  
            END CASE;
				
        END IF;
		  
    END PROCESS;
	 
END BEHAVIOR;
