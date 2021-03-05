-------------------------------------------------------------------------------------------------------------------------------------------------
--  AUTHOR: MOHAMED EL BARBARY                                                                                                                 --   
--  FILE NAME: upCount16Bit_tb.vhd                                                                                                             --
--  DATE: 2/3/2021 D/M/Y                                                                                                                       --                    
--  DESCRIPTION: THIS IS THE TESTBENCH FILE FOR THE 16 BIT UP COUNTER                                                                          --
--  SIMULATOR: MODELSIM (ALTERA)                                                                                                               --                                                                                                                              
-------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity upCount16Bit_tb is
end upCount16Bit_tb;

architecture behavior of upCount16Bit_tb is

component upCount16Bit is                          --INCLUDING upCount16Bit AS A COMPONENT IN OUR TESTBENCH
    port
    (
        CLK: in std_logic;                         --CLOCK SIGNAL
        CLR: in std_logic;                         --CLEAR SIGNAL
        OV: out std_logic;                         --OVERFLOW SIGNAL
        COUNT: out std_logic_vector(15 downto 0)   --CURRENT COUNT VALUE OF THE COUNTER
    );
end component;

constant PERIOD : time  := 100 ps;                 --VALUE OF CLK PERIOD IS 100 ps
signal CLK      : std_logic := '0';                --INITIALIZING ALL OF OUR COMPONENT IN/OUT AS SIGNALS WITH DEFAULT VALUES
signal CLR      : std_logic := '0';                    
signal OV       : std_logic := '0';                    
signal COUNT    : std_logic_vector(15 downto 0) := (others => '0');

begin                                              --BEGIN THE TESTBENCH
    COUNTER_1 : upCount16Bit port map              --CREATING A NEW COMPONENT NAMED COUNTER_1 OF TYPE upCount16Bit AND PORT MAPPING THE SIGNALS TO IT
    (
        CLK,
        CLR,
        OV,
        COUNT
    );
    CLK <= not CLK after PERIOD/2;
    CLR <= '1', '0' after 65 ps;
end behavior;