    
-- U 6216 D      2048 x 8 kbit statisches RAM 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity U6216D is
port
(
    a      : in    std_logic_vector( 10 downto 0);
    ce1_n  : in    std_logic;
    ce2    : in    std_logic;
    oe_n   : in    std_logic;
    we_n   : in    std_logic;
    dq     : inout std_logic_vector( 7 downto 0)
);
end entity U6216D;


architecture simulation of U6216D is

    type memory_array_t is array(0 to 2047) of std_logic_vector( 7 downto 0);

    signal memory_array: memory_array_t := (( others => '0') => '0);
    signal address : integer range 0 to 2047;
    signal do      : std_logic_vector( 7 downto 0);
    
begin

    address <= to_integer( unsigned( to_x01( a)));
    
    process( ce1_n, ce2, oe_n, we_n, dq, address)
    begin
        do <= ( others => 'Z');
        if ce1_n = '0' and ce2 = '1' then
            if we_n = '0' then
                memory_array( address) <= dq;
            end if;
            do <= memory_array( address);
        end if;
    end process;

    dq <= do when ce1_n = '0' and ce2 = '1' and oe_n = '0' and we_n = '1'; 

end architecture simulation;
