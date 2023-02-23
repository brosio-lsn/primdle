-- Prime checker module.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.primes_pkg.all;

entity prime_checker is
port(clk      : in std_logic;
     reset    : in std_logic;
     guess    : in std_logic_vector(7 downto 0);
     check    : in std_logic;
     is_prime : out std_logic;
     ready    : out std_logic);
end entity prime_checker;
