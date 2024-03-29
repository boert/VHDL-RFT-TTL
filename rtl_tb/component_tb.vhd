library ieee;
use ieee.std_logic_1164.all;

library work;
use work.component_package.all;


entity component_tb is
end entity component_tb;


architecture testbench of component_tb is

    signal tb_a         : std_ulogic    := '0';
    signal tb_b         : std_ulogic    := '0';
    --
    signal tb_q_dl000d  : std_ulogic;

begin

    dl000d_i0: DL000D
    port map 
    (
        a => tb_a,          --: in  std_ulogic;
        b => tb_b,          --: in  std_ulogic;
        q => tb_q_dl000d    --: out std_ulogic
    );


    check:
    process
    begin
        tb_b <= '0'; tb_a <= '0'; wait for 100 ns;
        tb_b <= '0'; tb_a <= '1'; wait for 100 ns;
        tb_b <= '1'; tb_a <= '0'; wait for 100 ns;
        tb_b <= '1'; tb_a <= '1'; wait for 100 ns;

        wait; -- forever
    end process;

end architecture testbench;
