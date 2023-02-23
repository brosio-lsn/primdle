-- Converts a 2-bit digit into a vector driving a 7-segment display.
library ieee;
use ieee.std_logic_1164.all;

entity seg_decoder is
port(digit: in std_logic_vector(1 downto 0);
     seg  : out std_logic_vector(0 to 7));
     --Mapping of the bits:
     --0 1 2 3 4 5 6 7
     --a b c d e f g p
end entity seg_decoder;
