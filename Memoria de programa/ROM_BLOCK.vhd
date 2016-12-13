library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ROM_BLOCK is
port (Clk : in std_logic;
        address : in std_logic_vector(31 downto 0);
        Rd : in std_logic;
        data : out std_logic_vector(15 downto 0)
     );
end ROM_BLOCK;

architecture Behavioral of ROM_BLOCK is

type rom_t is array (0 to 71) of std_logic_vector(15 downto 0);
signal rom : rom_t := ("0100000101001000",--ADC(REGISTER)T1 	R0=R0+R1
							  "0001110001110000",--ADD(immediate)T1 	R0=R6+1
							  "0011000100000010",--ADD(immediate)T2	R1=R1+2
							  "0001100000001010",--ADD(REGISTER)T1		R2=R0+R1
							  "0100010000010011",--ADD(REGISTER)T2		R3=R3+R2
							  "1010110000000101",--ADD(SP plus immediate)T1	R4=SP+5
							  "1011000000000100",--ADD(SP plus immediate)T2	SP=SP+4
							  "0100010001101101",--ADD(SP plus register)T1	R5=R5+SP
							  "0100010010101101",--ADD(SP plus register)T2	SP=SP+R5	
							  "1010000000000111",--ADR						R0=PC+7
							  "0100000000000001",--AND(register)		R1=R1&R0		
							  "0001000010000010",--ASR(immediate)		R2=R0 > 2
							  "0100000100010011",--ASR(REGISTER)		R3=R3 > R2
							
							  "0110000000111010",--STR(immediate)T1		MEM(0+R7)=R2
							  "1001000000000000",--STR(immediate)T2		MEM(0+SP)=R0
							
							  "0110100000111100",--LDR(immediate)		R4=MEM(0+R7)
							  "0110101000111100",--LDR(immediate)		R4=MEM(4+R7)
							
							  
							  
							  
							  "1101000000000010",--B				
							  
							  "1101000000000011",--B
							  
							  "0100011110101000",--BLX(REGISTER)
							  "1111000000000000",--BL(PART I)
							  "1101000000001001",--BL(PART II)
							  
							  "0100001110101000",--BIC(register)	R0=R0 AND NOT(R5)
							  
							  "0100001011000111",--CMN(REGISTER)	R0+R7
							  "0010110100000011",--CMP(IMMEDIATE)	R5-3	
							  "0100001010000111",--CMP(REGISTER)T1	R7-R0
							  "0100010100101000",--CMP(REGISTER)T2	R0-R5
							  
							  "0100000001000111",--EOR(REGISTER)	R7=R7(+)R0
							  "0000000001000100",--LSL(IMMEDIATE)	R4=R0 < 1
							  "0100000010001101",--LSL(REGISTER)	R5=R5 <	R1
							  "0000100001000001",--LSR(IMMEDIATE)	R1=R0 > 1
							  "0100000011010100",--LSR(REGISTER)	R4=R4 > R2
							  "0010001111111111",--MOV(IMMEDIATE)	R3=255
							  "0100011001111101",--MOV(REGISTER)T1	R5=PC
							  "0000000000101010",--MOV(REGISTER)T2	R2=R5 same as LSL with no shift
							  "0100001111000001",--MVN(REGISTER)	R1=NOT(R0)
							  "0100001100011111",--ORR(REGISTER)	R7=R7 OR R3
							  "1011101000001101",--REV					R5=REV(R1)
							  "1011101001000110",--REV16				R6=REV16(R0)
							  "1011101011101111",--REVSH				R7=REVSH(R5)
							  "0100000111100010",--ROR(REGISTER)	R2=R2 > R4
							  "0100001001001101",--RSB(IMMEDIATE)	R5=0-R1
							  "0100000110100011",--SBC(REGISTER)		R3=R3-R4
							  "0001111001111010",--SUB(IMMEDIATE)T1	R2=R7-1	
							  "0011100110101110",--SUB(IMMEDIATE)T2	R1=R1-174
							  "0001101001110111",--SUB(REGISTER)		R7=R6-R1
							  "1011000010001000",--SUB(SP minus immediate)	SP=SP-2
							  "1011001001001110",--SXTB					R6=SXTB(R1)
							  "1011001000101111",--SXTH					R7=SXTH(R5)
							  "0100001000001010",--TST(REGISTER)		R1 AND R2
							  "1011001011001001",--UXTB					R1=UXTB(R1)					
							  "1011001010000100",--UXTH					R4=UXTH(R0)
							  "1011111100000000",--NOP
							  "0100001101101111",--MUL						R7=R7xR5
							  
							  
							  
							  "0101000000010000",--STR(REGISTER) 		MEM(R0+R2)=R0
							  "0111000011010111",--STRB(IMMEDIATE)		MEM(3+R2)=UXTB(R7)
							  "0101010001010011",--STRB(REGISTER)		MEM(R1+R2)=UXTB(R3)
							  "1000000100010111",--STRH(IMMEDIATE)		MEM(4+R2)=UXTH(R7
							  "0101001100101011",--STRH(REGISTER)		MEM(R4+R5)=UXTH(R3)
							  
							  "0110100011010111",--LDR(IMMEDIATE)T1	R7=MEM(3+R2)	
							  "1001111100000010",--LDR(IMMEDIATE)T2	R7=MEM(SP+2)
							  "0100111100000000",--LDR(Literal)			R7=MEM(PC+0)
							  "0101100000010111",--LDR(register)		R7=MEM(R0+R2)
							  "0111100100010111",--LDRB(IMMEDIATE)		R7=MEM(4+R2)
							  "0101110100101111",--LDRB(REGISTER)		R7=MEM(R4+R5)
							  "1000100011010111",--LDRH(IMMEDIATE)		R7=MEM(3+R2)
							  "0101101000010111",--LDRH(REGISTER)		R7=MEM(R0+R2)
							  "0101011001010111",--LDRSB(REGISTER)		R7=MEM(R0+R2)
							  "0101111100101111",--LDRSH(REGISTER)		R7=MEM(R4+R5)
							  "1011010111111111",--PUSH
							  "1011110111111111",--POP
							  "0100011100000000"--BX
							  );

begin


--process for read operation.
PROCESS(Clk)
BEGIN
    if(rising_edge(Clk)) then
		  if(Rd='1') then
           data <= rom(to_integer(unsigned(address)));
		  ELSE
			  DATA<=(others=>'Z');
		  end if;
    end if;
END PROCESS;

end Behavioral;