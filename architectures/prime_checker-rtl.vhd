architecture rtl of prime_checker is
signal s_guess : unsigned(7 DOWNTO 0);
begin
    check_prime : process(clk, check, s_guess, reset) is
    begin 
    if (rising_edge(clk)) then
        if (reset = '1') then
            ready <= '1';
            is_prime <= '1'; 
        elsif (check = '1') then
            ready <= '0';
            if (s_guess = 2 OR s_guess = 3 OR s_guess = 5 OR s_guess = 7 OR s_guess = 11
            OR s_guess = 31 OR s_guess = 37 OR s_guess = 41 OR s_guess = 43 OR s_guess = 47
            OR s_guess = 53 OR s_guess = 59 OR s_guess = 61 OR s_guess = 67 OR s_guess = 71
            OR s_guess = 73 OR s_guess = 79 OR s_guess = 83 OR s_guess = 89 OR s_guess = 97
            OR s_guess = 13 OR s_guess = 17 OR s_guess = 19 OR s_guess = 23 OR s_guess = 29
            OR s_guess = 101 OR s_guess = 103 OR s_guess = 107 OR s_guess = 113 OR s_guess = 127
            OR s_guess = 181 OR s_guess = 191 OR s_guess = 193 OR s_guess = 197 OR s_guess = 199
            OR s_guess = 131 OR s_guess = 137 OR s_guess = 139 OR s_guess = 149 OR s_guess = 151
            OR s_guess = 157 OR s_guess = 163 OR s_guess = 167 OR s_guess = 173 OR s_guess = 179
            OR s_guess = 211 OR s_guess = 223 OR s_guess = 233 OR s_guess = 239 OR s_guess = 241
            OR s_guess = 251) then
                is_prime <= '1';
            else 
                is_prime <= '0';
            end if;
         else
            ready <= '1';
        end if;
    end if;
    end process;

	s_guess <= unsigned(guess);
end architecture rtl;