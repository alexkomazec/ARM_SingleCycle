-----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEe.std_logic_unsigned.all;
use IEEe.std_logic_arith.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
port(
	ALUa : in Std_logic_vector(31 downto 0);
	ALUb : in Std_logic_vector(31 downto 0);
	ALUout : out std_logic_vector(31 downto 0);
	ALUsel : in std_logic_vector(1 downto 0);
	ALUflags : out std_logic_vector(3 downto 0));
end ALU;

architecture Behavioral of ALU is
	constant ADD : std_logic_vector(1 downto 0):="00"; 
	constant SUB: std_logic_vector(1 downto 0):="01"; 
	constant ANDD : std_logic_vector(1 downto 0):="10"; 
	constant ORR : std_logic_vector(1 downto 0):="11"; 
	signal addPomoc : std_logic_vector(32 downto 0):="000000000000000000000000000000000";
	signal ANDPomoc : std_logic_vector(31 downto 0);
	signal ORPomoc : std_logic_vector(31 downto 0);
	signal Result : std_logic_vector(31 downto 0);
	signal temp : std_logic :='0';
begin
	process (ALUsel,alua,alub)is
	begin
		case ALUsel is
			when ADD => addPomoc<=('0'&ALua)+('0'&alub); 
							ORPomoc<=(others=>'0');
							andPomoc<=(others=>'0');
			when SUB => addPomoc<=('0'&alua) - ('0'&alub);
							ORPomoc<=(others=>'0');
							andPomoc<=(others=>'0');
			when ORR =>  ORpomoc<= ALUa or ALUb ;
							addPomoc<=(others=>'0');
							andPomoc<=(others=>'0');
			when ANDD =>  ANDpomoc<= ALUa and ALUb ;
							addPomoc<=(others=>'0');
							ORPomoc<=(others=>'0');
			when others => null;
		end case;	
	end process;

	result <= ADDPOMOC(31 downto 0) when Alusel="00" else
				ADDPOMOC(31 downto 0) when Alusel="01" else
				ANDpomoc when alusel="10" else
				ORPomoc when alusel="11";

	ALUout <= result;				

	ALUflags(3)<=(alua(31)xnor alub(31)xnor alusel(0))AND (not Alusel(1))and (addpomoc(31) xor alua(31));  --overflow
	ALUflags(2)<= (not alusel(1))and addPomoc(32); --carry
	AluFlags(1)<=not(result(0) or result(1) or result(2) or result(3)or result(4)or result(5)or result(6)or result(7)or result(8)or result(9)or result(10)or result(11)or result(12)or result(13)or result(14)or result(15)or result(16)or result(17)or result(18)or result(19)or result(20)or result(21)or result(22)or result(23)or result(24)or result(25)or result(26)or result(27)or result(28)or result(29)or result(30)or result(31)); --zero
	AluFlags(0)<=result(31); --negative

end Behavioral; 

