library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sumador_CarryLookahead is
port (--CLK: in std_LOGIC;
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		Cin: in std_LOGIC;
		S: out std_logic_vector(3 downto 0);
		Cout: out std_LOGIC);
end Sumador_CarryLookahead;
	
architecture RTL of Sumador_CarryLookahead is

signal g,p: std_LOGIC_vector(3 downto 0);
signal c1,c2,c3: std_LOGIC;

begin

process (A,B,Cin)
begin
	--if (clk'event and clk='1') then
		g<=A and B;
		P<=A or B;

		c1<=g(0)or(Cin and p(0));
		--c2<=g(1)or(C1 and p(1));
		c2<=g(1)or(g(0)and p(1))or(Cin and p(0) and p(1));

		--c3<=g(2)or(C2 and p(2));
		c3<=g(2)or(g(1)and p(2))or(g(0)and p(1)and p(2))or(Cin and p(0)and p(1)and p(2));

		--Cout<=g(3)or(C3 and p(3));
		Cout<=g(3)or(g(2)and p(3))or(g(1)and p(2)and p(3))or(g(0) and p(1)and p(2)and p(3))or(Cin and p(0)and p(1)and p(2)and p(3));



		S(0)<=A(0) xor B(0) xor Cin;
		S(1)<=A(1) xor B(1) xor c1;
		S(2)<=A(2) xor B(2) xor c2;
		S(3)<=A(3) xor B(3) xor c3;
	
	--else null;
	--end if;



end process;



end RTL;