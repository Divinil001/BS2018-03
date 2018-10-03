class
	GAME
create
	make

feature{NONE}
	a: APPLICATION
	dict: ARRAYED_LIST[STRING]
	players_number: INTEGER
	max_guesses_number: INTEGER
	random_sequence: RANDOM
	new_random(n: INTEGER): INTEGER
	require
		n >= 1
    	do
		random_sequence.forth
		Result := random_sequence.item \\ n + 1
    	ensure
    		Result > 0
  	end

  	start_game
  	local
  		is_finished: BOOLEAN
  	do
		from
			init
			is_finished := not new_game
		until
			is_finished
		loop
			init
			is_finished := not new_game
		end
  	end

  	init
  	do
  		a.system ("cls")
  		io.put_string("New game (countries) has started. %NPlease enter the number of players >> ")
  		io.read_integer
  		players_number := io.last_integer
  		io.put_string("The max number of guesses >> ")
  		io.read_integer
		max_guesses_number := io.last_integer
  		create random_sequence.set_seed ((create {TIME}.make_now).compact_time)
  		a.system ("cls")
  		select_random_word
  	end

  	new_game: BOOLEAN
  	local
  		correct: BOOLEAN
  	do
		from
			correct := false
		until
			correct
		loop
			io.put_string ("Do you want to start new game? [Y/n] >> ")
			io.read_line
			io.last_string.to_lower
			correct := io.last_string ~ "y" or io.last_string ~ "n"
			Result := io.last_string ~ "y"
		end
  	end

  	select_random_word
  	local
  		word: STRING
  		guessed: ARRAY[BOOLEAN]
  		guessed_chars, guesses, current_player: INTEGER
  		c: STRING
  	do
		word := dict.at (new_random(dict.count))
		create guessed.make_filled(false, 1, word.count)
		from
			guesses := 0
			guessed_chars :=  word.occurrences (' ')
			current_player := 0
		until
			guesses >= max_guesses_number or guessed_chars = word.count
		loop
			print_word(word, guessed)
			io.put_string ("Attempts: " + guesses.out + "%NPlayer " + (current_player \\ players_number + 1).out + ", Enter a character >> ")
			io.read_line
			c := io.laststring.out
			if c.count = 1 then
				if word.has_substring (c)then
					guessed_chars := guessed_chars + set_guessed(word, guessed, c.at (1))
				else
					guesses := guesses + 1
				end
				current_player := current_player + 1
			end
		end

		if guessed_chars = word.count then
			a.system ("cls")
			io.put_string ("Player " + ((current_player - 1) \\ players_number + 1).out + ", you won!%N")
		else
			a.system ("cls")
			io.put_string ("Attempts: " + guesses.out + "%NLose! %NThe word is " + word + "%N")
		end
  	end

  	set_guessed(word: STRING guessed: ARRAY[BOOLEAN] c: CHARACTER): INTEGER
  	local
  		i: INTEGER
  	do
  		from
  			i := 1
  		until
  			i > word.count
  		loop
  			if word.at (i) ~ c and not guessed.at (i) then
  				Result := Result + 1
  				guessed.put (true, i)
  			end
  			i := i + 1
  		end
  	end

  	print_word(word: STRING guessed: ARRAY[BOOLEAN])
  	local
  		i: INTEGER
  	do
  		a.system ("cls")
  	--	io.put_string (word + "%N")
  		from
  			i := 1
  		until
  			i > word.count
  		loop
  			if word.at (i) ~ ' ' or guessed.at (i) then
  				io.put_string (word.at (i).out + " ")
  			else
  				io.put_string("_ ")
  			end
  			i := i + 1
  		end
  		io.put_new_line
  	end

feature
	make(a_n: APPLICATION)
	local
		dict_file: PLAIN_TEXT_FILE
		t: STRING
		c: CHARACTER
	do
		a := a_n

		io.put_string ("Game is initialising. %NThe dictionary is loading...%N")

		create dict.make(0)
		create dict_file.make_open_read ("dict.txt")

		from
        	dict_file.read_character
        	create t.make_empty
        until
   	        dict_file.exhausted
        loop
        	c := dict_file.last_character
        	if c ~ '%N' then
        		t.to_lower
        		dict.extend(t.out)
        		t := ""
        	else
        		t.append (c.out)
        	end
            dict_file.read_character
        end
       	dict_file.close
		io.put_string ("The dictionary has successfully loaded.%N")
       	start_game
	end
end
