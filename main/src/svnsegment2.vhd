library IEEE;
use IEEE.std_logic_1164.all;

entity svnsegment2 is
    port(
    w,x,y,z : in STD_LOGIC;
    s2: out STD_LOGIC_VECTOR(6 downto 0));
    end svnsegment2;

architecture Universal2 of svnsegment2 is
signal Valor : STD_LOGIC_VECTOR(3 downto 0);
 
begin
    Valor <= w & x & y & z;
    
combinacional: process(Valor)
begin
    case Valor is
        when "0000" =>
        s2 <= "1000000";   
        
        when "0001" =>
        s2 <= "1111001";
        
        when "0010" =>
        s2 <= "0100100";
        
        when "0011" =>
        s2 <= "0110000";
        
        when "0100" =>
        s2 <= "0011001";
        
        when "0101" =>
        s2 <= "0010010";
        
        when "0110" =>
        s2 <= "1011111";
        
        when "0111" =>
        s2 <= "1111000";
        
        when "1000" =>
        s2 <= "0000000";
        
        when "1001" =>
        s2 <= "0011000";
        
        when "1010" =>
        s2 <= "0001000";
        
        when "1011" =>
        s2 <= "0000011";
        
        when "1100" =>
        s2 <= "1000110";
        
        when "1101" =>
        s2 <= "0111101";
        
        when "1110" =>
        s2 <= "0000110";
        
        when others =>
        s2 <= "0001110"; 
        
    end case;
    end process;
end Universal2;