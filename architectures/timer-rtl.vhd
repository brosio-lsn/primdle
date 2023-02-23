architecture rtl of timer is
SIGNAL s_current, s_next : unsigned(23 downto 0 );
--signal s_f :  unsigned(23 downto 0 );
begin
	--s_f <= to_unsigned(12000000,0);
	--todo rester s_next en unsigned, mais pour la comparaison le cast en natural
mem : PROCESS( clk ) IS
	BEGIN
		IF (rising_edge(clk)) THEN
			IF (clear = '1') THEN s_current <= to_unsigned(0,24);
				ELSE s_current <= s_next;
			END IF;
		END IF;
	END PROCESS mem;

	s_next <= (s_current) WHEN s_current = to_unsigned(FCLK,24) ELSE s_current+1;

	done <= '1' WHEN s_current = to_unsigned(FCLK,24) ELSE '0';



	--s_next <= (s_current) WHEN FCLK = s_current ELSE s_current+1;
	--done <= '1' WHEN FCLK = s_current ELSE '0';


end architecture rtl;