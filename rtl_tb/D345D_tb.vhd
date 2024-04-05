library ieee;
use ieee.std_logic_1164.all;

library work;
use work.component_package.all;


entity D345D_tb is
end entity D345D_tb;


architecture testbench of D345D_tb is

    signal tb_a         : std_ulogic_vector( 3 downto 0) := ( others => '0');
    signal tb_rbi       : std_logic;
    signal tb_bi        : std_logic;
    --
    signal tb_q_D345D   : std_ulogic_vector( 6 downto 0);


    procedure test_sequence( signal data : out std_ulogic_vector( 3 downto 0)) is
    begin
        data <= "0000"; wait for 100 ns;
        data <= "0001"; wait for 100 ns;
        data <= "0010"; wait for 100 ns;
        data <= "0011"; wait for 100 ns;
        data <= "0100"; wait for 100 ns;
        data <= "0101"; wait for 100 ns;
        data <= "0110"; wait for 100 ns;
        data <= "0111"; wait for 100 ns;
        data <= "1000"; wait for 100 ns;
        data <= "1001"; wait for 100 ns;
        data <= "1010"; wait for 100 ns;
        data <= "1011"; wait for 100 ns;
        data <= "1100"; wait for 100 ns;
        data <= "1101"; wait for 100 ns;
        data <= "1110"; wait for 100 ns;
        data <= "1111"; wait for 100 ns;
    end procedure test_sequence;


begin

    dut: D345D
    port map 
    (
        a   => tb_a,        --: in  std_ulogic;
        bi  => tb_bi,
        rbi => tb_rbi,
        q   => tb_q_D345D   --: out std_ulogic
    );


    check:
    process
    begin
        tb_bi   <= '0'; tb_rbi  <= '0'; test_sequence( tb_a);
        tb_bi   <= '0'; tb_rbi  <= '1'; test_sequence( tb_a);
        tb_bi   <= '1'; tb_rbi  <= '0'; test_sequence( tb_a);
        tb_bi   <= '1'; tb_rbi  <= '1'; test_sequence( tb_a);

        wait; -- forever
    end process;

end architecture testbench;
