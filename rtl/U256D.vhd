-- U 256 D        16 kBit~dRAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity U256D is
generic 
(
    seed1  : positive := 1;
    seed2  : positive := 2
);
port 
(
    a      : in    std_logic_vector(6 downto 0);
    ras_n  : in    std_logic;
    cas_n  : in    std_logic;
    wr_n   : in    std_logic;
    di     : in    std_logic;
    --
    do     : out   std_logic
);
end entity U256D;


architecture rtl of U256D is

    type memory_array_t is array(0 to 127) of std_logic_vector(127 downto 0);

    procedure get_random_bit(seed1, seed2 : inout positive; randbit : out std_logic) is
        variable rand  : real;
    begin

        uniform( seed1, seed2, rand);

        --report real'image( rand);
        if rand < 0.5 then
            randbit := '0';
        else
            randbit := '1';
        end if;
        
    end procedure;

    impure function random_memory_array( constant cseed1, cseed2 : positive) return memory_array_t is
        variable vseed1    : positive := cseed1;
        variable vseed2    : positive := cseed2;
        variable randbit   : std_logic;
        variable randarray : memory_array_t;
    begin
        for x in memory_array_t'range loop
            for y in 127 downto 0 loop
                get_random_bit( vseed1, vseed2, randbit);
                randarray( x)( y) := randbit;
            end loop;
        end loop;
        return randarray;
    end function;

    --signal memory_array: memory_array_t := (others => (others => get_random_bit));
    signal memory_array: memory_array_t := random_memory_array( seed1, seed2);
    signal row_address: unsigned(6 downto 0);

begin
    
    process
    begin
        wait until falling_edge( ras_n);
        row_address <= unsigned( a);
    end process;


    process( cas_n)
        variable col_address: unsigned(6 downto 0);
    begin
        do <= 'Z';

        if falling_edge( cas_n) then
            col_address := unsigned( a);
            
            if wr_n = '0' then
                memory_array( to_integer( to_01( row_address)))( to_integer( to_01( col_address))) <= di;
            else
                do <= memory_array( to_integer( to_01( row_address)))( to_integer( to_01( col_address)));
            end if;
        end if;
    end process;


end architecture rtl;
