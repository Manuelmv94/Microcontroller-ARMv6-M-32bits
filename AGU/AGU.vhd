library IEEE;
use IEEE.std_logic_1164.all;

entity AGU is
	port ( 	CLK: in std_logic;
				Rdn,Rm: in STD_LOGIC_vector(31 downto 0);
				
				Rd: out STD_LOGIC_vector(31 downto 0) );
end AGU;


architecture RTL of AGU is
	
	signal Cout: std_logic;
	
component Sumador_32b is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		Cin: in std_LOGIC;
		SEL: in std_logic;
		S: out std_logic_vector(31 downto 0);
		Cout: out std_LOGIC);
end component;


begin


elemento_5: SUMador_32b port map(CLK,Rdn,Rm,'0','0',Rd,Cout);





end RTL;

