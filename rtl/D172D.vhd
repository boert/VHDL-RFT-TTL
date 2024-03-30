
-- D 172 D       J-K-Master-Slave-Flip-Flop                          SN7472N

library ieee;
use ieee.std_logic_1164.all;

entity D172D is
port 
(
    clk : in  std_ulogic;
    s   : in  std_ulogic;
    r   : in  std_ulogic;
    j   : in  std_ulogic_vector(2 downto 0);
    k   : in  std_ulogic_vector(2 downto 0);
    --
    q   : out std_ulogic;
    q_n : out std_ulogic
);
end entity D172D;

architecture rtl of D172D is
    
    signal ff : std_ulogic;

begin
    
    process(clk, s, r)
    begin
        if rising_edge( clk) then
            if j = "111" then
                ff <= '1';
            end if;
            if k = "111" then
                ff <= '0';
            end if;
            if j = "111" and k = "111" then
                ff <= not ff;
            end if;
        end if;
        
        if s = '0' then
            ff <= '1';
        end if;

        if r = '0' then
            ff <= '0';
        end if;
    end process;

    q   <= ff;
    q_n <= not ff;

end architecture rtl;
