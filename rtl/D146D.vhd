
-- D 146 D       BCD-zu-7-Segment-Dekoder mit offenen Kollektoren

library ieee;
use ieee.std_logic_1164.all;

entity D146D is
port 
(
    a   : in  std_ulogic_vector( 3 downto 0);
    lt  : in  std_ulogic;                       -- Lampentest
    rbi : in  std_ulogic;                       -- low = 'aus'
    --
    q   : out std_logic_vector( 6 downto 0);
    rbo : in  std_ulogic
);
end entity D146D;


architecture rtl of D146D is

begin

    process( a)
    begin
        rbo <= '1';
        case a is
            when "0000" => q <= "Z000000"; --  0
            when "0001" => q <= "ZZZZ00Z"; --  1
            when "0010" => q <= "0Z00Z00"; --  2
            when "0011" => q <= "0ZZ0000"; --  3
            when "0100" => q <= "00ZZ00Z"; --  4
            when "0101" => q <= "00Z00Z0"; --  5
            when "0110" => q <= "00000Z0"; --  6
            when "0111" => q <= "ZZZZ000"; --  7
            when "1000" => q <= "0000000"; --  8
            when "1001" => q <= "00Z0000"; --  9
            when "1010" => q <= "0Z00ZZZ"; -- 10
            when "1011" => q <= "0ZZ00ZZ"; -- 11
            when "1100" => q <= "00ZZZ0Z"; -- 12
            when "1101" => q <= "00Z0ZZ0"; -- 13
            when "1110" => q <= "0000ZZZ"; -- 14
            when "1111" => q <= "ZZZZZZZ"; -- 15
        end case;
        if rbi = '1' then
            q   <= ( others => 'Z');
            rbo <= '0';
        end if;
        if lt = '0' then
            q   <= ( others => '0');
        end if;
    end process;

end architecture rtl;

