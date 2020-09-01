----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:03 11/25/2016 
-- Design Name: 
-- Module Name:    demux - Behavioral 
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

entity demux is
    Port ( x1 : in  STD_LOGIC_VECTOR (3 downto 0);
			  x2 : in  STD_LOGIC_VECTOR (15 downto 12);
           sel : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR (3 downto 0));
end demux;

architecture Behavioral of demux is
begin
	outp <= x1 when sel='0' else x2;
end Behavioral;

