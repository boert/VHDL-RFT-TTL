-- U 855 D        Parallele Ein-/Ausgabeeinheit für U880-Systeme
library ieee;
use ieee.std_logic_1164.all;

-- mode 0: byte output
-- mode 1: byte input
-- mode 2: byte in/out (only port a)
-- mode 3: bit  in/out
--
-- see: http://www.vias.org/mikroelektronik/b2_03_z80-pio_programming.html

entity u855 is
port 
(
    d      : inout std_logic_vector(7 downto 0);
    cs_n   : in    std_logic;                     -- chip select, low active
    cd_sel : in    std_logic;                     -- 1 = command, 0 = data
    ba_sel : in    std_logic;                     -- 1 = port b, 0 = port a
    a      : inout std_logic_vector(7 downto 0);
    astb_n : in    std_logic;                     -- port a strobe, low active
    bstb_n : in    std_logic;                     -- port b strobe, low active
    ardy   : out   std_logic;                     -- port a ready
    brdy   : out   std_logic;                     -- port b ready
    ieo    : out   std_logic;                     -- interrupt enable output
    int_n  : out   std_logic;                     -- interrupt
    iei    : in    std_logic;                     -- interrupt enable input
    clk    : in    std_logic;                     -- clock input
    b      : inout std_logic_vector(7 downto 0);
    rd_n   : in    std_logic;                     -- read
    iorq_n : in    std_logic;                     -- io request
    m1_n   : in    std_logic                      -- machine cycle
);
end entity u855;

architecture rtl of u855 is


    constant set_mode      : std_logic_vector(3 downto 0) := "1111";
    constant set_interrupt : std_logic_vector(3 downto 0) := "0011";
    constant set_imode     : std_logic_vector(3 downto 0) := "0111";

    type mode_t is (M_OUTPUT, M_INPUT, M_BIDIR, M_CONTROL);

    type reg_t is record
        a      : std_logic_vector(7 downto 0);
        b      : std_logic_vector(7 downto 0);
        d      : std_logic_vector(7 downto 0);
        ardy   : std_logic;                     -- port a ready
        brdy   : std_logic;                     -- port b ready
        ieo    : std_logic;                     -- interrupt enable output
        int_n  : std_logic;                     -- interrupt, oc
        a_ie   : std_logic;                     -- interrupt A enable
        b_ie   : std_logic;                     -- interrupt B enable
        a_cmd  : std_logic_vector(7 downto 0);  
        b_cmd  : std_logic_vector(7 downto 0);
        a_ireg : std_logic_vector(7 downto 0);  -- interrupt A vector
        b_ireg : std_logic_vector(7 downto 0);  -- interrupt B vector
        a_mode : mode_t;                        -- A mode
        b_mode : mode_t;                        -- B mode
        a_mskf : std_logic;                     -- A mask follow
        b_mskf : std_logic;                     -- B mask follow
        a_mask : std_logic_vector(7 downto 0);  -- mask A register, 1 = input
        b_mask : std_logic_vector(7 downto 0);  -- mask B register  0 = output
    end record reg_t;
    constant default_reg_c : reg_t := (
        a      => (others => 'Z'),
        b      => (others => 'Z'),
        d      => (others => 'Z'),
        ardy   => '0',
        brdy   => '0',
        ieo    => 'Z',
        int_n  => 'Z',
        a_ie   => '0',
        b_ie   => '0',
        a_cmd  => (others => 'Z'),
        b_cmd  => (others => 'Z'),
        a_ireg => (others => 'Z'),
        b_ireg => (others => 'Z'),
        a_mode => M_INPUT,
        b_mode => M_INPUT,
        a_mskf => '0',
        b_mskf => '0',
        a_mask => (others => '1'),
        b_mask => (others => '1')
    );

    signal r, rin: reg_t := default_reg_c;

