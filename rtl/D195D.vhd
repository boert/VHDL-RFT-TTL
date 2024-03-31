
-- D 195 D       4 bit-links-Rechts-Schieberegister

library ieee;
use ieee.std_logic_1164.all;

entity D195D is
port 
(
    data : in  std_ulogic_vector( 3 downto 0);
    t1   : in  std_ulogic;                      -- Takt, rechts schieben
    t2   : in  std_ulogic;                      -- Takt, links schieben
    mc   : in  std_ulogic;                      -- Steuereingang
    es   : in  std_ulogic;                      -- Eingang (Rechtsschiebung)
    --   
    q    : out std_ulogic_vector( 3 downto 0)
);
end entity D195D;

architecture rtl of D195D is
    
    signal clk     : std_ulogic;
    signal ff      : std_ulogic_vector( 3 downto 0);
    signal ff_next : std_ulogic_vector( 3 downto 0);

begin

    clk <= (t1 and not mc) or (t2 and mc);

    process( clk, data, mc, es)
    begin
        -- asynchroner Teil
        ff_next( 0) <= (data(0) and mc) or (es and not mc); 
        ff_next( 1) <= (data(1) and mc) or (ff(0) and not mc); 
        ff_next( 2) <= (data(2) and mc) or (ff(1) and not mc); 
        ff_next( 3) <= (data(3) and mc) or (ff(2) and not mc); 
        -- synchroner Teil
        if falling_edge( clk) then
            ff <= ff_next;
        end if;
    end process;

    q <= ff;
    
end architecture rtl;
