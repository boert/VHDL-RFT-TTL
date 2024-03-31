-- U 202 D       1 kbit statisches RAM 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity U202D is
port
(
    a      : in    std_logic_vector(9 downto 0);
    cs_n   : in    std_logic;
    we_n   : in    std_logic;
    di     : in    std_logic;
    --
    do     : out   std_logic
);
end entity U202D;


architecture rtl of U202D is

    type memory_array_t is array(0 to 1023) of std_logic;

    signal memory_array: memory_array_t := (others => '0');
    signal address : integer range 0 to 1023;

begin

    address <= to_integer( unsigned( to_x01( a)));
    
    process( cs_n, we_n, di, address)
    begin
        do <= 'Z';
        if cs_n = '0' then
            if we_n = '0' then
                memory_array( address) <= di;
            end if;
            do <= memory_array( address);
        end if;
    end process;

end architecture rtl;
