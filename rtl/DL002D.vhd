
-- DL 002 D      4 NOR mit je 2 Eingängen                            SN74LS02


library ieee;
use ieee.std_logic_1164.all;

entity DL002D is
port 
(
    a : in  std_ulogic;
    b : in  std_ulogic;
    q : out std_ulogic
);
end entity DL002D;


architecture rtl of DL002D is

begin
    
    q <= not (a or b);

end architecture rtl;
