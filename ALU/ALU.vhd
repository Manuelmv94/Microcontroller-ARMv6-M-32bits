library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
	port ( 	CLK: in std_logic;
				Rdn,Rm: in STD_LOGIC_vector(31 downto 0);
				SEL: in std_LOGIC_vector(4 downto 0);
				NZCVin: in std_LOGIC_vector(3 downto 0);
				FLAGS: in std_logic;
				CarryEn: in std_logic;
				
				NZCVout: out std_LOGIC_vector(3 downto 0);
				Rd: out STD_LOGIC_vector(31 downto 0) );
end ALU;


architecture RTL of ALU is
	
COMponent ANDoperation is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		S: out std_logic_vector(31 downto 0)
		);
end component;	
	
component ASR is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		Cout: out std_logic;
		S: out std_logic_vector(31 downto 0)
		);
end component;

component BitClear is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		S: out std_logic_vector(31 downto 0)
		);
end component;

component Extension is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		SEL: in std_logic_vector(1 downto 0);
		
		S: out std_logic_vector(31 downto 0)		
		);
end component;

component LSL is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		Cout: out std_logic;
		S: out std_logic_vector(31 downto 0)
		);
end component;

component LSR is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		Cout:out std_logic;
		S: out std_logic_vector(31 downto 0)
		);
end component;

component Multiplicacion is
	port ( 	CLK: in std_logic;
				A,B: in STD_LOGIC_vector(31 downto 0);
				Res: out STD_LOGIC_vector(63 downto 0) );
end component;

component ORoperation is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		S: out std_logic_vector(31 downto 0)
		);
end component;

component REV is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);

		SEL: in std_logic_vector(1 downto 0);
		
		S: out std_logic_vector(31 downto 0)		
		);
end component;
	
component Rotate is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		Cout: out std_LOGIC;
		S: out std_logic_vector(31 downto 0)
		);
end component;

component Sumador_32b is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		Cin: in std_LOGIC;
		SEL: in std_logic;
		S: out std_logic_vector(31 downto 0);
		Cout: out std_LOGIC);
end component;

component XORoperation is
port (CLK: in std_logic;
		A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		
		S: out std_logic_vector(31 downto 0)
		);
end component;


signal ANDout: STD_LOGIC_vector(31 downto 0);
signal ORout: STD_LOGIC_vector(31 downto 0);
signal XORout: STD_LOGIC_vector(31 downto 0);
signal BCout: STD_LOGIC_vector(31 downto 0);
signal Sumout: STD_LOGIC_vector(31 downto 0);
signal SumCout: STD_LOGIC;
signal LSLout: STD_LOGIC_vector(31 downto 0);
signal LSLCout: std_logic;
signal LSRout: STD_LOGIC_vector(31 downto 0);
signal LSRCout: std_logic;
signal ASRout: STD_LOGIC_vector(31 downto 0);
signal ASRCout: std_logic;
signal Rotateout: STD_LOGIC_vector(31 downto 0);
signal RotateCout: std_logic;
signal EXTout: STD_LOGIC_vector(31 downto 0);
signal REVout: STD_LOGIC_vector(31 downto 0);
signal MULout: STD_LOGIC_vector(63 downto 0);
signal Carrytemp: std_logic;
signal Overflowtemp: std_logic;
signal Rdtemp: std_LOGIC_vector(31 downto 0);
signal CarryF: std_logic;

begin

CarryF<= NZCVin(1) when CarryEn='1' else
			'0';

elemento_1: ANDoperation port map(CLK,Rdn,Rm,ANDout);
elemento_2: OROperation port map(CLK,Rdn,Rm,OROut);
elemento_3: XORoperation port map(CLK,Rdn,Rm,XORout);
elemento_4: BitClear port map(CLK,Rdn,Rm,bcout);
elemento_5: SUMador_32b port map(CLK,Rdn,Rm,CarryF,SEL(0),Sumout,SumCout);
elemento_6: LSL port map(CLK,Rdn,Rm,LSLCout,LSLout);
elemento_7: LSR port map(CLK,Rdn,Rm,LSRCout,LSRout);	
elemento_8: ASR port map(CLK,Rdn,Rm,ASRCout,ASRout);	
elemento_9: ROTate port map(CLK,Rdn,Rm,RotateCout,Rotateout);	
elemento_10:extension port map(CLK,Rdn,SEL(1 DOWNTO 0),EXTout);	
elemento_11:REV port map(CLK,Rdn,SEL(1 DOWNTO 0),REVout);
elemento_12:MUltiplicacion port map(CLK,Rdn,Rm,Mulout);

