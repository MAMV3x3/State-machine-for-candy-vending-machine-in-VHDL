library ieee;
use ieee.std_logic_1164.all;

entity secuencia_led is port(
	clk:		in std_logic;
	state:		in std_logic;
	led:		out std_logic_vector (9 downto 0));
end secuencia_led;
	
architecture barrido of secuencia_led is
	signal Qp, Qs: std_logic_vector (3 downto 0):= "0000";
begin
	me: process(Qp, state)
		begin
			case Qp is
				when "0000" =>
					if(state = '0') then
						Qs <= "0000";
						led <= "0000000000";
					elsif(state= '1') then
						led <= "1111100000";
						Qs <= "0001";
					end if;
				when "0001" =>
					led <= "0000011111";
					Qs <= "0010";

				when "0010" =>
					led <= "1111100000";
					Qs <= "0011";

				when "0011" =>
					led <= "0000011111";
					Qs <= "0100";

				when "0100" =>
					led <= "1111100000";
					Qs <= "0101";

				when "0101" =>
					led <= "0000011111";
					Qs <= "0110";

				when "0110" =>
					led <= "1111100000";
					Qs <= "0111";

				when "0111" =>
					led <= "0000011111";
					Qs <= "1000";

				when "1000" =>
					led <= "1111100000";
					Qs <= "1001";

				when "1001" =>
					led <= "0000011111";
					Qs <= "1010";
				
				when "1010" =>
					led <= "1111100000";
					Qs <= "1011";
					
				when "1011" =>
					led <= "0000011111";
					Qs <= "1111";

				when others =>
					led <= "0000000000";
					Qs <= "0000";
			end case;
		end process me;
		
	sec: process(clk)
    	begin
			if (clk'event and clk='1') then		
				Qp <= Qs;
			end if;
    end process sec;
	
end barrido;