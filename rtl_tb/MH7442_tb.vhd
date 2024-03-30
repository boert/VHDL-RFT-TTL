library ieee;
use ieee.std_logic_1164.all;

library work;
use work.component_package.all;


entity MH7442_tb is
end entity MH7442_tb;


architecture testbench of MH7442_tb is

    signal tb_a         : std_ulogic_vector( 3 downto 0) := ( others => '0');
    --
    signal tb_q_MH7442  : std_ulogic_vector( 9 downto 0);

begin

    dut: MH7442
    port map 
    (
        a => tb_a,          --: in  std_ulogic;
        q => tb_q_MH7442    --: out std_ulogic
    );


    check:
    process
    begin
        tb_a <= "0000"; wait for 100 ns;
        tb_a <= "0001"; wait for 100 ns;
        tb_a <= "0010"; wait for 100 ns;
        tb_a <= "0011"; wait for 100 ns;
        tb_a <= "0100"; wait for 100 ns;
        tb_a <= "0101"; wait for 100 ns;
        tb_a <= "0110"; wait for 100 ns;
        tb_a <= "0111"; wait for 100 ns;
        tb_a <= "1000"; wait for 100 ns;
        tb_a <= "1001"; wait for 100 ns;
        tb_a <= "1010"; wait for 100 ns;
        tb_a <= "1011"; wait for 100 ns;
        tb_a <= "1100"; wait for 100 ns;
        tb_a <= "1101"; wait for 100 ns;
        tb_a <= "1110"; wait for 100 ns;
        tb_a <= "1111"; wait for 100 ns;

        wait; -- forever
    end process;

end architecture testbench;
