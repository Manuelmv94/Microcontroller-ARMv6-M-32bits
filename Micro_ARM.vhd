library IEEE;
use IEEE.std_logic_1164.all;

entity Micro_ARM is
	port ( 	CLK: in std_logic;
				
				AdressRAM: out std_LOGIC_vector(31 downto 0);
				DataRAM: inout std_logic_vector(31 downto 0);
				WR_RAM: out std_logic;
				
				read_rom: out std_logic;
				Word: in std_logic_vector(15 downto 0);--Memoria de programa
				Address: out std_LOGIC_vector(31 downto 0));--Memoria de programa
end Micro_ARM;


architecture BEHAVIOURAL of Micro_ARM is
	
	
COMponent ALU is
	port ( 	CLK: in std_logic;
				Rdn,Rm: in STD_LOGIC_vector(31 downto 0);
				SEL: in std_LOGIC_vector(4 downto 0);
				NZCVin: in std_LOGIC_vector(3 downto 0);
				FLAGS: in std_logic;
				CarryEn: in std_logic;
				
				NZCVout: out std_LOGIC_vector(3 downto 0);
				Rd: out STD_LOGIC_vector(31 downto 0) );
end component;

component RegistersBank is
port (CLK: in std_logic;
		WE: in std_logic;
		RE: in std_logic;
		RdAdd: in std_logic_vector(3 downto 0);
		RnAdd: in std_logic_vector(3 downto 0);
		RmAdd: in std_logic_vector(3 downto 0);
		DATAin: in std_logic_vector(31 downto 0);
		PCINC: in std_logic;
		
		PC: out std_LOGIC_vector(31 downto 0);
		Rn: out std_logic_vector(31 downto 0);
		Rm: out std_logic_vector(31 downto 0)
		);
end component;


component ControlUnit is
port (CLK: in std_logic;
		Word: in std_logic_vector(15 downto 0);
		NZCV: in std_lOGIC_vector(3 downto 0);
		
		FLAGS: out std_logic;
		SEL: out STD_LOGIC_vector(4 downto 0);--ALU
		WE: out std_logic;--banco de registros
		RE: out std_logic;--banco de registros
		RdAdd: out std_logic_vector(3 downto 0);
		RnAdd: out std_logic_vector(3 downto 0);--banco de registros
		RmAdd: out std_logic_vector(3 downto 0);--banco de registros
		WR: out std_logic; --RAM
		
		MUX_SEL: out std_logic;
		 read_rom: out std_logic;
		 ARLOAD: OUT STD_LOGIC;
		 ZLOAD_1: OUT STD_LOGIC;
		 ZLOAD_2: OUT STD_LOGIC;
		 ZLOAD_3: OUT STD_LOGIC;
		
		IMM: OUT STD_LOGIC_vector(31 DOWNTO 0);
		PCINC: OUT STD_LOGIC;
		CarryEn: out std_logic
		
		);
end component;

COMPONENT ZTEMP_BIDIR is
port (CLK: IN STD_LOGIC;
		BIDIR_PORT : inOUT std_logic_vector(31 DOWNTO 0);
      IN_PORT : in std_logic_vector(31 downto 0);
      OUT_PORT : out std_logic_vector(31 DOWNTO 0);
      WR : IN std_logic
     );
end COMPONENT;

--BUS
signal int_BUS: STD_LOGIC_vector(31 downto 0);

--ALU
signal Rn: STD_LOGIC_vector(31 downto 0);
signal Rm: STD_LOGIC_vector(31 downto 0);
signal NZCV: STD_LOGIC_vector(3 downto 0);--Banderas
signal CarryEn: std_logic;

--Banco de registros
signal PC: STD_LOGIC_vector(31 DOWNTO 0);
SIGNAL PCINC: STD_LOGIC;

--senales de control
signal SEL: STD_LOGIC_vector(4 downto 0);--ALU
signal FLAGS: std_logic;
signal WE:std_logic;--banco de registros
signal RE:std_logic;--banco de registros
signal RdAdd: std_LOGIC_vector(3 downto 0);--banco de registros
signal RnAdd: std_logic_vector(3 downto 0);--banco de registros
signal RmAdd: std_logic_vector(3 downto 0);--banco de registros
signal WR: std_logic;

signal imm: std_LOGIC_vector(31 downto 0);--UC

--*Address Register**--
signal AR: std_LOGIC_vector(31 downto 0);
signal ARLOAD: std_LOGIC;


--Registros temporales
signal ZTEMP_1: std_LOGIC_vector(31 downto 0);
signal ZLOAD_1: std_LOGIC;

signal ZTEMP_2: std_LOGIC_vector(31 downto 0);
signal ZLOAD_2: std_LOGIC;

signal ZTEMP_3: std_LOGIC_vector(31 downto 0);
signal ZLOAD_3: std_LOGIC;


signal ZTEMP_IN: std_LOGIC_vector(31 downto 0);
signal ZTEMP_OUT: std_LOGIC_vector(31 downto 0);


--**MUX**--
signal MUX: STD_LOGIC_vector(31 DOWNTO 0);
signal MUX_SEL: STD_LOGIC;

begin

elemento_ALU: ALU port map(CLK,Rn,MUX,SEL,NZCV,FLAGS,CarryEn,NZCV,zteMP_1);
elemento_RegistersBank: RegistersBank port map(CLK,WE,RE,RdAdd,RnAdd,Rmadd,int_BUS,PCINC,PC,Rn,Rm);
elemento_UC: ControlUnit port map(CLK,Word,NZCV,FLAGS,SEL,WE,RE,RdAdd,RnAdd,RmAdd,WR,MUX_SEL,read_rom,ARLOAD,zloAD_1,zloAD_2,zloAD_3,IMM,PCINC,CarryEn);
elemento_bidir:ZTEMP_BIDIR port map(CLK,DATaRAM,ZTEMP_IN,ZTEMP_OUT,WR);

AR<=PC when ARLOAD='1' else
	AR;
	
int_BUS<= zteMP_1 when ZLOAD_1='1' else
			 ZTEMP_OUT when (ZLOAD_3='1' AND WR='0') else
			 "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

ZTEMP_2<=int_BUS when ZLOAD_2='1' ELSE
			ZTEMP_2;

ZTEMP_IN<=int_BUS	when (ZLOAD_3='1' AND WR='1') else
			"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			
--ZTEMP_3<=int_BUS when (ZLOAD_3='1' AND WR='1') else
--			ZTEMP_3TEMP WHEN (ZLOAD_3='1' AND WR='0') else
--			 "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; 
			

MUX<= Rm when mux_SEL='0' else
		imm;
	


Address<=AR;

WR_RAM<=WR;
adressRAM<=ZteMP_2;



	
end BEHAVIOURAL;

