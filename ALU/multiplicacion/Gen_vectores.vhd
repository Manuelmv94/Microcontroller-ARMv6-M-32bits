library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity Gen_Vectores is
	port ( 	CLK: in std_logic;
				A,B: in STD_LOGIC_vector(31 downto 0);
				Av,Sv,Pv: out STD_LOGIC_vector(64 downto 0) );

end Gen_Vectores;

architecture RTL of Gen_Vectores is
	

signal An_s:std_logic_vector(31 downto 0);

begin


process(A)
begin

	An_s<=NOT(A)+'1';

end process;	
	
process(clk)
begin
if (rising_edge(CLK)) then
	Av<=A & (32 downto 0 =>'0');
	Sv<=An_s & (32 downto 0 =>'0');
	Pv<=(63 downto 32 =>'0')&B&'0';
else null;
end if;
end process;
	
end RTL;

