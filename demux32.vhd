----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:48:18 11/25/2016 
-- Design Name: 
-- Module Name:    demux32 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demux32 is
    Port ( x1 : in  STD_LOGIC_VECTOR (31 downto 0);
           x2 : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR (31 downto 0));
end demux32;

architecture Behavioral of demux32 is
begin
	outp <= x1 when sel='0' else x2;
end Behavioral;

