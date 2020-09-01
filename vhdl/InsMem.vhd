----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:42:24 11/24/2016 
-- Design Name: 
-- Module Name:    InsMem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InsMem is
	port (
	InsMemAdr : in std_logic_vector(9 downto 0);
	InsMemOut: out std_logic_vector(31 downto 0)
	);
end InsMem;

architecture Behavioral of InsMem is
	type InsMemorija is array (0 to 1023) of std_logic_vector(31 downto 0);
	constant Memorija: InsMemorija:=(
		"11100000000000000010000000000001",--add adresa0+adresa1=adresa2
		"11100010000000000100000000000111",--add adresa0+extender7..0=adresa4 ...E2004007
		"11100000001000100101000000000000",--sub adresa2-adresa0=adresa5 ...E0225000
		"11100010001000100110000000000101",--sub adresa2-extender5=adresa6 ...E2226005
		"11100010010000100111000000001010",--and adresa2 i extender10=adresa7 ...E242700A
		"11100000010000101000000000000000",--and adresa2 i adresa0=adresa8 ...E0428000
		"11100010011000101001000000001010",--or  adresa2 i extender10=adresa9 ...E262900A
		"11100000011000101010000000000000",--or  adresa2 i adresa0=adresa10 ...E062A000
		"11100100000011111010000000000000",--mem imm, store, sabere vrednost sa adrese Rn(RegFile) i sa extendera  .E40FA000
													  -- i to je adresa u DataMem na koju ce se upisati Rd(iz RegFile)
		"11100100000111111011000000000001",--mem imm, load ..E41FB001
		"11101110000000000000000000000011",--branch na 3 u PC ..EE000003
		others => (x"00000000")
		);
begin
		InsMemOUT<=Memorija(conv_integer(unsigned(InsMemAdr)));
end Behavioral;