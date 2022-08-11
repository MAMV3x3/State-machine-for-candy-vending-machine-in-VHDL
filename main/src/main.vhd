library ieee;
use ieee.std_logic_1164.all;

entity main is port (
   clk, rstn:			in std_logic;
   x:					in std_logic_vector (2 downto 0);
   led:					out std_logic_vector (9 downto 0);
   segment_cambio:		out std_logic_vector (6 downto 0);
   segment_acum:		out std_logic_vector (6 downto 0));
end main;

architecture core of main is
	component divfrecuencia is port (
    	clk_in:     in std_logic;
    	rst:        in std_logic;
    	clk_out:    out std_logic);
	end component;
	
	component frecuencialed is port (
    	clk_in:     in std_logic;
    	rst:        in std_logic;
    	clk_out:    out std_logic);
	end component;
	
	component svnsegment is port (
		w,x,y,z: 	in std_logic;
		s2: 		out std_logic_vector(6 downto 0));
	end component;
	
	component svnsegment2 is port (
		w,x,y,z: 	in std_logic;
		s2: 		out std_logic_vector(6 downto 0));
	end component;
	
	component secuencia_led is port(
		clk:		in std_logic;
		state:		in std_logic;
		led:		out std_logic_vector (9 downto 0));
	end component;
	
	component conversorbits is port (
   		x:		in std_logic_vector (2 downto 0);
   		y:		out std_logic_vector (1 downto 0));	
	end component;

   	component maquina_estados is port (
   		clk, rstn:	in std_logic;
   		x:			in std_logic_vector (1 downto 0);
   		cambio:		out std_logic_vector (3 downto 0);
   		acum:		out std_logic_vector (3 downto 0);
   		led:		out std_logic);
	end component;
	
	signal two_bit_signal: std_logic_vector(1 downto 0):="00";
	signal clock_me, clock_led: std_logic;
	signal cambio, acum: std_logic_vector (3 downto 0):="0000";
	signal led_state: std_logic:= '0';
begin
	-- Convertidor a 2 bits
	stage1: conversorbits port map(x, two_bit_signal);
	-- Divisores de frecuencia
	stage2:	divfrecuencia port map(clk, rstn, clock_me);
	stage3:	frecuencialed port map(clk, rstn, clock_led); 
	-- Maquina de estados
	stage4: maquina_estados port map(clock_me, rstn, two_bit_signal, cambio, acum, led_state);
	-- Secuencia de leds
	stage5:	secuencia_led port map(clock_led, led_state, led);
	-- Display 7 segmentos
	stage6: svnsegment port map(acum(3), acum(2), acum(1), acum(0), segment_acum);
	stage7: svnsegment2 port map(cambio(3), cambio(2), cambio(1), cambio(0), segment_cambio);
end core;