-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
-- ver se precisa biblitoeca vector

entity TMR is
port (	
  i_CANAL1 	:  in std_logic_vector(15 downto 0); -- Entrada 1 de dados
  i_CANAL2 	:  in std_logic_vector(15 downto 0); -- Entrada 2 de dados
  i_CANAL3 	:  in std_logic_vector(15 downto 0); -- Entrada 3 de dados
  i_CANAL4 	:  in std_logic_vector(15 downto 0); -- Entrada 4 de dados
  i_CANAL5 	:  in std_logic_vector(1 downto 0); -- Entrada do divisor de dados
  o_RETURN  :  out std_logic_vector(15 downto 0)); -- Saida de dados
end TMR;
        
architecture TMR_ARCHITECTURE of TMR is

component VOTER is 
port(
  i_1 : in std_logic_vector(15 downto 0); -- Entrada 1 de dados
  i_2 : in std_logic_vector(15 downto 0); -- Entrada 2 de dados
  i_3 : in std_logic_vector(15 downto 0); -- Entrada 3 de dados
  i_4 : in std_logic_vector(15 downto 0); -- Entrada 4 de dados
  i_5 : in std_logic_vector(1 downto 0); -- Entrada do divisor de dados
  o_1 : out std_logic_vector(15 downto 0));-- Saida de dados
end component;


component REC is
port (	
  i_REC  :  in std_logic_vector(15 downto 0); -- Entrada para gravar dados
  o_REC  :  out std_logic_vector(15 downto 0));-- Saida para gravar dados
end component;

signal w_END  :  std_logic_vector(15 downto 0); -- Definir signal w_END

begin
u_VOTER: VOTER port map( -- definir os nomes das portas do VOTER
  i_1  =>  i_CANAL1, 
  i_2  =>  i_CANAL2,
  i_3  =>  i_CANAL3,
  i_4  =>  i_CANAL4,
  i_5  =>  i_CANAL5,
  o_1  =>  w_END);

u_REC: REC port map( -- definir os nomes das portas de gravação da receiver(REC)
  i_REC => w_END,
  o_REC => o_RETURN);

                                
end TMR_ARCHITECTURE;