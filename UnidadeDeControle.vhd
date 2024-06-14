LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY UnidadeDeControle IS

    PORT ( 
           CLK : IN STD_LOGIC;
			  RESET : IN STD_LOGIC;
           FUNCTION_CODE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
           LOAD_R1 : OUT STD_LOGIC;
           LOAD_R2 : OUT STD_LOGIC;
           LOAD_R3 : OUT STD_LOGIC;
			  LOAD_A  : OUT STD_LOGIC;
			  LOAD_G  : OUT STD_LOGIC;
           ADD_SUB : OUT STD_LOGIC
         );
			
END UnidadeDeControle;

ARCHITECTURE BEHAVIORAL OF UnidadeDeControle IS

TYPE STATE_TYPE IS (IDLE, S1, S2, S3, S4);
SIGNAL STATE : STATE_TYPE := IDLE;



BEGIN

	PROCESS (CLK,RESET)
	
	BEGIN 
	
    IF RESET = '1' THEN
        STATE <= IDLE;
		  
    ELSIF RISING_EDGE(CLK) THEN
	 
        CASE STATE IS
		  
            WHEN IDLE =>
				
                STATE <= S1;
					 
            WHEN S1 =>
				
                CASE FUNCTION_CODE IS
					 
                    WHEN "001" =>
						  
                        ADD_SUB <= '1';  -- SUB
                        LOAD_A <= '1';
                        STATE <= S4;
								
                    WHEN "010" =>
						  
                        ADD_SUB <= '0';  -- ADD
                        LOAD_A <= '1';
                        STATE <= S4;
								
                    WHEN "011" =>        -- SWAP
                        LOAD_R3 <= '1';
                        STATE <= S3;
								
                    WHEN "101" =>        -- LOAD R1
                        LOAD_R1 <= '1';
                        STATE <= S2;
								
                    WHEN "110" =>        -- LOAD R2
                        LOAD_R2 <= '1';
                        STATE <= S2;
								
                    WHEN "111" =>        -- LOAD R3
                        LOAD_R3 <= '1';
                        STATE <= S2;
                    
                    WHEN OTHERS =>
						  
                        STATE <= IDLE;
								
                END CASE;
					 
            WHEN S2 =>
				
                LOAD_R1 <= '0';
                LOAD_R2 <= '0';
                LOAD_R3 <= '0';
                STATE <= IDLE;
					 
            WHEN S3 =>
				
                LOAD_R3 <= '0';
                STATE <= IDLE;
					 
            WHEN S4 =>
				
                LOAD_A <= '0';
                LOAD_G <= '1';
                STATE <= IDLE;
					 
            WHEN OTHERS =>
				
                STATE <= IDLE;
					 
        END CASE;
		  
    END IF;
	 
END PROCESS;


END BEHAVIORAL;
