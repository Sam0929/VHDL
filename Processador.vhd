LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Processador IS
    PORT ( 
	        CLK : IN STD_LOGIC;
           RESET : IN STD_LOGIC;
           FUNCTION_CODE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
           DATA_IN : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
           DATA_OUT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
			  
			 );
			 
END Processador;

ARCHITECTURE BEHAVIORAL OF Processador IS

    SIGNAL R1, R2, R3, A, G: STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL LOAD_R1, LOAD_R2, LOAD_R3, LOAD_A, LOAD_G, ADD_SUB : STD_LOGIC;
    SIGNAL ULA_OUT : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL ULA_CARRY : STD_LOGIC;

    COMPONENT REGISTRADOR
	 
        PORT ( 
		         CLK : IN STD_LOGIC;
               LOAD : IN STD_LOGIC;
               D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
               Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
				  );
				  
    END COMPONENT;

    COMPONENT ULA
	 
        PORT ( 
					A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
               B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
               ADD_SUB : IN STD_LOGIC;
               RESULT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
				  );
				  
    END COMPONENT;

    COMPONENT UnidadeDeControle IS

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
			
	 END COMPONENT UnidadeDeControle;


BEGIN

    -- INSTANCIAÇÃO DOS REGISTRADORES
	 
    REG1 : REGISTRADOR PORT MAP(CLK, LOAD_R1, DATA_IN, R1);
    REG2 : REGISTRADOR PORT MAP(CLK, LOAD_R2, DATA_IN, R2);
    REG3 : REGISTRADOR PORT MAP(CLK, LOAD_R3, DATA_IN, R3);
	 RegA : REGISTRADOR port map(CLK, LOAD_A, R1, A); 
    RegG : REGISTRADOR port map(CLK, LOAD_G, A, G); 

    -- INSTANCIAÇÃO DA ULA
	 
    ULA0 : ULA PORT MAP(A, R2, ADD_SUB, ULA_OUT);

    -- INSTANCIAÇÃO DA MÁQUINA DE ESTADOS SWAP
    

    -- INSTANCIAÇÃO DA UNIDADE DE CONTROLE
    CONTROL_UNIT : UnidadeDeControle PORT MAP(CLK, RESET, FUNCTION_CODE, LOAD_R1, LOAD_R2, LOAD_R3, LOAD_A, LOAD_G, ADD_SUB);

    -- SAÍDA DE DADOS
	 
    DATA_OUT <= G;
	 
END BEHAVIORAL;