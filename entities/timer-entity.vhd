--A basic timer module.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
generic(FCLK : natural := 12000000);
--Clock frequency. Keep the default low value for simulation.
--Set to hardware clock frequency (e.g., 12 MHz) for board testing.
--You can use a 32-bit tick counter.
port(clk     : in std_logic;
     --System clock.
     clear   : in std_logic;
     --Synchronously clears the counter (restarts the timer).
     done    : out std_logic);
     --Indicates that one second has passed since the last clear.
end entity timer;
