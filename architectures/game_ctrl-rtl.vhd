architecture rtl of game_ctrl is
	TYPE StateType is(idle, check, fin , update);
	SIGNAL s_cur_state, s_next_state : StateType;
	SIGNAL s_finished : std_logic;
	signal s_trial : std_logic_vector(29 downto 0);
	--signal s_count : unsigned(2 downto 0);
	signal s_history_t : history_t;
	--signal s_t : history_t;
begin
	--todo finished
	finished<=s_finished;
	rejected<= not is_prime;
	LED_en <= '0' when s_cur_state = update else '1';
	game_records<=s_history_t;
	trials_count <= s_trial;

	dff : PROCESS ( clk )
	BEGIN
		IF (rising_edge(clk)) THEN
		if(reset='1') then s_cur_state <= idle;
		else s_cur_state <= s_next_state;
		END IF;
		end if;
	END PROCESS dff;

	transition : PROCESS ( reset,s_cur_state, ready, s_finished) IS
	BEGIN
		CASE (s_cur_state) IS
			WHEN IDLE => IF (ready ='1') THEN
				s_next_state <= IDLE;
					ELSE
				s_next_state <= check;
				END IF;
			WHEN check => IF (ready ='0') THEN
				s_next_state <= check;
					ELSE
				s_next_state <= update;
					end if;
			WHEN update => IF (s_finished ='0') THEN
				s_next_state <= idle;
					ELSE
				s_next_state <= fin;
					end if;
			WHEN fin => IF (reset ='0') THEN
				s_next_state <= fin;
					ELSE
				s_next_state <= idle;
					end if;
			WHEN OTHERS => s_next_state <= IDLE;
		END CASE ;
	END PROCESS transition;
	--trial est 0 au tt debut
	trial : PROCESS ( s_cur_state , reset, clk)
	BEGIN
		if(rising_edge(clk)) then 
		if(reset='1')then 
		s_trial <= (others=>'0');
		else IF (s_cur_state=update) THEN
		s_trial <='1'&s_trial(29 downto 1);
		else IF (s_cur_state=fin) THEN
		s_trial <= s_trial;
		END IF;
		end if;
		end if;
		end if;
	END PROCESS trial;

	done : PROCESS ( golden, guess, s_trial,s_history_t, reset)
	BEGIN
		--todo fix le finished (guess=golden)
		if (reset='1') then s_finished<='0';
		else IF (((s_cur_state=update)and(guess = golden)) or (not(s_history_t(4)(0) = "00")) or (s_trial(0)='1')) then s_finished<='1';
		else s_finished<='0';
		end if;
		end if;
	END PROCESS done;



	history : PROCESS ( golden, guess, reset,s_cur_state, clk)
    BEGIN
	IF (rising_edge(clk)) THEN
        if(reset ='1') then 
            for n in 0 to 4 loop
                for m in 0 to 3 loop
                    for k in 0 to 1 loop
                        s_history_t(n)(m)(k) <= '0';
                    end loop;
                end loop;
            end loop;
        else if((s_cur_state = update) and (is_prime='1')) then
            for i in 0 to 3 loop
		if(s_history_t(0)(0) = "00") then
                	if((guess(i+i+1)=golden(i+i+1)) and (golden(i+i)=guess(i+i))) then
                    	    s_history_t(0)(i) <= "11";
                        else 
                         s_history_t(0)(i) <= "01";
                         for j in 0 to 3 loop
                            if((guess(i+i+1)=golden(j+j+1)) and (golden(j+j)=guess(i+i))) then
                                s_history_t(0)(i) <= "10";
                            end if;
                         end loop;
                       end if;
		else if(s_history_t(1)(0) = "00") then
                	if((guess(i+i+1)=golden(i+i+1)) and (golden(i+i)=guess(i+i))) then
                    	    s_history_t(1)(i) <= "11";
                        else 
                         s_history_t(1)(i) <= "01";
                         for j in 0 to 3 loop
                            if((guess(i+i+1)=golden(j+j+1)) and (golden(j+j)=guess(i+i))) then
                                s_history_t(1)(i) <= "10";
                            end if;
                         end loop;
                       end if;
		else if(s_history_t(2)(0) = "00") then
                	if((guess(i+i+1)=golden(i+i+1)) and (golden(i+i)=guess(i+i))) then
                    	    s_history_t(2)(i) <= "11";
                        else 
                         s_history_t(2)(i) <= "01";
                         for j in 0 to 3 loop
                            if((guess(i+i+1)=golden(j+j+1)) and (golden(j+j)=guess(i+i))) then
                                s_history_t(2)(i) <= "10";
                            end if;
                         end loop;
                       end if;
		else if(s_history_t(3)(0) = "00") then
                	if((guess(i+i+1)=golden(i+i+1)) and (golden(i+i)=guess(i+i))) then
                    	    s_history_t(3)(i) <= "11";
                        else 
                         s_history_t(3)(i) <= "01";
                         for j in 0 to 3 loop
                            if((guess(i+i+1)=golden(j+j+1)) and (golden(j+j)=guess(i+i))) then
                                s_history_t(3)(i) <= "10";
                            end if;
                         end loop;
                       end if;
		else if(s_history_t(4)(0) = "00") then
                	if((guess(i+i+1)=golden(i+i+1)) and (golden(i+i)=guess(i+i))) then
                    	    s_history_t(4)(i) <= "11";
                        else 
                         s_history_t(4)(i) <= "01";
                         for j in 0 to 3 loop
                            if((guess(i+i+1)=golden(j+j+1)) and (golden(j+j)=guess(i+i))) then
                                s_history_t(4)(i) <= "10";
                            end if;
                         end loop;
                       end if;
		end if;
		end if;
		end if;
		end if;
		end if;		
            end loop;
	    end if;
	end if;
	end if;

    END PROCESS history;

end architecture rtl;