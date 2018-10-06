note
	description: "project_hangme application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	word_to_guess:STRING
	num_of_players:INTEGER
	max_num_of_guesses:INTEGER
	index:INTEGER
	guess_let:STRING
	correct_answers:INTEGER
	index1:INTEGER


feature
	rand_numb:INTEGER
		local
			r:RANDOM
		do
        	create r.set_seed (14) -- ... is the initial "seed"
        	r.start
        	r.forth
        	Result:=r.item \\ 85 + 1
		end


feature
	choose_word(input:PLAIN_TEXT_FILE):STRING
		local
			word:STRING
		do
			input.go (rand_numb)
			input.read_line
			word:=input.last_string
			Result:=word
			input.close
		end


feature {NONE} -- Initialization
	make
			-- Run application.
		do
			--| Add your code here
			--print ("Hello Eiffel World!%N")




			create input_file_fruits.make_open_read("input.txt")

			print("Write the maximum number of guesses: %N")
			io.read_integer
			max_num_of_guesses:= io.last_integer
			print("Write the number of players: %N")
			io.read_integer
			num_of_players:=io.last_integer


			word_to_guess:=choose_word(input_file_fruits)
			
			from
				index1:=1
			until
				word_to_guess.count > num_of_players
			loop
				if word_to_guess.count < num_of_players then
					word_to_guess:=choose_word(input_file_fruits)
				end
			end


			index1:=1
			guess_let := ""




			from
				index:=1
			until
				index>max_num_of_guesses
			loop

				print("Choose letter%N")
				io.read_word

				guess_let:=io.last_string

				if correct_answers = word_to_guess.count-1 then
					print("You win%N")
					--index:=max_num_of_guesses
				end

				if index = max_num_of_guesses then
					print("You loose%N")
				end


				if word_to_guess[index1].out ~ guess_let then
					correct_answers:= correct_answers + 1
					index1:=index1+1
				else
					index:= index + 1
				end
			end
		--	print(word_to_guess)





		end

	feature
		input_file_fruits: PLAIN_TEXT_FILE
		--output_file: PLAIN_TEXT_FILE

end
