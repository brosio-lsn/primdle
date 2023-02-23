library ieee;
use ieee.std_logic_1164.all;

package game_types_pkg is
    subtype color_t is std_logic_vector(1 downto 0);
    -- Colors are encoded in 2 bits.
    -- 2'b00 : white (not guessed yet)
    -- 2'b01 : black (wrong number never appears in the golden key)
    -- 2'b10 : yellow (correct number, wrong position)
    -- 2'b11 : green (correct number, correct position)

    type hint_t is array(3 downto 0) of color_t;
    -- A `hint_t` concats the colors for the four digits in one valid guess.

    type history_t is array(0 to 4) of hint_t;
    -- The `history_t` concats the five `hint_t`s throughout the game-play.

end package game_types_pkg;

package body game_types_pkg is    
end package body game_types_pkg;
