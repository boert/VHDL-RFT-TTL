-- U 880 D        8-bit-Mikroprozessor
library ieee;
use ieee.std_logic_1164.all;

library t80;


entity U880D is
port 
(
    d       : inout std_logic_vector(7 downto 0);
    a       : out   std_logic_vector(15 downto 0);
    wait_n  : in    std_logic;
    int_n   : in    std_logic;
    nmi_n   : in    std_logic;
    reset_n : in    std_logic;
    busrq_n : in    std_logic;
    clk     : in    std_logic;
    m1_n    : out   std_logic;
    mreq_n  : out   std_logic;
    iorq_n  : out   std_logic;
    rd_n    : out   std_logic;
    wr_n    : out   std_logic;
    rfsh_n  : out   std_logic;
    halt_n  : out   std_logic;
    busak_n : out   std_logic
);
end entity U880D;

architecture rtl of U880D is

begin

    t80a_i0: entity t80.T80a
        generic map (
            Mode    => 0        -- : integer := 0 -- 0 => Z80, 1 => Fast Z80, 2 => 8080, 3 => GB
        )                       
        port map (              
            RESET_n => reset_n, -- : in std_logic;
            CLK_n   => clk,     -- : in std_logic;
            WAIT_n  => to_x01(wait_n),  -- : in std_logic;
            INT_n   => to_x01(int_n),   -- : in std_logic;
            NMI_n   => to_x01(nmi_n),   -- : in std_logic;
            BUSRQ_n => to_x01(busrq_n), -- : in std_logic;
            M1_n    => m1_n,    -- : out std_logic;
            MREQ_n  => mreq_n,  -- : out std_logic;
            IORQ_n  => iorq_n,  -- : out std_logic;
            RD_n    => rd_n,    -- : out std_logic;
            WR_n    => wr_n,    -- : out std_logic;
            RFSH_n  => rfsh_n,  -- : out std_logic;
            HALT_n  => halt_n,  -- : out std_logic;
            BUSAK_n => busak_n, -- : out std_logic;
            A       => a,       -- : out std_logic_vector(15 downto 0);
            D       => d        -- : inout std_logic_vector(7 downto 0)
        );

end architecture rtl;
