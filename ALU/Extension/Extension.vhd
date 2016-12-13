library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Extension is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		SEL: in std_logic_vector(1 downto 0);
		
		S: out std_logic_vector(31 downto 0)		
		);
end Extension;
	
architecture rtl of extension is

begin
Process(CLK) begin
	if CLK'EVENT AND CLK='1'THEN
		
		case SEL is
			when "00" => --SXTH
				S(15 DOWNTO 0)<=A(15 DOWNTO 0);
				S(31 DOWNTO 16)<=(31 DOWNTO 16=>A(15));
			when "01" => --SXTB
				S(7 DOWNTO 0)<=A(7 DOWNTO 0);
				S(31 DOWNTO 8)<=(31 DOWNTO 8=>A(7));
			when "10" => --UXTH
				S(15 DOWNTO 0)<=A(15 DOWNTO 0);
				S(31 DOWNTO 16)<=(31 DOWNTO 16=>'0');
			when "11" => --UXTB
				S(7 DOWNTO 0)<=A(7 DOWNTO 0);
				S(31 DOWNTO 8)<=(31 DOWNTO 8=>'0');
			when others  => S<=A;
		end case;
		
		
			
	else null;
	end if;
end process;


end RTL;