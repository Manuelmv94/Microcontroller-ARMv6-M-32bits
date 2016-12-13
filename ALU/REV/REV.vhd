library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity REV is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);

		SEL: in std_logic_vector(1 downto 0);
		
		S: out std_logic_vector(31 downto 0)		
		);
end REV;
	
architecture rtl of REV is

begin
Process(CLK) begin
	if CLK'EVENT AND CLK='1'THEN
		
		case SEL is
			when "00" => 
				S(31 DOWNTO 24)<=A(7 DOWNTO 0);
				S(23 DOWNTO 16)<=A(15 DOWNTO 8);
				S(15 DOWNTO 8)<=A(23 DOWNTO 16);
				S(7 DOWNTO 0)<=A(31 DOWNTO 24);
			when "01" => 
				S(31 DOWNTO 24)<=A(23 DOWNTO 16);
				S(23 DOWNTO 16)<=A(31 DOWNTO 24);
				S(15 DOWNTO 8)<=A(7 DOWNTO 0);
				S(7 DOWNTO 0)<=A(15 DOWNTO 8);
			when "11" => 
				S(31 DOWNTO 16)<=(31 DOWNTO 16 =>A(7));
				S(15 DOWNTO 8)<=A(7 DOWNTO 0);
				S(7 DOWNTO 0)<=A(15 DOWNTO 8);
			when others  => S<=A;
		end case;
		
		
			
	else null;
	end if;
end process;


end RTL;