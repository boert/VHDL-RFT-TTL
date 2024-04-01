    
-- U 62256 D     32768 x 8 kbit statisches RAM 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity U62256D is
port
(
    a      : in    std_logic_vector( 14 downto 0);
    ce_n   : in    std_logic;
    oe_n   : in    std_logic;
    we_n   : in    std_logic;
    dq     : inout std_logic_vector( 7 downto 0)
);
end entity U62256D;


architecture simulation of U62256D is

    type memory_array_t is array(0 to 32767) of std_logic_vector( 7 downto 0);

    signal memory_array: memory_array_t := ( others => ( others => '0'));
    signal address : integer range 0 to 32767;
    signal do      : std_logic_vector( 7 downto 0);
    
begin

    address <= to_integer( unsigned( to_x01( a)));
    
    process( ce_n, oe_n, we_n, dq, address)
    begin
        do <= ( others => 'Z');
        if ce_n = '0' then
            if we_n = '0' then
                memory_array( address) <= dq;
            end if;
            do <= memory_array( address);
        end if;
    end process;

    dq <= do when ce_n = '0' and oe_n = '0' and we_n = '1'; 

end architecture simulation;
