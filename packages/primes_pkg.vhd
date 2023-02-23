library ieee;
use ieee.std_logic_1164.all;

package primes_pkg is
    type list_of_natural_t is array(0 to 53) of natural;
    type list_of_logic_vector_t is array(0 to 53) of std_logic_vector(7 downto 0);

    constant primes_natural : list_of_natural_t := (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251);
    constant primes_logic_vector : list_of_logic_vector_t := (x"02", x"03", x"05", x"07", x"0b", x"0d", x"11", x"13", x"17", x"1d", x"1f", x"25", x"29", x"2b", x"2f", x"35", x"3b", x"3d", x"43", x"47", x"49", x"4f", x"53", x"59", x"61", x"65", x"67", x"6b", x"6d", x"71", x"7f", x"83", x"89", x"8b", x"95", x"97", x"9d", x"a3", x"a7", x"ad", x"b3", x"b5", x"bf", x"c1", x"c5", x"c7", x"d3", x"df", x"e3", x"e5", x"e9", x"ef", x"f1", x"fb");
end package primes_pkg;

package body primes_pkg is
end package body primes_pkg;
