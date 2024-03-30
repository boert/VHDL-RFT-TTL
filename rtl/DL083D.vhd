
-- DL 083 D      4-Bit Volladdierer

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DL083D is
port 
(
    a  : in  std_ulogic_vector(3 downto 0);
    b  : in  std_ulogic_vector(3 downto 0);
    ci : in  std_ulogic;
    --
    q  : out std_ulogic_vector(3 downto 0);
    co : out std_ulogic
);
end entity DL083D;

architecture rtl of DL083D is

begin

    process( a, b, ci)
        variable result: unsigned(4 downto 0);
    begin
        result := resize( unsigned( a), 5) + resize( unsigned( b), 5);
        if ci = '1' then
            result := result + 1;
        end if;
        q  <= std_ulogic_vector( result(3 downto 0));
        co <= result(4);
    end process;
    
end architecture rtl;
