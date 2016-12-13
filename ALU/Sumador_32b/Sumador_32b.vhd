library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sumador_32b is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		Cin: in std_LOGIC;
		SEL: in std_logic;
		S: out std_logic_vector(31 downto 0);
		Cout: out std_LOGIC);
end Sumador_32b;
	
architecture RTL of Sumador_32b is

component Sumador_CarryLookahead is
port (--CLK: in std_logic;
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		Cin: in std_LOGIC;
		S: out std_logic_vector(3 downto 0);
		Cout: out std_LOGIC);
end component;

signal c0,c1,c2,c3,c4,c5,c6,CinTemp: std_LOGIC;

signal Atemp: std_logic_vector(31 downto 0);
signal Btemp: std_logic_vector(31 downto 0);
signal Stemp: std_logic_vector(31 downto 0);
begin

process(CLK) begin
	if (clk'event and clk='1') then
		Atemp<=A;
		CinTemp<=Cin;
		if(SEL='0') then
			Btemp<=B;
		else
			Btemp<=NOT(B)+'1'-CinTemp-CinTemp;
		end if;

	else null;
	end if;
end process;


elemento_1: Sumador_CarryLookahead port map(Atemp(3 downto 0),Btemp(3 downto 0),CinTemp,S(3 downto 0),c0);
elemento_2: Sumador_CarryLookahead port map(Atemp(7 downto 4),Btemp(7 downto 4),C0,S(7 downto 4),c1);
elemento_3: Sumador_CarryLookahead port map(Atemp(11 downto 8),Btemp(11 downto 8),C1,S(11 downto 8),c2);
elemento_4: Sumador_CarryLookahead port map(Atemp(15 downto 12),Btemp(15 downto 12),C2,S(15 downto 12),c3);
elemento_5: Sumador_CarryLookahead port map(Atemp(19 downto 16),Btemp(19 downto 16),C3,S(19 downto 16),c4);
elemento_6: Sumador_CarryLookahead port map(Atemp(23 downto 20),Btemp(23 downto 20),C4,S(23 downto 20),c5);
elemento_7: Sumador_CarryLookahead port map(Atemp(27 downto 24),Btemp(27 downto 24),C5,S(27 downto 24),c6);
elemento_8: Sumador_CarryLookahead port map(Atemp(31 downto 28),Btemp(31 downto 28),C6,S(31 downto 28),Cout);






end RTL;