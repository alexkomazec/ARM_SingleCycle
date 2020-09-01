----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:25 11/25/2016 
-- Design Name: 
-- Module Name:    dp - Behavioral 
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

entity dp is
	port (clk : in std_logic;
			reset: in std_Logic;
			PCsrc : in std_logic;
			MemToReg: in std_logic;
			MemWrite: in std_logic;
			ALUCONTROL: in std_logic_vector(1 downto 0);
			ALUsrc: in std_logic;
			Immsrc: in std_logic_vector(1 downto 0);
			RegWrite: in std_logic;
			RegSrc: in std_logic_vector(1 downto 0);
			Instr: out std_logic_vector(5 downto 0);
			Flags: out std_logic_vector(3 downto 0);
			novimux: in std_logic;
			resultdp: out std_logic_vector(31 downto 0)
			);
end dp;

architecture Behavioral of dp is
	signal pcinp,pcoutp,instroutp,rd1outp,rd2outp,result,PCPlus8,exoutp,SrcB,ALUresult,ReadData,PCPlus4,WD3input : std_logic_vector(31 downto 0);
	signal a1inp,a2inp,izlnovimux: std_logic_vector(19 downto 16);
begin		

	PC: entity work.PCreg (Behavioral) port map (
			PCin => pcinp,
         PCout => pcoutp,
         clk => clk,
			reset =>reset
			);
			
	IRreg: entity work.InsMem (Behavioral) port map (
			InsMemAdr => pcoutp(9 downto 0),
			InsMemOut => instroutp
			);

	Demux0: entity work.demux0 (Behavioral) port map (
			x1 => instroutp(19 downto 16),
			sel => RegSrc(0),
			outp => a1inp
			);
			
	Demux1: entity work.demux (Behavioral) port map (
			x1 => instroutp(3 downto 0),
			x2 => instroutp(15 downto 12),
			sel => RegSrc(1),
			outp => a2inp
			);
	
	RegFile: entity work.FileRegistar (Behavioral) port map (
			clk => clk,
			RW3 => RegWrite,
			RD1 => rd1outp,
			RD2 => rd2outp,
			A1 => a1inp,
			A2 => a2inp,
			A3 => izlnovimux,
			WD3 => WD3input
			);
			
	Extender: entity work.extender (Behavioral) port map (
			sel => ImmSrc,
         inex => instroutp(23 downto 0),
         outex => exoutp
			);
	
	Demux2: entity work.demux32 (Behavioral) port map (
			x1 => rd2outp,
			x2 => exoutp,
			sel => ALUsrc,
			outp => SrcB
			);
	
	ALU: entity work.alu (Behavioral) port map (
			ALUa => rd1outp,
			ALUb => SrcB,
			ALUout => ALUresult,
			ALUsel => ALUcontrol,
			ALUflags => Flags
			);
	
	Datamem: entity work.Datamem (Behavioral) port map (
			clk => clk,
         WE => MemWrite,
         A => ALUresult(9 downto 0),
         rd => ReadData,
         wd => rd2outp
			);
			
	Demux3: entity work.demux32 (Behavioral) port map (
			x1 => ALUresult,
			x2 => ReadData,
			sel => MemToReg,
			outp => result
			);	

	Demux4: entity work.demux32 (Behavioral) port map (
			x1 => PCPlus4,
			x2 => result,
			sel => PCSrc,
			outp => pcinp
			);
	
	Addr1: entity work.Addr (Behavioral) port map (
			x1 => pcoutp,
			outp => PCPlus4
			);
			
	Addr2: entity work.Addr (Behavioral) port map (
			x1 => PCPlus4,
			outp => PCPlus8
			);
			
	Demux5: entity work.demux32 (Behavioral) port map (
			x2 => PCPlus8,
			x1 => result,
			sel => novimux,
			outp => WD3input
			);
			
	Demux6: entity work.demux (Behavioral) port map (
			x2 => "1111",
			x1 => instroutp(15 downto 12),
			sel => novimux,
			outp => izlnovimux
			);
	
	resultdp <= result;
	instr <= instroutp(27 downto 25)&instroutp(22 downto 20); 
	
end Behavioral;