begin
    
    comb: process(d, cs_n, cd_sel, ba_sel, a, astb_n, bstb_n, iei, b, rd_n, iorq_n, m1_n)
        variable v: reg_t;
    begin
        -- drive outputs
        a     <= (others => 'Z');
        b     <= (others => 'Z');

        b     <= r.b;
        d     <= r.d;
        ardy  <= r.ardy;
        brdy  <= r.brdy;
        ieo   <= r.ieo;
        int_n <= r.int_n;

        v     := r;

        case v.a_mode is
            when M_OUTPUT =>
                a     <= v.a;
                ardy  <= '1';

            when M_INPUT  =>
                v.a   := a;

            when M_BIDIR =>
                -- port a handshake lines for output control
                -- port b bandshake lines for input control

            when M_CONTROL =>
                ardy  <= '0';
                for index in 7 downto 0 loop
                    if v.a_mask( index) = '1' then
                        v.a( index) := a( index);
                    else
                        a( index) <= v.a( index);
                    end if;
                end loop;

        end case;

        -- chip select
        if cs_n = '0' then

            if rd_n = '0' then
                -- read
                if cd_sel = '0' then
                    -- data
                    if ba_sel = '0' then
                        if v.a_mode = M_INPUT then
                            v.d := v.a;
                        end if;
                    else
                        if v.b_mode = M_INPUT then
                            v.d := v.b;
                        end if;
                    end if;
                else
                    -- command
                    if ba_sel = '0' then
                        v.d := v.a_cmd;
                    else
                        v.d := v.b_cmd;
                    end if;
                end if;

            else -- rd_n

                -- io request
                if iorq_n = '0' then
                    -- data
                    if cd_sel = '0' then
                        if ba_sel = '0' then
                            if v.a_mode = M_OUTPUT then
                                v.a := v.d;
                            end if;
                        else
                            if v.b_mode = M_OUTPUT then
                                v.b := v.d;
                            end if;
                        end if;

                    else
                        -- command
                        if ba_sel = '0' then

                            v.d := d;
                            
                            if v.a_mskf = '0' then
                                
                                -- ireg vector
                                if v.d(0) = '0' then
                                    v.a_ireg := v.d;
                                else
                                    -- operating mode
                                    if v.d(3 downto 0) = set_mode then
                                        case v.d(7 downto 6) is
                                            when "00"   => 
                                                v.a_mode := M_OUTPUT;
                                            when "01"   => 
                                                v.a_mode := M_INPUT;
                                            when "10"   => 
                                                v.a_mode := M_BIDIR;
                                            when "11"   => 
                                                v.a_mode := M_CONTROL;
                                                v.a_mskf := '1';
                                            when others => null;
                                        end case;
                                    end if; -- v.d(3 downto 0)
                                    
                                    if v.d(3 downto 0) = set_interrupt then
                                        v.a_ie := v.d(7);
                                    end if;
                                    
                                end if; -- v.d(0)
                            else
                                v.a_mask := v.d;
                                v.a_mskf := '0';
                            end if; -- a_msk_f
                        else              
                            -- ireg
                            if v.d(0) = '0' then
                                v.b_ireg := v.d;
                            end if;
                        end if;
                    end if;
                end if; -- iorq_n
            end if; -- rd_n
    
        end if; -- cs_n

        -- read inputs
        if (v.a_mode = M_INPUT) and (astb_n = '0') then
            v.a := a;
        end if;

        if (v.b_mode = M_INPUT) and (bstb_n = '0') then
            v.b := b;
        end if;

        assert v.a_mode /= M_BIDIR
        report "PIO port A: MODE2 not supported";

        assert v.a_mode /= M_CONTROL
        report "PIO port A: MODE3 not supported";

        assert v.b_mode /= M_CONTROL
        report "PIO port B: MODE3 not supported";


        -- reset (M1 without read or io request)
        if m1_n = '0' and rd_n = '1' and iorq_n = '1' then
            -- todo: set mask to inhibit
            v.d      := (others => 'Z');
            v.ardy   := '0';
            v.brdy   := '0';
            v.a_mode := M_INPUT;
            v.b_mode := M_INPUT;
            v.a_ie   := '0';
            v.b_ie   := '0';
            v.a      := (others => 'Z');
            v.b      := (others => 'Z');
        end if;

        rin   <= v;
    end process;


    seq: process
    begin
        wait until rising_edge( clk);
        r <= rin;
    end process;


end architecture rtl;
