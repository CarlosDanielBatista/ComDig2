-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity TOP_TMR is
end TOP_TMR;

architecture TMR_ARCHITECTURE of TOP_TMR is

component TMR is
port (	
  i_CANAL1 	:  in std_logic_vector(15 downto 0); -- Entrada 1 de dados
  i_CANAL2 	:  in std_logic_vector(15 downto 0); -- Entrada 2 de dados
  i_CANAL3 	:  in std_logic_vector(15 downto 0); -- Entrada 3 de dados
  i_CANAL4 	:  in std_logic_vector(15 downto 0); -- Entrada 4 de dados
  i_CANAL5 	:  in std_logic_vector(1 downto 0); -- Entrada do divisor de dados
  o_RETURN  :  out std_logic_vector(15 downto 0)); -- Saida de dados
end component;

signal w_END: std_logic_vector (15 downto 0);-- Definir signal w_END
signal w_S: std_logic_vector (15 downto 0); -- Definir signal w_S
signal w_1: std_logic_vector (15 downto 0); -- Definir signal w_1
signal w_2: std_logic_vector (15 downto 0); -- Definir signal w_2
signal w_3: std_logic_vector (15 downto 0); -- Definir signal w_3
signal w_4: std_logic_vector (15 downto 0); -- Definir signal w_4
signal w_5: std_logic_vector (1 downto 0); -- Definir signal w_5

begin
u_TMR: TMR port map( -- Definir as portas do TMR
  i_CANAL1  =>  w_1,
  i_CANAL2  =>  w_2,
  i_CANAL3  =>  w_3,
  i_CANAL4  =>  w_4,
  i_CANAL5  =>  w_5,
  o_RETURN  =>  w_S);

process
begin
-- Terceiro teste para checar se o select para o w_1 funciona
w_1  <=  "1000100010001000";
w_2  <=  "1010101010101010";
w_3	 <=  "1010101010101011";
w_4	 <=  "1010101010101011";
w_5  <=  "00"; 
wait for 3ns;
assert (w_S  =  "0000000000000000") report "Falha no teste 1 - 1° entrada usada" severity error;

-- Terceiro teste para checar se o select para o w_2 funciona
w_1  <=  "1100110011001100";
w_2  <=  "0011110000111100";
w_3	 <=  "1100110011001100";
w_4	 <=  "1010101010101011";
w_5  <=  "01";
wait for 3ns;
assert (w_S  =  "0000000000000000") report "Falha no teste 2 - 2° entrada usada" severity error;

-- Terceiro teste para checar se o select para o w_3 funciona
w_1  <= "1111111111111111";
w_2  <= "0000000011111111";
w_3  <= "0000000011111111";
w_4	 <=  "1010101010101011";
w_5  <=  "10";
wait for 3ns;
assert (w_S  =  "0000000000000000") report "Falha no teste 3 - 3° entrada usada" severity error;

-- Quarto teste para checar se o select para o w_4 funciona
w_1  <=  "0000000011111111";
w_2  <=  "0000000011111111";
w_3	 <=  "0000000011111111";
w_4	 <=  "1010101010101011";
w_5  <=  "11";
wait for 3ns;
assert (w_S  =  "0000000000000000") report "Falha no teste 4 - 4° entrada usada" severity error;

-- Limpar os dados w_1, w_2, w_3, w_4 e w_5
      w_1  <=  "0000000000000000";
      w_2  <=  "0000000000000000";
      w_3  <=  "0000000000000000";
      w_4  <=  "0000000000000000";
      w_5  <=  "00";
      wait;
      assert false report "Teste Concluido." severity note; --Avisa se o teste teve exito
      end process;
      end architecture;