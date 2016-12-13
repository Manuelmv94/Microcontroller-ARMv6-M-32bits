library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ANDoperation is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		S: out std_logic_vector(31 downto 0)
		);
end ANDoperation;
	
architecture RTL of ANDoperation is



begin
Process(CLK) begin
	if CLK'EVENT AND CLK='1'THEN
		S<=A AND B;
	else null;
	end if;
end process;


end RTL;