library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PCreg is
    Port ( PCin : in  STD_LOGIC_VECTOR (31 downto 0);
           PCout : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  reset : in  STD_LOGIC
			  );
end PCreg;

architecture Behavioral of PCreg is
	signal temp : std_logic_vector(31 downto 0):=x"00000000";
begin

	process (clk,reset) is 
	begin
		if(clk'event and clk='1' and reset='0') then
			temp<=PCin;
		else 
			if reset='1' then
			temp<=x"00000000";
			end if;
		end if;	
end process;
	PCout<=temp;
end Behavioral;
