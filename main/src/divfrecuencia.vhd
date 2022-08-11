library ieee;
use ieee.std_logic_1164.all;

entity divfrecuencia is port (
    clk_in:        in std_logic;
    rst:        in std_logic;
    clk_out:    out std_logic);
end divfrecuencia;

architecture behavorial of divfrecuencia is
    signal temporal: std_logic:= '0';
    signal counter: integer range 0 to 05000000:= 0;
begin
    frequency_divider: process(rst, clk_in) begin
        if(rst = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if(counter = 05000000) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_out <= temporal; 

end behavorial;   