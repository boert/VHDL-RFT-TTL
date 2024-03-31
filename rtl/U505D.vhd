
-- U 505 D       1k x 8 Bit maskenprogrammierbarer Festwertspeicher (ROM)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity U505D is
generic (
    content_file : string
);
port (
    a     : in  std_logic_vector(9 downto 0);
    d     : out std_logic_vector(7 downto 0);
    cs_n  : in  std_logic
);
end entity U505D;


architecture rtl of U505D is

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

    process( a, cs_n)
    begin

        d <= (others => 'Z');

        if to_x01(cs_n) = '0' then
            d <= rom_mem( to_integer( unsigned( to_x01( a))));
        end if;

    end process;
        
end architecture rtl;
