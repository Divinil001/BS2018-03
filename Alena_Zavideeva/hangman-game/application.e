class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	Attempts: INTEGER = 5
	word: STRING
	break: BOOLEAN
	showing_word: STRING
	counter: INTEGER
	tmp: CHARACTER
	state : INTEGER
	random: RANDOM

	your_dict: ARRAY[STRING]
	make
	local
		i : INTEGER
		do
			Io.put_string("Put your words to dictionary, exit from adding is keyword 'END'")
			put_word_to_dict
			Io.put_string ("%N Let's start a game! Amount of attempts is " + Attempts.out+ "%N")
			-- Create random object with a fully random seed (almost)
			create random.set_seed ((create {C_DATE}).millisecond_now)
			-- Get a fully random word
			word := your_dict[(random.real_item*your_dict.count).truncated_to_integer]

			create showing_word.make_filled('_', word.count)
			counter := word.count
			print(showing_word + "%N")
			create your_dict.make_empty
			from
				i:= 0
				break := False
			until
				i = Attempts or break
			loop
				Io.put_string ("Letter: ")
				put_chr
				state := checking(tmp)
				if
					state = 1
				then
					if counter = 0 then
						Io.put_string ("Correct word!%N")
						break := True
					else
						Io.put_string ("You are right!%N")
					end
				elseif state = 2 then
					Io.put_string ("You have already guessed this letter, -1 attempt%N")
					i := i + 1
				else

					Io.put_string ("No such letter in the word%N")
					i := i + 1
				end
				Io.put_string (showing_word + "%N")
			end

			if break = False then
				Io.put_string ("Good attempt, but You lost%N")
				Io.put_string("Correct word was: ")
				Io.put_string (word)
			end

		end


	put_chr
	local
		s : STRING
	do
		Io.read_line
		s := Io.last_string
		if s.count > 1 then
			Io.put_string ("Please, write your LETTER again"+"%N")
			put_chr
		else
			tmp := Io.last_string[1]
		end
	end

	put_word_to_dict
	local
		str : STRING
		flag : BOOLEAN
	do
		create your_dict.make_empty
		from
		until
			flag  = True
		loop
			Io.put_string ("%N")
			Io.read_line
			str := Io.last_string.out

			if str ~ "END" then
				flag := True
			else
				your_dict.force (str, your_dict.count)
			end
		end
	end
	checking(chr: CHARACTER): INTEGER
	local
		i : INTEGER
	do
		from
			i := 1
		until
			i > word.count
		loop
			if word[i] = chr then
				if showing_word[i] = chr then
					i := word.count
					Result := 2
				else
					Result := 1
					showing_word[i] := chr
					counter := counter - 1
				end
			end
			i := i + 1
		end

	end

end
