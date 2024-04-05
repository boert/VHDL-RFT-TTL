
-- D 345 D       Siebensegment-Dekoder mit festen Konstantstromsenken und Hexadezimalanzeige

library ieee;
use ieee.std_logic_1164.all;

entity D345D is
port 
(
    a   : in  std_ulogic_vector( 3 downto 0);
    rbi : in  std_ulogic;                       -- low = aus, wenn a = '0000' (Vornullenunterdrückung)
    bi  : in  std_ulogic;                       -- low = aus, (Blanking)
    --
    q   : out std_logic_vector( 6 downto 0)
);
end entity D345D;


architecture rtl of D345D is

begin

    process( a, rbi, bi)
    begin
        case a is
            when "0000" => q <= "1000000"; --  0
            when "0001" => q <= "1111001"; --  1
            when "0010" => q <= "0100100"; --  2
            when "0011" => q <= "0110000"; --  3
            when "0100" => q <= "0011001"; --  4
            when "0101" => q <= "0010010"; --  5
            when "0110" => q <= "0000010"; --  6
            when "0111" => q <= "1011000"; --  7
            when "1000" => q <= "0000000"; --  8
            when "1001" => q <= "0010000"; --  9
            when "1010" => q <= "0001000"; --  A
            when "1011" => q <= "0000011"; --  b
            when "1100" => q <= "1000110"; --  C
            when "1101" => q <= "0100001"; --  d
            when "1110" => q <= "0000110"; --  E
            when "1111" => q <= "0111000"; --  F
            when others => q <= "UUUUUUU";
        end case;
        if rbi = '0' and a = "0000" then
            q   <= ( others => '1');
        end if;
        if bi = '0' then
            q   <= ( others => '1');
        end if;
    end process;

end architecture rtl;

