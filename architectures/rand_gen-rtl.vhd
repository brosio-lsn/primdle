architecture rtl of rand_gen is
    constant num_primes : unsigned(5 downto 0) := to_unsigned(54, 6);
    signal i, j : unsigned(5 downto 0);
begin
    loop_i: process(clk) is
    begin
        if rising_edge(clk) then
            if i = num_primes then
                i <= to_unsigned(0, 6);
            else
                i <= i + to_unsigned(1, 6);
            end if;
        end if;
    end process loop_i;

    set_j: process(reset) is
    begin
        if falling_edge(reset) then
            j <= i;
        end if;
    end process set_j;

    rand <= primes_logic_vector(to_integer(j));

end architecture rtl;