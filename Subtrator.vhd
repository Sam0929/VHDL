LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY SUBTRATOR IS
PORT (
    X, Y: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
    D: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Resultado (diferença)
    COUT: OUT STD_LOGIC 
);
END SUBTRATOR;

ARCHITECTURE logic OF SUBTRATOR IS

    SIGNAL Y_invertido: STD_LOGIC_VECTOR(3 DOWNTO 0); -- Subtraendo invertido
	 
    SIGNAL Carry_inicial: STD_LOGIC := '1'; -- Carry-in para adicionar 1
    

    COMPONENT SOMADOR
    PORT (
        Cin: IN STD_LOGIC;
        X, Y: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout: OUT STD_LOGIC
    );
    END COMPONENT;

BEGIN

    -- Inverter Y para complemento de um 
    Y_invertido <= NOT Y; 

    stage0: SOMADOR PORT MAP (
	 
        Cin => Carry_inicial,
        X => X,
        Y => Y_invertido,
        S => D,
        Cout => COUT
    );

END logic;