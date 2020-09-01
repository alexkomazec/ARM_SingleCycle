----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:15:29 11/25/2016 
-- Design Name: 
-- Module Name:    cu - Behavioral 
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

entity cu is
    Port ( instr : in  STD_LOGIC_VECTOR (5 downto 0);
           flags : in  STD_LOGIC_VECTOR (3 downto 0);
           PCSrc : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           AluControl : out  STD_LOGIC_VECTOR (1 downto 0);
           AluSrc : out  STD_LOGIC;
           ImmSrc : out  STD_LOGIC_VECTOR (1 downto 0);
           RegWrite : out  STD_LOGIC;
           novimux : out  STD_LOGIC;
			  flagsoutput: out std_logic_vector(3 downto 0);
           RegSrc : out  STD_LOGIC_VECTOR (1 downto 0));
end cu;

architecture Behavioral of cu is
	type FR is array (0 to 15) of std_logic_vector(9 downto 0);
	constant FRMem : FR := ("0000001001",--dpreg
								  "0000001001",--dpreg
								  "0001001001",--dpimm
								  "0001001001",--dpimm
								  "0011010100",--str
								  "0101011000",--ldr
								  "0011010100",--str
								  "0101011000",--ldr
								  "0000000000",
								  "0000000000",
								  "0000000000",
								  "0000000000",
								  "1001100010",--B
								  "1001100010",--B
								  "1001100010",--B
								  "1001100010");--B
	signal code: std_logic_vector(9 downto 0);
begin
	code <= FRMem(conv_integer(instr(5 downto 3) & instr(0))); --op&I&S  PROMENA 1:38h 27 NOVEMBAR
	PCSrc<=code(9);
	novimux<=code(9);
	MemToReg<=code(8);
	MemWrite<=code(7);
	ALUSrc<=code(6);
	ImmSrc<=code(5 downto 4);
	RegWrite<=code(3);
	RegSrc<=code(2 downto 1);
	process(instr)is
	begin
		if(instr(5 downto 4)="00") then
			AluControl<=instr(2 downto 1);
		else
			AluControl<="00";
		end if;
	end process;
	flagsoutput <= flags;
end Behavioral;

