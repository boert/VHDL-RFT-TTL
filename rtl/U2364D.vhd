-- U 2364 D       8x8 kBit~ROM
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity U2364D is
generic
(
    content_file : string
);
port
(
    a     : in  std_logic_vector(12 downto 0);
    d     : out std_logic_vector(7 downto 0);
    oe_n  : in  std_logic;
    ce_n  : in  std_logic;
    cs1   : in  std_logic;
    cs2   : in  std_logic
);
end entity U2364D;


architecture rtl of U2364D is

    constant mem_depth : positive := 2**a'length;
    type mem_type is array(0 to mem_depth-1) of std_logic_vector(7 downto 0);


    impure function readmemh( file_name : in string) return mem_type is

        type char_file_type is file of character;  -- one byte each 

        file mem_file  : char_file_type;
        variable mem   : mem_type;
        variable c     : character;
    begin

        if file_name'length = 0 then
            report "readmemh: no file_name given"
            severity warning;
            return mem;
        end if;

        file_open( mem_file, file_name, read_mode);
        for i in mem'range loop
            read( mem_file, c);
            mem( i) := std_logic_vector( to_unsigned( character'pos( c), 8));
        end loop;  -- i    
        file_close( mem_file); 

        return mem;
    end function readmemh;

    signal rom_mem : mem_type := readmemh( content_file);

begin

    process( a, oe_n, ce_n, cs1, cs2)
    begin

        d <= (others => 'Z');

        if to_x01(ce_n) = '0' and to_x01(cs1) = '1' and to_x01(cs2) = '1' and to_x01(oe_n) = '0' then
            d <= rom_mem( to_integer( unsigned( a)));
        end if;

    end process;
        
end architecture rtl;
