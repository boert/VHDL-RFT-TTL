-- U 857 D        Zähler/Zeitgeber für U880-Systeme 
library ieee;
use ieee.std_logic_1164.all;

-- see: http://www.vias.org/mikroelektronik/b2_03_z80-ctc.html

entity U857D is
port 
(
    clk     : in    std_logic;                     -- clock input
    reset_n : in    std_logic;
    d       : inout std_logic_vector(7 downto 0);
    cs_n    : in    std_logic;                     -- chip select, low active
    ks0     : in    std_logic;
    ks1     : in    std_logic;
    m1_n    : in    std_logic;                     -- machine cycle
    iorq_n  : in    std_logic;                     -- io request
    rd_n    : in    std_logic;                     -- read
    iei     : in    std_logic;                     -- interrupt enable input
    c_trg0  : in    std_logic;                     -- clock/ trigger channel 0
    c_trg1  : in    std_logic;                     -- clock/ trigger channel 1
    c_trg2  : in    std_logic;                     -- clock/ trigger channel 2
    c_trg3  : in    std_logic;                     -- clock/ trigger channel 3
    --
    ieo     : out   std_logic;                     -- interrupt enable output
    zc_to0  : out   std_logic;                     -- zero crossing channel 0
    zc_to1  : out   std_logic;                     -- zero crossing channel 0
    zc_to2  : out   std_logic;                     -- zero crossing channel 0
    int_n   : out   std_logic                      -- interrupt
);
end entity U857D;

architecture rtl of U857D is

begin

    d <=  (others => 'Z');

    ieo    <= '0'; 
    zc_to0 <= '0'; 
    zc_to1 <= '0'; 
    zc_to2 <= '0'; 
    int_n  <= '1'; 

end architecture rtl;
