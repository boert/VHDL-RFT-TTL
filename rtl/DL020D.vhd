
-- DL 020 D      2 NAND mit je 4 Eingängen                           SN74LS20

library ieee;
use ieee.std_logic_1164.all;

entity DL020D is
port 
(
    a : in  std_ulogic;
    b : in  std_ulogic;
    c : in  std_ulogic;
    d : in  std_ulogic;
    q : out std_ulogic
);
end entity DL020D;

architecture rtl of DL020D is

begin
    
    q <= not (a and b and c and d);

end architecture rtl;
