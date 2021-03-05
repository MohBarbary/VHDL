-------------------------------------------------------------------------------------------------------------------------------------------------
--  AUTHOR: MOHAMED EL BARBARY                                                                                                                 --
--  FILE NAME: timer32bit.vhd                                                                                                                  --                           
--  DATE: 2/3/2021 D/M/Y                                                                                                                       --                    
--  Description: THIS IS A 32 BIT TIMER DESIGNED USING 2 CASCADED 16 BIT UP COUNTERS                                                           --                                                                                                                              
-------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer32bit is
    port
    (
        CLK_tim: in std_logic;                         --CLOCK SIGNAL
        CLR_tim: in std_logic;                         --CLEAR SIGNAL
        OV_tim: out std_logic;                         --OVERFLOW SIGNAL
        COUNT_tim: out std_logic_vector(31 downto 0)   --CURRENT COUNT VALUE OF THE COUNTER
    );
end timer32bit;

architecture toplevel of timer32bit is

                                                       --INITIALIZING SIGNALS TO INTERFACE THE TWO COUNTERS
signal OV_L: std_logic;                                --OV_L IS NEEDED TO ENABLE THE OTHER COUNTER
signal OV_H: std_logic;                                --OV_H IS NEEDED TO USE THE CASCADED TIMERS AS COUNT TILL CLEAR COUNTERS
signal COUNT_LOW: std_logic_vector(15 downto 0);       --COUNT_LOW WILL BE CONCATENATED WITH COUNT HIGH
signal COUNT_HIGH: std_logic_vector(15 downto 0);      --COUNT_HIGH WILL BE CONCATENATED WITH COUNT LOW

begin

COUNTER_LOW : entity work.upCount16Bit(rtl) port map
(
    CLK => CLK_tim,
    CLR => CLR_tim,
    OV  => OV_L,
    COUNT => COUNT_LOW
);
COUNTER_HIGH: entity work.upCount16Bit(rtl) port map
(
    CLK => OV_L,
    CLR => CLR_tim,
    OV  => OV_H,
    COUNT => COUNT_HIGH
);
OV_tim <= OV_H;
COUNT_tim <= COUNT_HIGH & COUNT_LOW;
end toplevel;