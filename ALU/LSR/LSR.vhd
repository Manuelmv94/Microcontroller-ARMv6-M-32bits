library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LSR is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		Cout: out std_logic;
		S: out std_logic_vector(31 downto 0)
		);
end LSR;
	
architecture rtl of LSR is

begin
Process(CLK) begin
	if CLK'EVENT AND CLK='1'THEN
		
		case B(4 downto 0) is
			when "00001" => S<='0' & A(31 downto 1);Cout<=A(0);
			when "00010" => S<="00" & A(31 downto 2);Cout<=A(1);
			when "00011" => S<="000" & A(31 downto 3);Cout<=A(2);
			when "00100" => S<="0000" & A(31 downto 4);Cout<=A(3);
			when "00101" => S<="00000" & A(31 downto 5);Cout<=A(4);
			when "00110" => S<="000000" & A(31 downto 6);Cout<=A(5);
			when "00111" => S<="0000000" & A(31 downto 7);Cout<=A(6);
			when "01000" => S<="00000000" & A(31 downto 8);Cout<=A(7);
			when "01001" => S<="000000000" & A(31 downto 9);Cout<=A(8);
			when "01010" => S<="0000000000" & A(31 downto 10);Cout<=A(9);
			when "01011" => S<="00000000000" & A(31 downto 11);Cout<=A(10);
			when "01100" => S<="000000000000" & A(31 downto 12);Cout<=A(11);
			when "01101" => S<="0000000000000" & A(31 downto 13);Cout<=A(12);
			when "01110" => S<="00000000000000" & A(31 downto 14);Cout<=A(13);
			when "01111" => S<="000000000000000" & A(31 downto 15);Cout<=A(14);
			when "10000" => S<="0000000000000000" & A(31 downto 16);Cout<=A(15);
			when "10001" => S<="00000000000000000" & A(31 downto 17);Cout<=A(16);
			when "10010" => S<="000000000000000000" & A(31 downto 18);Cout<=A(17);
			when "10011" => S<="0000000000000000000" & A(31 downto 19);Cout<=A(18);
			when "10100" => S<="00000000000000000000" & A(31 downto 20);Cout<=A(19);
			when "10101" => S<="000000000000000000000" & A(31 downto 21);Cout<=A(20);
			when "10110" => S<="0000000000000000000000" & A(31 downto 22) ;Cout<=A(21);
			when "10111" => S<="00000000000000000000000" & A(31 downto 23) ;Cout<=A(22);
			when "11000" => S<="000000000000000000000000" & A(31 downto 24) ;Cout<=A(23);
			when "11001" => S<="0000000000000000000000000" & A(31 downto 25) ;Cout<=A(24);
			when "11010" => S<="00000000000000000000000000" & A(31 downto 26) ;Cout<=A(25);
			when "11011" => S<="000000000000000000000000000" & A(31 downto 27) ;Cout<=A(26);
			when "11100" => S<="0000000000000000000000000000" & A(31 downto 28) ;Cout<=A(27);
			when "11101" => S<="00000000000000000000000000000" & A(31 downto 29);Cout<=A(28);
			when "11110" => S<="000000000000000000000000000000" & A(31 downto 30);Cout<=A(29);
			when "11111" => S<="0000000000000000000000000000000" & A(31);Cout<=A(30);
			when others  => S<=A;Cout<='0';
		end case;
		
		
			
	else null;
	end if;
end process;


end RTL;