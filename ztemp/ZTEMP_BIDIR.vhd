library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ZTEMP_BIDIR is
port (CLK: IN STD_logic;
		BIDIR_PORT : inOUT std_logic_vector(31 DOWNTO 0);
      IN_PORT : in std_logic_vector(31 downto 0);
      OUT_PORT : out std_logic_vector(31 DOWNTO 0);
      WR : IN std_logic
     );
end ZTEMP_BIDIR;

architecture Behavioral of ZTEMP_BIDIR is

begin

 bidir_PORT<=in_PORT WHEN WR='1' ELSE "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
OUT_PORT<=BIDIR_PORT WHEN WR='0' ELSE "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; 

--	PROCESS(Clk)
--BEGIN
--    IF CLK'EVENT AND CLK='1' THEn
--        if(WR='1') then
--            bidir_PORT<=in_PORT; 
--        else
--				BIDIR_PORT<="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
--				OUT_PORT<=bidir_PORT;
--		  end if;
--    ELSE NULL;
--	 end if;
--END PROCESS;
	

end Behavioral;