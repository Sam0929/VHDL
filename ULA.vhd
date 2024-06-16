LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ULA IS
PORT (
    A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Entradas de 4 bits
    ADD_SUB: IN STD_LOGIC; -- Código de operação
    F: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Resultado da operação
	 CARRY_OUT: OUT STD_LOGIC
);
END ULA;

ARCHITECTURE logic OF ULA IS

    -- Componentes definidos separadamente
   
    COMPONENT SOMADOR
    PORT (
        Cin: IN STD_LOGIC;
        X, Y: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout: OUT STD_LOGIC
    );
    END COMPONENT;

    COMPONENT SUBTRATOR
    PORT (
        X, Y: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        D: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        COUT: OUT STD_LOGIC
    );
    END COMPONENT;
	 
	 signal SOMADORr, SUBTRATORr: STD_LOGIC_VECTOR (3 downto 0);
	 

BEGIN
    
	 
		
		U1: SOMADOR PORT MAP ('0', A, B, SOMADORr, CARRY_OUT); 
		
		U2: SUBTRATOR PORT MAP (A, B, SUBTRATORr, CARRY_OUT); 

	 
    PROCESS(ADD_SUB, SOMADORr, SUBTRATORr)
	 
    BEGIN
	 
        CASE ADD_SUB IS
		 

            WHEN '0' => -- SOMA
				
					 F <= SOMADORr;

            WHEN '1' => -- SUBTRAÇÃO
						
					 F <= SUBTRATORr;

            WHEN OTHERS =>
				
                F <= (OTHERS => '0'); -- Resultado padrão
					 
        END CASE;
		  
    END PROCESS;
	 
END logic;

