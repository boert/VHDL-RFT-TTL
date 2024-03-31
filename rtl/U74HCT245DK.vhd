
-- U 74 HCT 245 DK  8 Bit Bus-Transceiver, nicht invertierend

library ieee;
use ieee.std_logic_1164.all;

entity U74HCT245DK is
port 
(
    a    : inout std_ulogic_vector(7 downto 0);
    b    : inout std_ulogic_vector(7 downto 0);
    dir  : in    std_ulogic;
    oe_n : in    std_ulogic;
);
end entity U74HCT245DK;

architecture rtl of U74HCT245DK is

begin

    a <= b when oe_n = '0' and dir = '0' else ( others => 'Z');
    b <= a when oe_n = '0' and dir = '1' else ( others => 'Z');

end architecture rtl;
