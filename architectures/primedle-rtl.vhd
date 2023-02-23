architecture rtl of primedle is
    signal golden_in, guess_in, golden_rand, golden, digits_display : std_logic_vector(7 downto 0);
    signal reset, check_btn, check, btn_clear : std_logic;
    signal game_records : history_t;
    signal trials_count : std_logic_vector(1 to 30);
    signal ready, is_prime, finished, rejected, led_enabled : std_logic;
begin
    --Reverse the switch polarity.
    golden_in <= not n_golden_in;
    guess_in <= not n_guess_in;

    --Reverse the button polarity.
    reset <= not n_reset;
    check_btn <= not n_check_btn;

    --Set up the golden key (select between input and random).
    randgen:entity work.rand_gen(rtl)
    port map(clk => clk,
             reset => reset,
             rand => golden_rand);
    golden <= golden_rand when golden_in = "00000000" else golden_in;

    --Debounce the check button.
    btn_clear <= reset or not ready;
    btn:entity work.timed_button(rtl)
    port map(clk      => clk,
             button   => check_btn,
             clear    => btn_clear,
             button_o => check);

    --is_prime
    checker:entity work.prime_checker(rtl)
    port map(clk => clk,
             reset => reset,
             guess => guess_in,
             check => check,
             is_prime => is_prime,
             ready => ready);

    --game_ctrl
    ctrl:entity work.game_ctrl(rtl)
    port map(clk => clk,
             reset => reset,
             guess => guess_in,
             golden => golden,
             ready => ready,
             is_prime => is_prime,
             game_records => game_records,
             trials_count => trials_count,
             finished => finished,
             rejected => rejected,
             LED_en => led_enabled);

    --Display the current guess during game, and display the golden after game finished.
    digits_display <= guess_in when finished = '0' else golden;

    --Set up the 7-segment display decoders.
    seg3dec:entity work.seg_decoder(rtl)
    port map(digit => digits_display(7 downto 6),
             seg   => seg3);
    seg2dec:entity work.seg_decoder(rtl)
    port map(digit => digits_display(5 downto 4),
             seg   => seg2);
    seg1dec:entity work.seg_decoder(rtl)
    port map(digit => digits_display(3 downto 2),
             seg   => seg1);
    seg0dec:entity work.seg_decoder(rtl)
    port map(digit => digits_display(1 downto 0),
             seg   => seg0);
    
    --Set up the LED driver.
    led:entity work.led_driver(rtl)
    port map(game_records => game_records,
             trials_count => trials_count,
             finished => finished,
             rejected => rejected,
             enabled => led_enabled,
             leds => led_array);
end architecture rtl;
