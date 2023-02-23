architecture rtl of debouncer is

signal s_first_dff : std_logic;
signal s_second_dff : std_logic;
signal s_third_dff : std_logic;
signal s_button_o : std_logic;
signal s_not_clear : std_logic;

begin
	s_not_clear<= not clear;
	--question est ce que dans la liste de dependance j inclus clear?
	--dff1
	dff1 : process(clk, s_not_clear, button)
	begin
		if(rising_edge(clk))then 
			s_first_dff<=button and s_not_clear;
		end if;
	end process dff1;

	--dff2
	dff2 : process(clk, s_not_clear, s_first_dff)
	begin
		if(rising_edge(clk))then 
			s_second_dff<=s_first_dff and s_not_clear;
		end if;
	end process dff2;

	--dff3
	dff3 : process(clk, s_not_clear, s_second_dff)
	begin
		if(rising_edge(clk))then 
			s_third_dff<=s_second_dff and s_not_clear;
		end if;
	end process dff3;

	--dff4
	dff4 : process(clk, s_not_clear, s_second_dff, s_button_o, s_third_dff)
	begin
		if(rising_edge(clk))then 
			s_button_o<=s_not_clear and (s_button_o or ( (not s_third_dff) and s_second_dff));
		end if;
	end process dff4;




    button_o <= s_button_o;
end architecture rtl; 
