
-- V 40511 D     Siebensegment-Dekoder mit Hexadezimalausgabe und Eingangslatch

library ieee;
use ieee.std_logic_1164.all;

entity V40511D is
port 
(
    a    : in  std_ulogic_vector( 3 downto 0);
    lt_n : in  std_ulogic;                       -- Lampentest
    le   : in  std_ulogic;                       -- latch enable
    bl_n : in  std_ulogic;                       -- blank
    --
    q    : out std_ulogic_vector( 6 downto 0)
);
end entity V40511D;


architecture rtl of V40511D is
    
    signal a_reg : std_ulogic_vector( 3 downto 0);

begin

    process
    begin
        wait until rising_edge( le);
        a_reg <= a;
    end process;


    process( a_reg, bl_n, lt_n)
    begin
        case a_reg is
            when "0000" => q <= "0111111"; --  0
            when "0001" => q <= "0000110"; --  1
            when "0010" => q <= "1011011"; --  2
            when "0011" => q <= "1001111"; --  3
            when "0100" => q <= "1100110"; --  4
            when "0101" => q <= "1101101"; --  5
            when "0110" => q <= "1111101"; --  6
            when "0111" => q <= "0000111"; --  7
            when "1000" => q <= "1111111"; --  8
            when "1001" => q <= "1101111"; --  9
            when "1010" => q <= "1110111"; --  A
            when "1011" => q <= "1111100"; --  b
            when "1100" => q <= "0111001"; --  C
            when "1101" => q <= "1011110"; --  d
            when "1110" => q <= "1111001"; --  E
            when "1111" => q <= "1110001"; --  F
            when others => q <= "UUUUUUU";
        end case;
        if bl_n = '0' then
            q   <= ( others => '0');
        end if;
        if lt_n = '0' then
            q   <= ( others => '1');
        end if;
    end process;

end architecture rtl;

