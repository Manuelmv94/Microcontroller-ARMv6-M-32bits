library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RegistersBank is
port (CLK: in std_logic;
		WE: in std_logic;
		RE: in std_logic;
		RdAdd: in std_logic_vector(3 downto 0);
		RnAdd: in std_logic_vector(3 downto 0);
		RmAdd: in std_logic_vector(3 downto 0);
		DATAin: in std_logic_vector(31 downto 0);
		PCINC: in STD_LOGIC;
		
		PC: out std_logic_vector(31 downto 0);
		Rn: out std_logic_vector(31 downto 0);
		Rm: out std_logic_vector(31 downto 0)
		);
end registersBank;
	
architecture RTL of registersBank is

component Sumador_32b is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		Cin: in std_LOGIC;
		SEL: in std_logic;
		S: out std_logic_vector(31 downto 0);
		Cout: out std_LOGIC);
end component;

type registerFile is array(0 to 15) of std_logic_vector(31 downto 0);
signal registers : registerFile;
signal suma: std_logic_vector(31 downto 0);
signal PCsumando: std_logic_vector(31 downto 0);
signal cero:std_logic_vector(31 downto 0):="00000000000000000000000000000000";

begin
Process(CLK) begin
	if CLK'EVENT AND CLK='0'THEN
		PCsumando<=registers(15);
		if(RE='1') then
			Rn <= registers(to_integer(unsigned(RnAdd)));
			Rm <= registers(to_integer(unsigned(RmAdd)));
		else
			if(WE='1') then
				registers(to_integer(unsigned(RdAdd))) <= Datain;
			else null;
			end if;
		end if;
		
		if(PCINC='1')THEN
			registers(15)<=suma;
		ELSe null;
		END IF;
		PC<=registers(15);
	else null;
	end if;
end process;

elemento_1: Sumador_32b port map(CLK,PCsumando,cero,'1','0',suma);


end RTL;