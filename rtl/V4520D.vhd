
-- V 4520 D    zwei binäre 4bit Vorwärtszähler 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity V4520D is
port 
(
    c1 : in  std_ulogic;
    c2 : in  std_ulogic;
    r  : in  std_ulogic;
    o  : out std_ulogic_vector(3 downto 0)
);
end entity V4520D;

architecture rtl of V4520D is

    signal count : unsigend( 3 downto 0);

begin
    
    process
    begin

        if c2 = '1' then
            if rising_edge( c1) then
                count <= count + 1;
            end if;
        end if;

        if c1 = '0' then
            if falling_edge( c2) then
                count <= count + 1;
            end if;
        end if;
    
        if r = '1' then
            count <= "0000";
        end if;

    end process;
    
    
end architecture rtl;
