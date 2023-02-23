-- Top-level wrapper for the entire "primedle game" system.
library ieee;
use ieee.std_logic_1164.all;
use work.game_types_pkg.all;

entity primedle is
port(clk         : in std_logic;
     n_reset     : in std_logic;
     n_check_btn : in std_logic;
     n_golden_in : in std_logic_vector(7 downto 0);
     n_guess_in  : in std_logic_vector(7 downto 0);
     seg3        : out std_logic_vector(0 to 7);
     seg2        : out std_logic_vector(0 to 7);
     seg1        : out std_logic_vector(0 to 7);
     seg0        : out std_logic_vector(0 to 7);
     led_array   : out std_logic_vector(0 to 107));
end entity primedle;
