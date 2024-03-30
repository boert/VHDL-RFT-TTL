
-- DL 123        2 monostabile Multivibratoren                       SN74LS123

library ieee;
use ieee.std_logic_1164.all;

entity DL123D is
port 
(
    d : in  std_ulogic;
    q : out std_ulogic
);
end entity DL123D;

architecture rtl of DL123D is

    constant me_c : string := rtl'path_name;

begin

    process
    begin
        report me_c & ": tbd";
        wait;
    end process;
    
end architecture rtl;
