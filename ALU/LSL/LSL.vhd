library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LSL is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		Cout: out std_logic;
		S: out std_logic_vector(31 downto 0)
		);
end LSL;
	
architecture rtl of LSL is

begin
Process(CLK) begin
	if CLK'EVENT AND CLK='1'THEN
		
		case B(4 downto 0) is
			when "00001" => S<=A(30 downto 0)&'0';Cout<=A(31);
			when "00010" => S<=A(29 downto 0)&"00";Cout<=A(30);
			when "00011" => S<=A(28 downto 0)&"000";Cout<=A(29);
			when "00100" => S<=A(27 downto 0)&"0000";Cout<=A(28);
			when "00101" => S<=A(26 downto 0)&"00000";Cout<=A(27);
			when "00110" => S<=A(25 downto 0)&"000000";Cout<=A(26);
			when "00111" => S<=A(24 downto 0)&"0000000";Cout<=A(25);
			when "01000" => S<=A(23 downto 0)&"00000000";Cout<=A(24);
			when "01001" => S<=A(22 downto 0)&"000000000";Cout<=A(23);
			when "01010" => S<=A(21 downto 0)&"0000000000";Cout<=A(22);
			when "01011" => S<=A(20 downto 0)&"00000000000";Cout<=A(21);
			when "01100" => S<=A(19 downto 0)&"000000000000";Cout<=A(20);
			when "01101" => S<=A(18 downto 0)&"0000000000000";Cout<=A(19);
			when "01110" => S<=A(17 downto 0)&"00000000000000";Cout<=A(18);
			when "01111" => S<=A(16 downto 0)&"000000000000000";Cout<=A(17);
			when "10000" => S<=A(15 downto 0)&"0000000000000000";Cout<=A(16);
			when "10001" => S<=A(14 downto 0)&"00000000000000000";Cout<=A(15);
			when "10010" => S<=A(13 downto 0)&"000000000000000000";Cout<=A(14);
			when "10011" => S<=A(12 downto 0)&"0000000000000000000";Cout<=A(13);
			when "10100" => S<=A(11 downto 0)&"00000000000000000000";Cout<=A(12);
			when "10101" => S<=A(10 downto 0)&"000000000000000000000";Cout<=A(11);
			when "10110" => S<=A(9 downto 0) &"0000000000000000000000";Cout<=A(10);
			when "10111" => S<=A(8 downto 0) &"00000000000000000000000";Cout<=A(9);
			when "11000" => S<=A(7 downto 0) &"000000000000000000000000";Cout<=A(8);
			when "11001" => S<=A(6 downto 0) &"0000000000000000000000000";Cout<=A(7);
			when "11010" => S<=A(5 downto 0) &"00000000000000000000000000";Cout<=A(6);
			when "11011" => S<=A(4 downto 0) &"000000000000000000000000000";Cout<=A(5);
			when "11100" => S<=A(3 downto 0) &"0000000000000000000000000000";Cout<=A(4);
			when "11101" => S<=A(2 downto 0) &"00000000000000000000000000000";Cout<=A(3);
			when "11110" => S<=A(1 downto 0) &"000000000000000000000000000000";Cout<=A(2);
			when "11111" => S<=A(0) &"0000000000000000000000000000000";Cout<=A(1);
			when others  => S<=A;Cout<='0';
		end case;
		
		
			
	else null;
	end if;
end process;


end RTL;