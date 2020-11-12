library ieee;
use ieee.std_logic_1164.all;

entity VOTER is
port ( 
  i_1  :  in std_logic_vector(15 downto 0); -- Entrada 1 de dados
  i_2  :  in std_logic_vector(15 downto 0); -- Entrada 2 de dados
  i_3  :  in std_logic_vector(15 downto 0); -- Entrada 3 de dados
  i_4  :  in std_logic_vector(15 downto 0); -- Entrada 4 de dados
  i_5  :  in std_logic_vector(1 downto 0); -- Entrada do divisor de dados
  o_1  :  out std_logic_vector(15 downto 0));-- Saida de dados
end VOTER;
architecture VOTER_ARCHITECTURE of VOTER is
begin
 process(i_1, i_2, i_3, i_4, i_5)
 begin
 	case i_5 is
		when "00" => o_1 <= i_1;
		when "01" => o_1 <= i_2;
		when "10" => o_1 <= i_3;
		when others => o_1 <= i_4;
	end case;
 
 end process;
end VOTER_ARCHITECTURE;
