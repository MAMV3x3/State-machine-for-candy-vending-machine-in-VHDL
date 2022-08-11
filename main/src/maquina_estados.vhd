library ieee;
use ieee.std_logic_1164.all;

entity maquina_estados is port (
   clk, rstn:	in std_logic;
   x:			in std_logic_vector (1 downto 0);
   cambio:		out std_logic_vector (3 downto 0);
   acum:		out std_logic_vector (3 downto 0);
   led:			out std_logic);
end maquina_estados;

architecture core of maquina_estados is
	signal Qp, Qs: std_logic_vector (3 downto 0):= "0000";
begin 
	comb: process(Qp, x)
		begin
	   		case Qp is	 
		   		when "0000" =>
		   			if (x = "00") then
			   			Qs <= "0000";
		   			elsif (x = "01") then
			   			Qs <= "0001";
 		   			elsif (x = "10") then
			   			Qs <= "0010";
		   			else
			   			Qs <= "0101";
		   			end if;
					led <= '0';
					cambio <= "0000";
					acum <= "0000";
		   							
		   		when "0001" =>
		   			if (x = "00") then
			   			Qs <= "0001";
		   			elsif (x = "01") then
			   			Qs <= "0010";
 		   			elsif (x = "10") then
			   			Qs <= "0011";
		   			else
			   			Qs <= "0110";
		   			end if;
					led <= '0';
					cambio <= "0000";
					acum <= "0001";
		  
		   		when "0010" =>
		   			if (x = "00") then
			   			Qs <= "0010";
		   			elsif (x = "01") then
			   			Qs <= "0011";
 		   			elsif (x = "10") then
			   			Qs <= "0100";
		   			else
			   			Qs <= "0111";
		   			end if;
					led <= '0';
					cambio <= "0000";
					acum <= "0010";
						
				when "0011" =>
			   		if (x = "00") then
					   Qs <= "0011";
					elsif (x = "01") then
			   			Qs <= "0100";
					elsif (x = "10") then
			   			Qs <= "0101";
		   			else
			   			Qs <= "1000";
		   			end if;
					led <= '0';
					cambio <= "0000";
					acum <= "0011";
		  	   
				when "0100" =>
		   			if (x = "00") then
			   			Qs <= "0100";
		   			elsif (x = "01") then
			   			Qs <= "0101";
 		   			elsif (x = "10") then
			   			Qs <= "0110";
		   			else
			   			Qs <= "1001";
		   			end if;
		   		 	led <= '0';
					cambio <= "0000";
					acum <= "0100";
						
				when "0101" =>
		   			if (x = "00") then
			   			Qs <= "0101";
		   			elsif (x = "01") then
			   			Qs <= "0110";
 		   			elsif (x = "10") then
			   			Qs <= "0111";
		   			else
			   			Qs <= "1010";
		   			end if;
		  	   		led <= '0';
					cambio <= "0000";
					acum <= "0101";
						
				when "0110" =>
			   		Qs <= "1110";
					led <= '1';
					cambio <= "0000";
					acum <= "0110";
					   
		   		when "0111" =>
			   		Qs <= "1110";
		 			led <= '1';
					cambio <= "0001";
					acum <= "0110";
					   
				when "1000" =>
			   		Qs <= "1110";  
  			   		led <= '1';
					cambio <= "0010";
					acum <= "0110";
						 
		  		when "1001" =>
			   		Qs <= "1110";
					led <= '1';
					cambio <= "0011";
					acum <= "0110";
					
				when "1110" =>
			   		Qs <= "1111";
					led <= '1';
				
				when "1111" =>
			   		Qs <= "0000";
					led <= '1';
					   
		   		when others =>	
					Qs <= "1110";
					led <= '1';
					cambio <= "0100";
					acum <= "0110";
					
				end case;
	end process comb;

	sec: process(rstn, clk)
    	begin
			if (rstn = '1') then
				Qp <= "0000";
			elsif (clk'event and clk='1') then		
				Qp <= Qs;
			end if;
    end process sec; 
	
end core;