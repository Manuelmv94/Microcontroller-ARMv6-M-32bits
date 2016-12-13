library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Iter is
	port ( 	CLK: in std_logic;
				Av,Sv,Pv: in STD_LOGIC_vector(64 downto 0);
				Avn,Svn,Pvn: out STD_LOGIC_vector(64 downto 0) );

end Iter;

architecture RTL of Iter is
	
	
signal s0,s1,S: std_logic_vector(64 downto 0);


	
begin
process(CLK)
begin
if (rising_edge(CLK)) then

	Avn<=Av;
	Svn<=Sv;

	Pvn<=S(64)&S(64)&S(64 downto 2);

	
else null;
end if;
end process;




process(Pv)
begin
	s0<=Pv;
	
	case Pv(2 downto 0) is
			when "001" => s1<=Av;
			when "010" => s1<=Av;
			when "011" => s1<=Av(63 downto 0)&'0';
			when "100" => s1<=Sv(63 downto 0)&'0';
			when "101" => s1<=Sv;
			when "110" => s1<=Sv;
			when others => s1<=(OTHERS=>'0');
	end case;
end process;

process(s0,s1)
begin
	S<=s0+s1;
end process;

end RTL;

