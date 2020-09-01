----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:42:40 11/26/2016 
-- Design Name: 
-- Module Name:    topfile - Behavioral 
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

entity topfile is
    Port ( clk : in std_logic;
			  reset: in std_logic;
			  result : out  STD_LOGIC_VECTOR (31 downto 0);
			  flags : out std_logic_vector (3 downto 0)
			  );
end topfile;

architecture Behavioral of topfile is
	signal instrSig :std_logic_vector(5 downto 0);
	signal flagsSig :std_logic_vector(3 downto 0);
	signal PCSrcSig, memtoregSig, memwriteSig, alusrcSig, regwriteSig, novimuxSig:std_logic;
	signal alucnSig, immsrcSig , regsrcSig :std_logic_vector(1 downto 0);
begin
	CU: entity work.cu port map(
		  instr =>  instrSig,
		  flags => flagsSig,
		  PCSrc => PCSrcSig,
		  MemToReg => memtoregSig,
		  MemWrite => memwriteSig,
		  AluControl => alucnSig,
		  AluSrc => alusrcSig,
		  ImmSrc => immsrcSig,
		  RegWrite => regwriteSig,
		  novimux => novimuxSig,
		  flagsoutput => flags,
		  RegSrc => regsrcSig
	);

	DP: entity work.dp port map(
			clk => clk,
			reset => reset,
			PCsrc => PCSrcSig,
			MemToReg => memtoregSig,
			MemWrite => memwriteSig,
			ALUCONTROL => alucnSig,
			ALUsrc => alusrcSig,
			Immsrc => immsrcSig,
			RegWrite => regwriteSig,
			RegSrc => regsrcSig,
			Instr => instrSig,
			Flags => flagsSig,
			novimux => novimuxSig,
			resultdp => result
			);

end Behavioral;

