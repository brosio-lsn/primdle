-- Generates random prime number.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.primes_pkg.all;

entity rand_gen is
port(clk   : in std_logic;
     reset : in std_logic;
     rand  : out std_logic_vector(7 downto 0));
end entity rand_gen;
