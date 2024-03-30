
-- DL 004 D      6 Inverter                                          SN74LS04 

library ieee;
use ieee.std_logic_1164.all;

entity DL004D is
port 
(
    a : in  std_ulogic;
    q : out std_ulogic
);
end entity DL004D;

architecture rtl of DL004D is

begin
    
    q <= not a;

end architecture rtl;
