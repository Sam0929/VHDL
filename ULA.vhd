LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Ula IS

    PORT ( 
           A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
           B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
           ADD_SUB : IN STD_LOGIC;  -- '1' PARA SUBTRAÇÃO, '0' PARA ADIÇÃO
           RESULT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           COUT : OUT STD_LOGIC
         );
			
END Ula;

ARCHITECTURE BEHAVIORAL OF Ula IS

    SIGNAL B_XOR : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL CARRY : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 
COMPONENT FullAdder IS

    PORT ( 
           CIN, X1, X2 : IN STD_LOGIC;
           S, COUT : OUT STD_LOGIC 
         );
			
END COMPONENT FullAdder;
	 
BEGIN

   PROCESS (B, ADD_SUB)
		BEGIN
		
        FOR i IN 0 TO 3 LOOP
		  
            B_XOR(i) <= B(i) XOR ADD_SUB;
				
        END LOOP;
		  
    END PROCESS;
	 
    CARRY(0) <= ADD_SUB;

    FA0: FullAdder PORT MAP(A(0), B_XOR(0), CARRY(0), RESULT(0), CARRY(1));
    FA1: FullAdder PORT MAP(A(1), B_XOR(1), CARRY(1), RESULT(1), CARRY(2));
    FA2: FullAdder PORT MAP(A(2), B_XOR(2), CARRY(2), RESULT(2), CARRY(3));
    FA3: FullAdder PORT MAP(A(3), B_XOR(3), CARRY(3), RESULT(3), COUT);
	 
END BEHAVIORAL;
