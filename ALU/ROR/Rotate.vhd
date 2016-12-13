library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Rotate is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		Cout: out std_logic;
		S: out std_logic_vector(31 downto 0)
		);
end Rotate;
	
architecture rtl of Rotate is

begin
Process(CLK) begin
	if CLK'EVENT AND CLK='1'THEN
		
		case B(4 downto 0) is
			when "00001" => S<=A(0) & A(31 downto 1);Cout<=A(0);
			when "00010" => S<=A(1 DOWNTO 0) & A(31 downto 2);Cout<=A(1);
			when "00011" => S<=A(2 DOWNTO 0) & A(31 downto 3);Cout<=A(2);
			when "00100" => S<=A(3 DOWNTO 0) & A(31 downto 4);Cout<=A(3);
			when "00101" => S<=A(4 DOWNTO 0) & A(31 downto 5);Cout<=A(4);
			when "00110" => S<=A(5 DOWNTO 0) & A(31 downto 6);Cout<=A(5);
			when "00111" => S<=A(6 DOWNTO 0) & A(31 downto 7);Cout<=A(6);
			when "01000" => S<=A(7 DOWNTO 0) & A(31 downto 8);Cout<=A(7);
			when "01001" => S<=A(8 DOWNTO 0) & A(31 downto 9);Cout<=A(8);
			when "01010" => S<=A(9 DOWNTO 0) & A(31 downto 10);Cout<=A(9);
			when "01011" => S<=A(10 DOWNTO 0) & A(31 downto 11);Cout<=A(10);
			when "01100" => S<=A(11 DOWNTO 0)  & A(31 downto 12);Cout<=A(11);
			when "01101" => S<=A(12 DOWNTO 0) & A(31 downto 13);Cout<=A(12);
			when "01110" => S<=A(13 DOWNTO 0) & A(31 downto 14);Cout<=A(13);
			when "01111" => S<=A(14 DOWNTO 0) & A(31 downto 15);Cout<=A(14);
			when "10000" => S<=A(15 DOWNTO 0) & A(31 downto 16);Cout<=A(15);
			when "10001" => S<=A(16 DOWNTO 0) & A(31 downto 17);Cout<=A(16);
			when "10010" => S<=A(17 DOWNTO 0) & A(31 downto 18);Cout<=A(17);
			when "10011" => S<=A(18 DOWNTO 0) & A(31 downto 19);Cout<=A(18);
			when "10100" => S<=A(19 DOWNTO 0) & A(31 downto 20);Cout<=A(19);
			when "10101" => S<=A(20 DOWNTO 0) & A(31 downto 21);Cout<=A(20);
			when "10110" => S<=A(21 DOWNTO 0) & A(31 downto 22) ;Cout<=A(21);
			when "10111" => S<=A(22 DOWNTO 0) & A(31 downto 23) ;Cout<=A(22);
			when "11000" => S<=A(23 DOWNTO 0) & A(31 downto 24) ;Cout<=A(23);
			when "11001" => S<=A(24 DOWNTO 0) & A(31 downto 25) ;Cout<=A(24);
			when "11010" => S<=A(25 DOWNTO 0) & A(31 downto 26) ;Cout<=A(25);
			when "11011" => S<=A(26 DOWNTO 0) & A(31 downto 27) ;Cout<=A(26);
			when "11100" => S<=A(27 DOWNTO 0) & A(31 downto 28) ;Cout<=A(27);
			when "11101" => S<=A(28 DOWNTO 0) & A(31 downto 29);Cout<=A(28);
			when "11110" => S<=A(29 DOWNTO 0) & A(31 downto 30);Cout<=A(29);
			when "11111" => S<=A(30 DOWNTO 0) & A(31);Cout<=A(30);
			when others  => S<=A;Cout<='0';
		end case;
		
		
			
	else null;
	end if;
end process;


end RTL;