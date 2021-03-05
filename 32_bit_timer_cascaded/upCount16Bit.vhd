-------------------------------------------------------------------------------------------------------------------------------------------------
--  AUTHOR: MOHAMED EL BARBARY                                                                                                                 --
--  FILE NAME: upCount16Bit.vhd                                                                                                                --                           
--  DATE: 2/3/2021 D/M/Y                                                                                                                       --                    
--  Description: THIS IS A 16BIT UP COUNTER DESIGNED TO BE CASCADED WITH ANOTHER 16BIT UP COUNTER IN ORDER TO MAKE A 32BIT TIMER.              --                                                                                                                              
-------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity upCount16Bit is
    port
    (
        CLK: in std_logic;                         --CLOCK SIGNAL
        CLR: in std_logic;                         --CLEAR SIGNAL
        OV: out std_logic;                         --OVERFLOW SIGNAL
        COUNT: out std_logic_vector(15 downto 0)   --CURRENT COUNT VALUE OF THE COUNTER
    );
end upCount16Bit;

architecture rtl of upCount16Bit is

signal COUNT_temp : unsigned(15 downto 0);         --TEMP SIGNAL TO HOLD THE UNSIGNED COUNT VALUE
signal OV_temp: std_logic := '0';                  --TEMP SIGNAL FOR THE OVERFLOW

begin
    process(CLK, CLR)                              --ENTER THIS PROCESS WITH THE CHANGE OF CLR AND CLK
    begin
    if (CLR = '1') then                            --IF CLR == 1 THEN CLEAR THE COUNT AND START FROM 0
        COUNT_temp <= (others => '0');
    elsif (rising_edge(CLK)) then                  --IF YOU HIT THE RISING EDGE OF SIGNAL "CLK" AND "CLR" IS 0 THEN
        COUNT_temp <= COUNT_temp + 1;              --INCREMENT COUNT_temp
        if (COUNT_temp = 65535) then               --IF YOU REACH THE TOP SET OV SIGNAL TO '1'
            OV_temp <= '1';
        else
            OV_temp <= '0';
        end if;
    end if;
    end process;
    OV <= OV_temp;
    COUNT <= std_logic_vector(COUNT_temp);         --ONCE THE PROCESS IS DONE, CONVERT COUNT_temp to std_logic_vector AND ASSIGN IT TO COUNT 
end rtl;