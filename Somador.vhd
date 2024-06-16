LIBRARY ieee;

USE ieee.std_logic_1164.all;

ENTITY SOMADOR IS

PORT ( 
		
		Cin : IN STD_LOGIC; 
		X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
		S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		Cout : OUT STD_LOGIC 
		
		);
			
END SOMADOR;

ARCHITECTURE logic OF SOMADOR IS

SIGNAL C : STD_LOGIC_VECTOR(1 TO 3);

COMPONENT FullAdder 

	PORT ( Cin, x1, x2 : IN STD_LOGIC;
	
			S, Cout : OUT STD_LOGIC );
				
END COMPONENT;

BEGIN

	stage0: FullAdder PORT MAP ( Cin, X(0), Y(0),  S(0), C(1) );
	stage1: FullAdder PORT MAP ( C(1), X(1), Y(1), S(1), C(2) );
	stage2: FullAdder PORT MAP ( C(2), X(2), Y(2), S(2), C(3) );
	stage3: FullAdder PORT MAP ( C(3), X(3), Y(3), S(3), Cout );
	
END logic;
