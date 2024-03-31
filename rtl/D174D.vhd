
-- D 174 D      2 D-Flip-Flop

library ieee;
use ieee.std_logic_1164.all;

entity D174D is
port 
(
    s_n : in  std_ulogic;
    clk : in  std_ulogic;
    d   : in  std_ulogic;
    r_n : in  std_ulogic;
    --
    q   : out std_ulogic;
    q_n : out std_ulogic
);
end entity D174D;

architecture rtl of D174D is

    signal ff : std_ulogic := 'L';

begin

    process( s_n, clk, r_n)
    begin
        if rising_edge( clk) then
            ff  <= d;
        end if;
        if s_n = '0' then
            ff  <= '1';
        end if;
        if r_n = '0' then
            ff  <= '0';
        end if;
    end process;
    
    q   <= ff;
    q_n <= not ff;

end architecture rtl;
