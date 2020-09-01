----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:11:55 11/24/2016 
-- Design Name: 
-- Module Name:    Datamem - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Datamem is
    Port ( clk : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (9 downto 0);
           rd : out  STD_LOGIC_VECTOR (31 downto 0);
           wd : in  STD_LOGIC_VECTOR (31 downto 0));
end Datamem;

architecture Behavioral of Datamem is
	type FR is array (0 to 1023) of std_logic_vector(31 downto 0);
	signal FRMem : FR:=(
		X"00000099",--0
		X"00000088",--1
		others => x"00000000"
	);
begin
	process (clk) is
	begin
		if (clk'event and clk='1') then
			if WE='1' then
				FRMem(conv_integer(A(9 downto 0))) <= wd;				
			end if;
		end if;
	end process;
	rd <= FRMem(conv_integer(A(9 downto 0)));
end Behavioral;

