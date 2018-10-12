note
	description: "hangman_remake application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			word: STRING
			display : ARRAY[CHARACTER]
			n, lives, alive, i , letters_left, turn, l_seed: INTEGER
			lives_arr : ARRAY[INTEGER]
			input_file : PLAIN_TEXT_FILE
			words : ARRAY[STRING]
			l_time : TIME
			random : RANDOM
			ch : CHARACTER
			used : ARRAY[BOOLEAN]
			found : BOOLEAN
		do
			create input_file.make_open_read ("input.txt")
			create words.make_empty
			from until input_file.exhausted loop
				input_file.read_line
				words.force (input_file.last_string.twin, words.count + 1)
			end

			print("Num of players : %N")
			io.read_integer
			n := io.last_integer.twin
			alive := n

			create lives_arr.make_empty
			print("Num of lives : %N")
			io.read_integer
			lives := io.last_integer.twin
			from i := 1 until i = n + 1 loop
				lives_arr.force (lives, i)
				i := i + 1
			end

			create l_time.make_now
      		l_seed := l_time.hour
      		l_seed := l_seed * 60 + l_time.minute
      		l_seed := l_seed * 60 + l_time.second
      		l_seed := l_seed * 1000 + l_time.milli_second
			create random.set_seed (l_seed)
			from until words[1 + random.item \\ words.count].count >= n loop
				random.forth
			end
			word := words[1 + random.item \\ words.count]
			letters_left := word.count
			create display.make_filled ('_', 1, word.count)
			from i := 1 until i = word.count + 1 loop
				if word[i] = ' ' or word[i] = '-' then
					display[i] := word[i]
					letters_left := letters_left - 1
				end
				i := i + 1
			end

			create used.make_filled (false, 1, 26)

			from until alive = 0 or letters_left = 0 loop

				turn := 1 + turn\\n
				from until lives_arr[turn] > 0 loop
					turn := 1 + turn \\ n
				end
				from i := 1 until i = word.count + 1 loop
					print(display[i].out + " ")
					i := i + 1
				end
				io.new_line
				print("Player # " + turn.out + " turn%N")
				print("Lives left : " + lives_arr[turn].out + "%N")
				io.read_character
				from until ('a').code <= io.last_character.code
							and io.last_character.code <= ('z').code
							and not used[io.last_character.code - ('a').code + 1] loop
					io.read_character
				end
				ch := io.last_character.twin
				used[ch.code - ('a').code + 1] := true
				found := false

				from i := 1 until i = word.count + 1 loop
					if word[i] = ch then
						found := true
						display[i] := ch
						letters_left := letters_left - 1
					end
					i := i + 1
				end

				if not found then
					lives_arr[turn] := lives_arr[turn] - 1
					if lives_arr[turn] = 0 then
						alive := alive - 1
						print("You lost %N")
					end
				end

				print("Lives left : " + lives_arr[turn].out)
				io.new_line
				io.new_line
				io.new_line
			end

			if letters_left = 0 then
				print("Player " + turn.out + " won%N")
			else
				print("The correct word is " + word.out)
			end
			io.read_character
		end

end
