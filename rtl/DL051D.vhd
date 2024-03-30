
-- DL 051 D      2 AND-NOR mit je 2 x 3 und 2 x 2 Eingängen          SN74LS51N 

library ieee;
use ieee.std_logic_1164.all;

entity DL051D is
port 
(
    a1 : in  std_ulogic;
    b1 : in  std_ulogic;
    c1 : in  std_ulogic;
    d1 : in  std_ulogic;
    e1 : in  std_ulogic;
    f1 : in  std_ulogic;
    --
    a2 : in  std_ulogic;
    b2 : in  std_ulogic;
    d2 : in  std_ulogic;
    e2 : in  std_ulogic;
    --
    q1 : out std_ulogic;
    q2 : out std_ulogic
);
end entity DL051D;

architecture rtl of DL051D is

begin
    
    q1 <= (a1 and b1 and c1) nor (d1 and e1 and f1);
    q2 <= (a2 and b2)        nor (d2 and e2);
    
end architecture rtl;
