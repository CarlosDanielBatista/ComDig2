library ieee;
use ieee.std_logic_1164.all;

entity REC is
port ( 	
  i_REC : in std_logic_vector(15 downto 0); -- Entrada para gravar os dados
  o_REC : out std_logic_vector(15 downto 0));-- Saida para gravar os dados
end REC;

architecture REC_ARCHITECTURE of REC is
begin
process(i_REC)
 begin
 
 o_REC  <=  i_REC; -- Função para gravar dados
 
 end process;
 end architecture;