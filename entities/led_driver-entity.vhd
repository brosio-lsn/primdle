-- LED driving module.
library ieee;
use ieee.std_logic_1164.all;
use work.game_types_pkg.all;

entity led_driver is
port(game_records : in history_t; -- Look into `game_types_pkg.vhd` for the type definition.
     trials_count : in std_logic_vector(1 to 30); -- Thermometer encoding.
     finished     : in std_logic;
     rejected     : in std_logic;
     enabled      : in std_logic;
     leds         : out std_logic_vector(0 to 107));
end entity led_driver;
