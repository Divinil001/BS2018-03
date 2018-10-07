note
	description: "hangman application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create_dictionary
			init
			print_hangman
			from is_playing := True
			until is_playing = False
			loop
				print_info
				enter_guess
				check_guess_end
			end

		end

feature -- Start the game

	num_mistakes: INTEGER = 6
	dictionary: ARRAYED_LIST [STRING]
	input_file: PLAIN_TEXT_FILE
	secret_word: STRING
	print_word: ARRAYED_LIST [CHARACTER]

	init
		local
			valid: BOOLEAN
			n: INTEGER
		do
			create mistakes.make (0)
			create guessed.make (0)
			pick_secret_word
			secret_word.to_upper
			-- Create print_word
			create print_word.make (0)
			from n := 1
			until n > secret_word.count
			loop
				print_word.extend ('_')
				n := n + 1
			end
		end

	create_dictionary
			-- Create dicionary to pick a secret word
		do
			create dictionary.make (0)
			create input_file.make_open_read ("animals.txt")
			from input_file.read_line
			until input_file.exhausted
			loop
				dictionary.extend (input_file.last_string)
				input_file.read_line
			end
		end

	pick_secret_word
		local
			max, i: INTEGER
			r: RANDOM
		do
			max := dictionary.count
			create r.make -- Seed
			r.forth
			i := r.item \\ max + 1
			secret_word := dictionary [i]
		end

feature -- Playing game
	is_playing: BOOLEAN
	guessed: STRING
	valid_input: STRING = "QWERTYUIOPASDFGHJKLZXCVBNM"
	mistakes: ARRAYED_LIST [CHARACTER]
	guess: CHARACTER

	print_hangman
		do
			inspect
				mistakes.count
			when 1 then
				print ("%N%N        _________%N")
				print ("        |       |%N")
				print ("        O       |%N")
				print ("                |%N")
				print ("                |%N")
				print ("                |%N")
				print ("                |%N")
				print ("    =================%N")
			when 2 then
				print ("%N%N        _________%N")
				print ("        |       |%N")
				print ("        O       |%N")
				print ("        |       |%N")
				print ("                |%N")
				print ("                |%N")
				print ("                |%N")
				print ("    =================%N")
			when 3 then
				print ("%N%N        _________%N")
				print ("        |       |%N")
				print ("        O       |%N")
				print ("       /|       |%N")
				print ("                |%N")
				print ("                |%N")
				print ("                |%N")
				print ("    =================%N")
			when 4 then
				print ("%N%N        _________%N")
				print ("        |       |%N")
				print ("        O       |%N")
				print ("       /|\      |%N")
				print ("                |%N")
				print ("                |%N")
				print ("                |%N")
				print ("    =================%N")
			when 5 then
				print ("%N%N        _________%N")
				print ("        |       |%N")
				print ("        O       |%N")
				print ("       /|\      |%N")
				print ("         \      |%N")
				print ("                |%N")
				print ("                |%N")
				print ("    =================%N")
			when 6 then
				print ("%N%N        _________%N")
				print ("        |       |%N")
				print ("        O       |%N")
				print ("       /|\      |%N")
				print ("       / \      |%N")
				print ("                |%N")
				print ("                |%N")
				print ("    =================%N")
			else
				print ("%N%N        _________%N")
				print ("        |       |%N")
				print ("                |%N")
				print ("                |%N")
				print ("                |%N")
				print ("                |%N")
				print ("                |%N")
				print ("    =================%N")
			end
		end

	print_info
		local
			i: INTEGER
		do
			print ("Animal: ")
			from i := 1
			until i > print_word.count
			loop
				print (print_word [i].out + " ")
				i := i + 1
			end
			if not mistakes.is_empty then
				print ("%NMistakes (" + mistakes.count.out + "/" + num_mistakes.out + "): ")
				from i := 1
				until i > mistakes.count
				loop
					print (mistakes [i].out + " ")
					i := i + 1
				end
			end
		end

	enter_guess
		local
			valid: BOOLEAN
			c: CHARACTER
			i: INTEGER
		do
			print ("%NYour guess: ")
			from valid := False
			until valid = True
			loop
				io.read_character
				c := io.last_character.upper
				if valid_input.character_32_has (c) and not guessed.character_32_has (c) then
					guess := c
					valid := True
				end
			end
		end

	check_guess_end
		local
			i: INTEGER
		do
			guessed.extend (guess)
			if secret_word.character_32_has (guess) then
				from i := 1
				until i > secret_word.count
				loop
					if secret_word.item (i) = guess then
						print_word [i] := guess
					end
					i := i + 1
				end
				if win then
					print ("%NYes! The word is: " + secret_word)
					is_playing := False
				end
			else
				mistakes.extend (guess)
				print_hangman
				if lose then
					print ("%NOut of guesses! The word is: " + secret_word)
					is_playing := False
				end
			end
		end

	win: BOOLEAN
		local
			i: INTEGER
		do
			Result := True
			from i := 1
			until i > print_word.count
			loop
				if print_word [i] = '_' then
					Result := False
				end
				i := i + 1
			end
		end

	lose: BOOLEAN
		do
			if mistakes.count = num_mistakes then
				Result := True
			else
				Result := False
			end
		end

end
