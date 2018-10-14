note
	description: "handman application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

		players: INTEGER
		gueses: INTEGER
		temp_dictionary: DICTIONARY
		word:STRING

	make
			-- Run application.
			local i:INTEGER
			letter: STRING

		do
			--| Add your code here
			print("start %N")
			create temp_dictionary.make
			print("dictionary created %N")

			print("Maximum number of guesses: %N" )
			io.read_integer
			gueses := io.last_integer

			word:=randint

			from -- creatin _ of ammount of characters
				i:=1
			until
				i>word.count
			loop
				print(" _ ")
				i:=i+1
			end
			print("%N")


			from
				i:=0
			until
				i>gueses+1
			loop
				print(players.out + " guess %N")
				io.read_line
				letter:= io.last_string

				check_word(letter)
				print("%N")
				players:=players+1

				i:=i+1
			end
		end
			check_word(a_letter:STRING)
			local i:INTEGER
				do
					from
						i:=1
					until
						i> word.count
					loop
						if word.at(i) = a_letter.at(1) then
					  	print(a_letter.out)
					   	else
					   		print(" _ ")
					   	end
					   	i:= i + 1
					end
				end

		move_player(a_player:INTEGER):INTEGER
				do
					if
						a_player = 1
					then
						Result:=2
					elseif a_player = 2 then

						Result:=1
					end
				end

		randint :STRING
			local	max, i: INTEGER

				rnd: RANDOM

			do

				max := temp_dictionary.colour.count

				create rnd.make

				rnd.forth

				i := rnd.item \\ max + 1
				print(temp_dictionary.colour[i].out)

				Result := temp_dictionary.colour[i]

		end
end
