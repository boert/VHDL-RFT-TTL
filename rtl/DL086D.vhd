
-- DL 086 D      4 Exklusiv-OR-Gatter mit je 2 Eingängen  SN74LS86

library ieee;
use ieee.std_logic_1164.all;

entity DL086D is
port 
(
    a : in  std_ulogic;
    b : in  std_ulogic;
    --
    q : out std_ulogic
);
end entity DL086D;

architecture rtl of DL086D is

begin
    
    q <= a xor b; 

end architecture rtl;
