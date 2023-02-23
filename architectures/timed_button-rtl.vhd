architecture rtl of timed_button is
    signal debouncer_clear, debouncer_en : std_logic;
begin
    tmr:entity work.timer(rtl)
    port map(clk     => clk,
             clear   => clear,
             done    => debouncer_en);

    deb:entity work.debouncer(rtl)
    port map(clk      => clk,
             button   => button,
             clear    => debouncer_clear,
             button_o => button_o);

    debouncer_clear <= clear or (not debouncer_en);
end architecture rtl;
