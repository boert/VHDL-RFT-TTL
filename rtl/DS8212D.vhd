
-- DS 8212 D      8 Bit Bustreiber mit Speicher und Tristate-Ausgängen

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DS8212D is
port 
(
    a     : in  std_logic_vector(7 downto 0);
    s1_n  : in  std_ulogic;
    s2    : in  std_ulogic;
    md    : in  std_ulogic;
    stb   : in  std_ulogic;
    clr_n : in  std_ulogic;
    --
    y     : out std_logic_vector(7 downto 0);
    int_n : out std_ulogic
);
end entity DS8212D;


architecture rtl of DS8212D is

    signal q_int : std_ulogic;
    signal oe    : std_ulogic;
    signal s     : std_ulogic;
    signal clr   : std_ulogic;
    signal clk   : std_ulogic;
    signal reg_s : std_ulogic;
    signal y_int : std_logic_vector(7 downto 0);
    
begin

    clr   <= not clr_n;
    s     <= (not s1_n) and s2;
    clk   <= (md and s) or (stb and (not md));
    reg_s <= stb nor clr;
    oe    <= s or md;

    -- int FF
    process( reg_s, stb)
    begin
        if rising_edge( stb) then
            q_int <= '0';
        end if;
        if reg_s = '0' then
            q_int <= '1';
        end if;
    end process;

    int_n <= q_int;

    -- bus FF
    process( clk, clr)
    begin
        if rising_edge( clk) then
            y_int <= a;
        end if;
        if clr = '1' then
            y_int <= (others => '0');
        end if;
    end process;

    -- output driver
    y <= y_int when oe = '1' else (others => 'Z');

end architecture rtl;
