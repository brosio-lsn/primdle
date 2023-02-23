architecture rtl of led_driver is
    type matrix_t is array(0 to 8) of std_logic_vector(11 downto 0);
    signal led_matrix : matrix_t;
begin
    rows:for i in 0 to 4 generate
        led_matrix(i) <= game_records(i)(3) & "0" & game_records(i)(2) & "0" & game_records(i)(1) & "0" & game_records(i)(0) & "0";
    end generate rows;

    led_matrix(5) <= (others => '0');
    led_matrix(6) <= trials_count(1 to 10) & "0" & finished;
    led_matrix(7) <= trials_count(11 to 20) & "00";
    led_matrix(8) <= trials_count(21 to 30) & "0" & rejected;

    leds <=   led_matrix(0) & led_matrix(1) & led_matrix(2)
            & led_matrix(3) & led_matrix(4) & led_matrix(5)
            & led_matrix(6) & led_matrix(7) & led_matrix(8)
            when enabled = '1' else (others => '0');

end architecture rtl;
