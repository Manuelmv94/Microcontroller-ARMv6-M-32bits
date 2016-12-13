library IEEE;
use IEEE.std_logic_1164.all;

entity Multiplicacion is
	port ( 	CLK: in std_logic;
				A,B: in STD_LOGIC_vector(31 downto 0);
				Res: out STD_LOGIC_vector(63 downto 0) );
end Multiplicacion;


architecture RTL of Multiplicacion is
	
	
component Gen_Vectores IS
port ( 	CLK: in std_logic;
			A,B: in STD_LOGIC_vector(31 downto 0);
			Av,Sv,Pv: out STD_LOGIC_vector(64 downto 0) );
end component;

component Iter IS
port ( 	CLK: in std_logic;
			Av,Sv,Pv: in STD_LOGIC_vector(64 downto 0);
			Avn,Svn,Pvn: out STD_LOGIC_vector(64 downto 0) );
end component;

signal Av1: STD_LOGIC_vector(64 downto 0);
signal Sv1: STD_LOGIC_vector(64 downto 0);
signal Pv1: STD_LOGIC_vector(64 downto 0);
signal Av2: STD_LOGIC_vector(64 downto 0);
signal Sv2: STD_LOGIC_vector(64 downto 0);
signal Pv2: STD_LOGIC_vector(64 downto 0);
signal Av3: STD_LOGIC_vector(64 downto 0);
signal Sv3: STD_LOGIC_vector(64 downto 0);
signal Pv3: STD_LOGIC_vector(64 downto 0);
signal Av4: STD_LOGIC_vector(64 downto 0);
signal Sv4: STD_LOGIC_vector(64 downto 0);
signal Pv4: STD_LOGIC_vector(64 downto 0);		
signal Av5: STD_LOGIC_vector(64 downto 0);
signal Sv5: STD_LOGIC_vector(64 downto 0);
signal Pv5: STD_LOGIC_vector(64 downto 0);
signal Av6: STD_LOGIC_vector(64 downto 0);
signal Sv6: STD_LOGIC_vector(64 downto 0);
signal Pv6: STD_LOGIC_vector(64 downto 0);
signal Av7: STD_LOGIC_vector(64 downto 0);
signal Sv7: STD_LOGIC_vector(64 downto 0);
signal Pv7: STD_LOGIC_vector(64 downto 0);
signal Av8: STD_LOGIC_vector(64 downto 0);
signal Sv8: STD_LOGIC_vector(64 downto 0);
signal Pv8: STD_LOGIC_vector(64 downto 0);
signal Av9: STD_LOGIC_vector(64 downto 0);
signal Sv9: STD_LOGIC_vector(64 downto 0);
signal Pv9: STD_LOGIC_vector(64 downto 0);			
signal Av10,Sv10,Pv10: STD_LOGIC_vector(64 downto 0);		
signal Av11,Sv11,Pv11: STD_LOGIC_vector(64 downto 0);		
signal Av12,Sv12,Pv12: STD_LOGIC_vector(64 downto 0);		
signal Av13,Sv13,Pv13: STD_LOGIC_vector(64 downto 0);		
signal Av14,Sv14,Pv14: STD_LOGIC_vector(64 downto 0);		
signal Av15,Sv15,Pv15: STD_LOGIC_vector(64 downto 0);		
signal Av16,Sv16,Pv16: STD_LOGIC_vector(64 downto 0);		
signal Av17,Sv17,Pv17: STD_LOGIC_vector(64 downto 0);			
begin

elemento_1: Gen_Vectores port map(CLK,A,B,Av1,Sv1,Pv1);
elemento_2: Iter port map(CLK,Av1,Sv1,Pv1,Av2,Sv2,Pv2);
elemento_3: Iter port map(CLK,Av2,Sv2,Pv2,Av3,Sv3,Pv3);
elemento_4: Iter port map(CLK,Av3,Sv3,Pv3,Av4,Sv4,Pv4);
elemento_5: Iter port map(CLK,Av4,Sv4,Pv4,Av5,Sv5,Pv5);
elemento_6: Iter port map(CLK,Av5,Sv5,Pv5,Av6,Sv6,Pv6);
elemento_7: Iter port map(CLK,Av6,Sv6,Pv6,Av7,Sv7,Pv7);
elemento_8: Iter port map(CLK,Av7,Sv7,Pv7,Av8,Sv8,Pv8);
elemento_9: Iter port map(CLK,Av8,Sv8,Pv8,Av9,Sv9,Pv9);
elemento_10: Iter port map(CLK,Av9,Sv9,Pv9,Av10,Sv10,Pv10);
elemento_11: Iter port map(CLK,Av10,Sv10,Pv10,Av11,Sv11,Pv11);
elemento_12: Iter port map(CLK,Av11,Sv11,Pv11,Av12,Sv12,Pv12);
elemento_13: Iter port map(CLK,Av12,Sv12,Pv12,Av13,Sv13,Pv13);
elemento_14: Iter port map(CLK,Av13,Sv13,Pv13,Av14,Sv14,Pv14);
elemento_15: Iter port map(CLK,Av14,Sv14,Pv14,Av15,Sv15,Pv15);
elemento_16: Iter port map(CLK,Av15,Sv15,Pv15,Av16,Sv16,Pv16);
elemento_17: Iter port map(CLK,Av16,Sv16,Pv16,Av17,Sv17,Pv17);

Res<=Pv17(64 downto 1);
	
end RTL;

