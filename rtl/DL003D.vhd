
-- DL 003 D      4 NAND mit je 2 Eingängen, Kollektor offen          SN74LS03

library ieee;
use ieee.std_logic_1164.all;

entity DL003D is
port 
(
    a : in  std_ulogic;
    b : in  std_ulogic;
    q : out std_ulogic
);
end entity DL003D;

architecture rtl of DL003D is

begin
    
    q <= 'Z' when not (a and b) = '1' else '0';

end architecture rtl;
