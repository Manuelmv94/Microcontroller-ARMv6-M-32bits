library IEEE;
use IEEE.std_logic_1164.all;

entity Micro_and_Memories is
	port ( 	CLK: in std_logic;
				Instruction: out std_LOGIC_vector(15 downto 0)
			);	
end Micro_and_Memories;


architecture RTL of Micro_and_Memories is
	
component Micro_ARM is
	port ( 	CLK: in std_logic;
				
				AdressRAM: out std_LOGIC_vector(31 downto 0);
				DataRAM: inout std_logic_vector(31 downto 0);
				WR_RAM: out std_logic;
				
				read_rom: out std_logic;
				Word: in std_logic_vector(15 downto 0);--Memoria de programa
				Address: out std_LOGIC_vector(31 downto 0));--Memoria de programa
end component;
	
component RAM_BLOCK is
port (Clk : in std_logic;
        address : in std_logic_vector(31 downto 0);
        we : in std_logic;
        data : inout std_logic_vector(31 downto 0)
     );
end component;

component ROM_BLOCK is
port (Clk : in std_logic;
        address : in std_logic_vector(31 downto 0);
        Rd : in std_logic;
        data : out std_logic_vector(15 downto 0)
     );
end component;

signal ram_address: std_LOGIC_vector(31 downto 0);
signal rom_address: std_logic_vector(31 downto 0);
signal ram_data: std_LOGIC_vector(31 downto 0);
signal rom_Instruction: std_LOGIC_vector(15 downto 0);

signal read_rom: std_logic;
signal WR_ram: std_LOGIC;

begin

elemento_RAM: RAM_BLOCK port map(CLK,ram_address,WR_RAM,ram_data);
elemento_ROM: ROM_BLOCK port map(CLK,ROM_address,REAd_rom,ROM_Instruction);
elemento_micro: Micro_ARM port map(CLK,RAM_address,RAM_data,WR_RAM,REAd_rom,ROM_Instruction,ROM_address);

Instruction<=rom_Instruction;
	
end RTL;

