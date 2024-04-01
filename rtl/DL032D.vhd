
-- DL 032 D      4 OR mit je 2 Eingängen                             SN74LS32

library ieee;
use ieee.std_logic_1164.all;

entity DL032D is
port 
(
    a : in  std_ulogic;
    b : in  std_ulogic;
    q : out std_ulogic
);
end entity DL032D;

architecture rtl of DL032D is

begin
    
    q <= a or b;

end architecture rtl;
