library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RAM_BLOCK is
port (Clk : in std_logic;
        address : in std_logic_vector(31 downto 0);
        we : in std_logic;
        data : inout std_logic_vector(31 downto 0)
     );
end RAM_BLOCK;

architecture RTL of RAM_BLOCK is

type ram_t is array (0 to 100) of std_logic_vector(31 downto 0);
signal ram : ram_t;

begin

--process for read and write operation.
PROCESS(Clk)
BEGIN
    IF CLK'EVENT AND CLK='1' THEn
        if(we='1') then
            DATA<="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
				ram(to_integer(unsigned(address))) <= data;
        else
				data <= ram(to_integer(unsigned(address)));
		  end if;
    ELSE NULL;
	 end if;
END PROCESS;

end RTL;