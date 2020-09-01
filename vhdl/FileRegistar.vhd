----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:47:38 11/24/2016 
-- Design Name: 
-- Module Name:    FileRegistar - Behavioral 
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FileRegistar is
	port (
	clk: in std_logic;
	RW3 : in std_logic;
	RD1 : out STD_logic_vector(31 downto 0);
	RD2 : out STD_logic_vector(31 downto 0);
	A1 : in STD_logic_vector(3 downto 0);
	A2 : in STD_logic_vector(3 downto 0);
	A3 : in STD_logic_vector(3 downto 0);
	WD3 : in STD_logic_vector(31 downto 0)
);
end FileRegistar;

architecture Behavioral of FileRegistar is
	type FR is array (0 to 15) of std_logic_vector(31 downto 0);
	signal FRMem : FR:=(
		X"00000003",--0
		X"00000005",--1
		X"00000000",--2
		X"00000000",--3
		X"00000000",--4
		X"00000000",--5
		X"00000000",--6
		X"00000000",--7
		X"00000000",--8
		X"00000000",--9
		X"00000000",--10
		X"00000000",--11
		X"00000000",--12
		X"00000000",--13
		X"00000000",--14
		X"00000000"--15
	);
begin
	prvi:process(clk,RW3) is
	begin
		if (clk'event and clk='1') then			
			if(RW3 ='1') then
				FRmem(conv_integer(unsigned(A3)))<=WD3;
			end if;
		end if;
	end process;
	RD1<=FRMem(conv_integer(unsigned(A1)));
	RD2<=FRMem(conv_integer(unsigned(A2)));
end Behavioral;

