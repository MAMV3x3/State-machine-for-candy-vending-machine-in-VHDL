library ieee;
use ieee.std_logic_1164.all;

entity conversorbits is port (
   x:		in std_logic_vector (2 downto 0);
   y:		out std_logic_vector (1 downto 0));	
end conversorbits;

architecture conv of conversorbits is
begin
	process(x)
	begin
		if(x = "111") then
			y <= "00";
		elsif(x = "110") then
			y <= "01";
		elsif(x = "101") then
			y <= "10";
		elsif(x = "011") then
			y <= "11";
		end if;
	end process;
end conv;