
-- DL 000 D      4 NAND mit je 2 Eingängen                           SN74LS00

library ieee;
use ieee.std_logic_1164.all;

entity DL000D is
    port 
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        q : out std_ulogic
      );
end entity DL000D;

architecture rtl of DL000D is

begin
    
    q <= not (a and b);

end architecture rtl;
