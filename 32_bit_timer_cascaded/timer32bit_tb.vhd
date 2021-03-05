-------------------------------------------------------------------------------------------------------------------------------------------------
--  AUTHOR: MOHAMED EL BARBARY                                                                                                                 --   
--  FILE NAME: timer32bit_tb.vhd                                                                                                               --
--  DATE: 2/3/2021 D/M/Y                                                                                                                       --                    
--  DESCRIPTION: THIS IS THE TESTBENCH FILE FOR 32 BIT TIMER                                                                                   --
--  SIMULATOR: MODELSIM (ALTERA)                                                                                                               --                                                                                                                              
-------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer32bit_tb is
end entity;

architecture behavior of timer32bit_tb is

constant PERIOD : time  := 100 ps;                 --VALUE OF CLK PERIOD IS 100 ps
signal CLK_tb      : std_logic := '0';             --INITIALIZING ALL OF OUR COMPONENT IN/OUT AS SIGNALS WITH DEFAULT VALUES
signal CLR_tb      : std_logic := '0';                    
signal OV_tb       : std_logic := '0';                    
signal COUNT_tb    : std_logic_vector(31 downto 0) := (others => '0');

begin 

TIMER1 : entity work.timer32bit(toplevel) port map
(
    CLK_tim => CLK_tb,
    CLR_tim => CLR_tb,
    OV_tim  => OV_tb,
    COUNT_tim => COUNT_tb
);

CLK_tb <= not CLK_tb after PERIOD/2;
CLR_tb <= '1', '0' after 65 ps;

end behavior;