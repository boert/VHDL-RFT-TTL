
library ieee;
use ieee.std_logic_1164.all;


package component_package is


    -- DL 000 D      4 NAND mit je 2 Eingängen                           SN74LS00
    component DL000D is
    port 
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL000D;


    -- DL 002 D      4 NOR mit je 2 Eingängen                            SN74LS02
    component DL002D is
    port 
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL002D;


    -- DL 003 D      4 NAND mit je 2 Eingängen, Kollektor offen          SN74LS03
    component DL003D is
    port 
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL003D;


    -- DL 004 D      6 Inverter                                          SN74LS04 
    component DL004D is
    port 
    (
        a : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL004D;


    -- DL 008 D      4 AND mit je 2 Eingängen                            SN74LS08
    component DL008D is
    port 
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL008D;


    -- DL 010 D      3 NAND mit je 3 Eingängen                           SN74LS10
    component DL010D is
    port
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        c : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL010D;


    -- DL 011 D      3 AND mit je 3 Eingängen                            SN74LS11
    component DL011D is
    port 
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        c : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL011D;


    -- DL 020 D      2 NAND mit je 4 Eingängen                           SN74LS20
    component DL020D is
    port 
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        c : in  std_ulogic;
        d : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL020D;


    -- DL 038 D      4 NAND Treiber mit je 2 Eingängen, Kollektor offen  SN74LS38
    component DL038D is
    port 
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL038D;


    -- MH7442        BCD-zu-Dezimal Dekoder
    component MH7442 is
    generic 
    (
        verbose : boolean := true
    );
    port 
    (
        a : in  std_ulogic_vector(3 downto 0);
        q : out std_ulogic_vector(9 downto 0)
    );
    end component MH7442;


    -- DL 051 D      2 AND-NOR mit je 2 x 3 und 2 x 2 Eingängen          SN74LS51N 
    component DL051D is
    port 
    (
        a1 : in  std_ulogic;
        b1 : in  std_ulogic;
        c1 : in  std_ulogic;
        d1 : in  std_ulogic;
        e1 : in  std_ulogic;
        f1 : in  std_ulogic;
        --
        a2 : in  std_ulogic;
        b2 : in  std_ulogic;
        d2 : in  std_ulogic;
        e2 : in  std_ulogic;
        --
        q1 : out std_ulogic;
        q2 : out std_ulogic
    );
    end component DL051D;


    -- DL 074 D      2 positiv flanken-getriggerte D-Flip-Flop           SN74LS74N 
    component DL074D is
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
    end component DL074D;


    -- DL 083 D      4-Bit Volladdierer
    component DL083D is
    port 
    (
        a  : in  std_ulogic_vector(3 downto 0);
        b  : in  std_ulogic_vector(3 downto 0);
        ci : in  std_ulogic;
        --
        q  : out std_ulogic_vector(3 downto 0);
        co : out std_ulogic
    );
    end component DL083D;


    -- DL 086 D      4 Exklusiv-OR-Gatter mit je 2 Eingängen  SN74LS86
    component DL086D is
    port 
    (
        a : in  std_ulogic;
        b : in  std_ulogic;
        --
        q : out std_ulogic
    );
    end component DL086D;


    -- DL 090 D      Dezimalzähler                                       SN74LS90
    component DL090D is
    port 
    (
        cka   : in  std_ulogic;
        ckb   : in  std_ulogic;
        r01   : in  std_ulogic;
        r02   : in  std_ulogic;
        r91   : in  std_ulogic;
        r92   : in  std_ulogic;
        --
        q     : out std_ulogic_vector(3 downto 0)
    );
    end component DL090D;


    -- DL 093 D      4-Bit Binärzähler                                   SN74LS93
    component DL093D is
    port 
    (
        cka : in  std_ulogic;
        ckb : in  std_ulogic;
        r01 : in  std_ulogic;
        r02 : in  std_ulogic;
        --
        q   : out std_ulogic_vector(3 downto 0)
    );
    end component DL093D;


    -- DL 123        2 monostabile Multivibratoren                       SN74LS123
    component DL123D is
    port 
    (
        d : in  std_ulogic;
        q : out std_ulogic
    );
    end component DL123D;


    -- DL 193 D      4-Bit synchroner Vor-/Rückwärtszähler               SN74LS193
    component DL193D is
    port 
    (
        d   : in  std_ulogic_vector(3 downto 0);
        zv  : in  std_ulogic;
        zr  : in  std_ulogic;
        s_n : in  std_ulogic;
        r   : in  std_ulogic;
        -- 
        q   : out std_logic_vector(3 downto 0);
        cv  : out std_ulogic;
        cr  : out std_ulogic
    );
    end component DL193D;


    -- DL 251 D      8-auf-1 Multiplexer mit Tristate-Ausgängen          SN74LS251N
    component DL251D is
    port 
    (
        d    : in  std_ulogic_vector(7 downto 0);
        --
        s    : in  std_ulogic_vector(2 downto 0);
        oe_n : in  std_ulogic;                      -- strobe
        --
        y    : out std_ulogic;
        y_n  : out std_ulogic
    );
    end component DL251D;


    -- DL 253 D      zweifach 4-auf-1 Multiplexer mit Tristate-Ausgängen   SN74LS253N
    component DL253D is
    port 
    (
        d1       : in  std_ulogic_vector(3 downto 0);
        d2       : in  std_ulogic_vector(3 downto 0);
        --       
        s        : in  std_ulogic_vector(1 downto 0);
        oe1_n    : in  std_ulogic;
        oe2_n    : in  std_ulogic;
        --       
        y1       : out std_ulogic;
        y2       : out std_ulogic
    );
    end component DL253D;


    -- DL 299 D      8 Bit Universalschieberegister
    component DL299D is
    port 
    (
        s0      : in    std_ulogic;
        s1      : in    std_ulogic;
        --
        sl      : in    std_ulogic;
        sr      : in    std_ulogic;
        --
        clk     : in    std_ulogic;
        clr_n   : in    std_ulogic;
        oe1_n   : in    std_ulogic;
        oe2_n   : in    std_ulogic;
        --
        d       : inout std_ulogic_vector(7 downto 0);
        --
        oa      : out   std_ulogic;
        oh      : out   std_ulogic
    );
    end component DL299D;


    -- DL 374 D      8-D-Flip-Flop
    component DL374D is
    port 
    (
        di   : in  std_ulogic_vector(7 downto 0);
        clk  : in  std_ulogic;
        oe_n : in  std_ulogic;
        --
        do   : out std_ulogic_vector(7 downto 0)
    );
    end component DL374D;


    -- D 172 D       J-K-Master-Slave-Flip-Flop                          SN7472N
    component D172D is
    port 
    (
        clk : in  std_ulogic;
        s   : in  std_ulogic;
        r   : in  std_ulogic;
        j   : in  std_ulogic_vector(2 downto 0);
        k   : in  std_ulogic_vector(2 downto 0);
        q   : out std_ulogic;
        q_n : out std_ulogic
    );
    end component D172D;


    -- DS 8212 D      8 Bit Bustreiber mit Speicher und Tristate-Ausgängen
    component DS8212D is
    port 
    (
        a      : in  std_logic_vector(7 downto 0);
        s1_n   : in  std_ulogic;
        s2     : in  std_ulogic;
        md     : in  std_ulogic;
        stb    : in  std_ulogic;
        clr_n  : in  std_ulogic;
        --     
        y      : out std_logic_vector(7 downto 0);
        int_n  : out std_ulogic
    );
    end component DS8212D;


    component u256 is
        generic (
            seed1  : positive := 1;
            seed2  : positive := 2
        );
        port (
            a      : in    std_logic_vector(6 downto 0);
            ras_n  : in    std_logic;
            cas_n  : in    std_logic;
            wr_n   : in    std_logic;
            di     : in    std_logic;
            --
            do     : out   std_logic
        );
    end component u256;


    component U2164D is
    generic (
        seed1  : positive := 3;
        seed2  : positive := 4
    );
    port (
        a      : in    std_logic_vector(7 downto 0);
        ras_n  : in    std_logic;
        cas_n  : in    std_logic;
        wr_n   : in    std_logic;
        di     : in    std_logic;
        --
        do     : out   std_logic
    );
    end component U2164D;


    component u880 is
        port (
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
    end component u880;


    component u2364d is
        generic (
            content_file : string
        );
        port (
            a     : in  std_logic_vector(12 downto 0);
            d     : out std_logic_vector(7 downto 0);
            oe_n  : in  std_logic;
            ce_n  : in  std_logic;
            cs1   : in  std_logic;
            cs2   : in  std_logic
        );
    end component u2364d;


    component u855 is
        port (
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
    end component u855;


    component UA855D is
       Port (
          -- Clock
          CLK : in STD_LOGIC;
          
          -- CPU Data Bus
          D : inout STD_LOGIC_VECTOR (7 downto 0);
          
          -- PIO Control
          BA_SEL : in STD_LOGIC;
          CD_SEL : in STD_LOGIC;
          CS_n : in STD_LOGIC;
          M1_n : in STD_LOGIC;
          IORQ_n : in STD_LOGIC;
          RD_n : in STD_LOGIC;
          
          -- Interrupt Control
          IEI : in STD_LOGIC;
          IEO : out STD_LOGIC;
          INT_n : out STD_LOGIC;
          
          -- Port A I/O
          A : inout STD_LOGIC_VECTOR (7 downto 0);
          ARDY : out STD_LOGIC;
          ASTB_n : in STD_LOGIC;
          
          -- Port B I/O
          B : inout STD_LOGIC_VECTOR (7 downto 0);
          BRDY : out STD_LOGIC;
          BSTB_n : in STD_LOGIC
        );
    end component UA855D;

    component u857 is
        port (
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
    end component u857;


    component v4520 is
        port (
            c1 : in  std_ulogic;
            c2 : in  std_ulogic;
            r  : in  std_ulogic;
            o  : out std_ulogic_vector(3 downto 0)
        );
    end component v4520;


end package component_package;
