
-- V 4028 D      BCD-zu-1-aus-10-Dekoder 

library ieee;
use ieee.std_logic_1164.all;

entity V4028D is
port 
(
    a   : in  std_ulogic_vector( 3 downto 0);
    q   : out std_ulogic_vector( 9 downto 0);
);
end entity V4028D;


architecture rtl of V4028D is

begin

    process( a)
    begin
        case a is
            when "0000" => q <= "000000001";
            when "0001" => q <= "000000010";
            when "0010" => q <= "000000100";
            when "0011" => q <= "000001000";
            when "0100" => q <= "000010000";
            when "0101" => q <= "000100000";
            when "0110" => q <= "001000000";
            when "0111" => q <= "010000000";
            when "1000" => q <= "100000000";
            when "1001" => q <= "000000000";
            when "1010" => q <= "000000000";
            when "1011" => q <= "000000000";
            when "1100" => q <= "000000000";
            when "1101" => q <= "000000000";
            when "1110" => q <= "000000000";
            when "1111" => q <= "000000000";
        end case;
    end process;

end architecture rtl;

