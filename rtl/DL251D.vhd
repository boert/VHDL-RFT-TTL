
-- DL 251 D      8-auf-1 Multiplexer mit Tristate-Ausgängen          SN74LS251N

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DL251D is
port 
(
    d    : in  std_ulogic_vector(7 downto 0);
    --
    s    : in  std_ulogic_vector(2 downto 0);
    oe_n : in  std_ulogic;                      -- strobe
    --
    y    : out std_ulogic;
    y_n  : out std_ulogic
);
end entity DL251D;


architecture rtl of DL251D is
    
begin

    y   <=     d( to_integer( to_01( unsigned( s)))) when oe_n = '0' else 'Z';
    y_n <= not d( to_integer( to_01( unsigned( s)))) when oe_n = '0' else 'Z';

end architecture rtl;
