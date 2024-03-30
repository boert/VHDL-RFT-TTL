
-- DL 042 D      One-of-Ten Decoder (SN72LS42??)
-- MH7442        BCD-zu-Dezimal Dekoder

library ieee;
use ieee.std_logic_1164.all;

entity MH7442 is
generic 
(
    verbose : boolean := true
);
port 
(
    a : in  std_ulogic_vector(3 downto 0);
    q : out std_ulogic_vector(9 downto 0)
);
end entity MH7442;

architecture rtl of MH7442 is

begin

    process( a)
    begin
        q <= (others => '1');
        case a is
            when "0000" => q(0) <= '0';
            when "0001" => q(1) <= '0';
            when "0010" => q(2) <= '0';
            when "0011" => q(3) <= '0';
            when "0100" => q(4) <= '0';
            when "0101" => q(5) <= '0';
            when "0110" => q(6) <= '0';
            when "0111" => q(7) <= '0';
            when "1000" => q(8) <= '0';
            when "1001" => q(9) <= '0';
            when others =>
                if verbose then
                    report "undefined input/undefined output";
                end if;
        end case;
    end process;
    
end architecture rtl;
