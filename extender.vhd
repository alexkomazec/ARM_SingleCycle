----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:14:23 11/24/2016 
-- Design Name: 
-- Module Name:    extender - Behavioral 
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity extender is
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
           inex : in  STD_LOGIC_VECTOR (23 downto 0);
           outex : out  STD_LOGIC_VECTOR (31 downto 0));
end extender;

architecture Behavioral of extender is
	signal outp : std_logic_vector(31 downto 0);
begin
	process(inex,sel) is
	begin
		case sel is
			when "00" => outp <=(x"000000" & inex(7 downto 0)); -- za 8bitni ulaz
			when "01" => outp <=(x"00000" & inex(11 downto 0)); -- za 12bitni ulaz
			when "10" => outp <=(x"00" & inex(23 downto 0)); -- za 24bitni ulaz
			when others => outp<=(others=>'0');
		end case;
	end process;
	outex <= outp;
end Behavioral;

