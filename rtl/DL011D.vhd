
-- DL 011 D      3 AND mit je 3 Eingängen                            SN74LS11

library ieee;
use ieee.std_logic_1164.all;

entity DL011D is
port 
(
    a : in  std_ulogic;
    b : in  std_ulogic;
    c : in  std_ulogic;
    q : out std_ulogic
);
end entity DL011D;

architecture rtl of DL011D is

begin
    
    q <= (a and b and c);

end architecture rtl;
