
-- DL 010 D      3 NAND mit je 3 Eingängen                           SN74LS10

library ieee;
use ieee.std_logic_1164.all;

entity DL010D is
port
(
    a : in  std_ulogic;
    b : in  std_ulogic;
    c : in  std_ulogic;
    q : out std_ulogic
);
end entity DL010D;

architecture rtl of DL010D is

begin
    
    q <= not (a and b and c);

end architecture rtl;
