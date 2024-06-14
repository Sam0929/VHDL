LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SWAP_FSM IS

    PORT ( 
			  
			  CLK : IN STD_LOGIC;
           START : IN STD_LOGIC;
           L : INOUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           P : INOUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           DONE : OUT STD_LOGIC
			  
			 );
			  
END SWAP_FSM;

ARCHITECTURE BEHAVIORAL OF SWAP_FSM IS

    TYPE STATE_TYPE IS (IDLE, SWAP);
    SIGNAL STATE, NEXT_STATE : STATE_TYPE;
    SIGNAL AUX : STD_LOGIC_VECTOR(3 DOWNTO 0);  -- REGISTRADOR AUXILIAR
	 
BEGIN

    PROCESS (CLK)
	 
    BEGIN
	 
        IF RISING_EDGE(CLK) THEN
		  
            IF START = '1' THEN
				
                STATE <= NEXT_STATE;
					 
            ELSE
				
                STATE <= IDLE;
					 
            END IF;
				
        END IF;
		  
    END PROCESS;

    PROCESS (STATE, L, P)
	 
    BEGIN
	 
        CASE STATE IS
		  
            WHEN IDLE =>
				
                IF START = '1' THEN
					 
                    NEXT_STATE <= SWAP;
						  
                ELSE
					 
                    NEXT_STATE <= IDLE;
						  
                END IF;
					 
                DONE <= '0';
					 
            WHEN SWAP =>
				
					 AUX <= P; 
                P <= L;     
                L <= AUX;
					 
                NEXT_STATE <= IDLE;
					 
                DONE <= '1';

            WHEN OTHERS =>
				
                NEXT_STATE <= IDLE;
                DONE <= '0';
					 
        END CASE;
    END PROCESS;
END BEHAVIORAL;