process(sel) begin
	case sel is
		when "00000" => Rdtemp<=ANDout;
							 Carrytemp<=NZCVin(1);
							 Overflowtemp<=NZCVin(0);
							 
		when "00001" => Rdtemp<=ORout;
							 Carrytemp<=NZCVin(1);
							 Overflowtemp<=NZCVin(0);
							 
		when "00010" => Rdtemp<=XORout;
							 Carrytemp<=NZCVin(1);
							 Overflowtemp<=NZCVin(0);
							 
		when "00011" => Rdtemp<=BCout;
							 Carrytemp<=NZCVin(1);
							 Overflowtemp<=NZCVin(0);
							 
		when "00100" => Rdtemp<=Sumout;
							 Carrytemp<=SumCOut;
							 if((Rdn(31)='1' and Rm(31)='1' and Sumout(31)='0')OR(Rdn(31)='0' and Rm(31)='0' and Sumout(31)='1')) then
								Overflowtemp<='1';
							 else
								Overflowtemp<='0';
							 end if;
							 
		when "00101" => Rdtemp<=Sumout;
							 Carrytemp<=SumCOut;
							 
							 if((Rdn(31)='1' and Rm(31)='0' and Sumout(31)='0')OR(Rdn(31)='0' and Rm(31)='1' and Sumout(31)='1')) then
								Overflowtemp<='1';
							 else
								Overflowtemp<='0';
							 end if;
							 
		when "00110" => Rdtemp<=LSLout;
							 Carrytemp<=LSLCout;
							 Overflowtemp<=NZCVin(0);
		
		when "00111" => Rdtemp<=LSRout;
							 Carrytemp<=LSRCout;
							 Overflowtemp<=NZCVin(0);
		
		when "01000" => Rdtemp<=EXTout;
		when "01001" => Rdtemp<=EXTout;
		when "01010" => Rdtemp<=EXTout;
		when "01011" => Rdtemp<=EXTout;
		
		when "01100" => Rdtemp<=REVout;
		when "01101" => Rdtemp<=REVout;
		when "01111" => Rdtemp<=REVout;
		
		when "10000" => Rdtemp<=ASRout;
							 Carrytemp<=ASRCout;
							 Overflowtemp<=NZCVin(0);
							 
		when "10001" => Rdtemp<=Rotateout;
							 Carrytemp<=RotateCout;
							 Overflowtemp<=NZCVin(0);
			
		when "10010" => Rdtemp<=MULout(31 downto 0);
							 Carrytemp<=NZCVin(1);
							 Overflowtemp<=NZCVin(0);
							 
		when "10011" => Rdtemp<=NOT(Rdn);
							 Carrytemp<=NZCVin(1);
							 Overflowtemp<=NZCVin(0);
							 
		when "10100"=> Rdtemp<=Rdn;
							Carrytemp<=NZCVin(1);
							Overflowtemp<=NZCVin(0);
		
		when "10101"=> Rdtemp<=Rm;
							Carrytemp<=NZCVin(1);
							Overflowtemp<=NZCVin(0);
							
		when "10110"=>Rdtemp<=NOT(Rdn)+'1';
						  Carrytemp<='0';
						  Overflowtemp<='0';
							
		when others => Rdtemp<=(OTHERS=>'0');
		END CASE;

		

		Rd<=Rdtemp;
		
		if(FLAGS='1') then
			if(Rdtemp="00000000000000000000000000000000") THEn
				NZCVout(2)<='1';
			else
				NZCVout(2)<='0';
			end if;
		
			if(Rdtemp(31)='1') then
				NZCVout(3)<='1';
			else
				NZCVout(3)<='0';
			end if;
		
			NZCVout(1)<=Carrytemp;
			NZCVout(0)<=Overflowtemp;
		else
			NZCVout<=NZCVin;
		end if;
		
end process;



end RTL;

