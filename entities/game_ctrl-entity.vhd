-- Game control module.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.game_types_pkg.all;

entity game_ctrl is
port(clk          : in std_logic;
     reset        : in std_logic;
     guess        : in std_logic_vector(7 downto 0);
     golden       : in std_logic_vector(7 downto 0);
     ready        : in std_logic;
     is_prime     : in std_logic;
     game_records : out history_t; -- Look into `game_types_pkg.vhd` for the type definition.
     trials_count : out std_logic_vector(1 to 30); -- Thermometer encoding.
     finished     : out std_logic;
     rejected     : out std_logic;
     LED_en       : out std_logic);
end entity game_ctrl;
