
-- DL 038 D      4 NAND Treiber mit je 2 Eingängen, Kollektor offen  SN74LS38

library ieee;
use ieee.std_logic_1164.all;

entity DL038D is
port 
(
    a : in  std_ulogic;
    b : in  std_ulogic;
    q : out std_ulogic
);
end entity DL038D;

architecture rtl of DL038D is

begin
    
    q <= 'Z' when not (a and b) = '1' else '0';

end architecture rtl;
