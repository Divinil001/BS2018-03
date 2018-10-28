note
	description: "hangman application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature

	dict: DICTIONARY

	p1, p2: PLAYER

	state: BOOLEAN

	spTurn: BOOLEAN

	word: STRING

	wordState: ARRAYED_LIST [BOOLEAN]

	wordProgress: INTEGER

	maxAttempts: INTEGER

	a1, a2: INTEGER

	make
		local
			guessed: BOOLEAN
		do
			create dict.make ("dict.txt")

				-- init state
			state := true
			spTurn := false
			word := dict.pick_word()
			maxAttempts := 5
			a1 := 0
			a2 := 0
			create wordState.make (0)
			initWordState()
			print ("tsss! Picked word is: " + word + "%N")
			print ("Enter first player's name:%N")
			io.read_line()
			create p1.make (io.last_string.out)
			print ("Enter second player's name:%N")
			io.read_line()
			create p2.make (io.last_string.out)
			from
			until
				not state
			loop
				if not spTurn then
					print (p1.name + "'s turn. You have ")
					print (maxAttempts - a1)
				else
					print (p2.name + "'s turn. You have ")
					print (maxAttempts - a2)
				end
				print (" attempts left.%N")
				printWord()
				print ("Pick the letter: ")
				io.read_character
				guessed := checkLetter (io.last_character)
				io.read_line -- read newline character
				if wordProgress = word.count then
					if spTurn then
						print (p2.name)
					else
						print (p1.name)
					end
					print (" has won!%NWord is: ")
					printWord
					state := false
				else
					if not guessed then
						print ("Letter '")
						print (io.last_character)
						print ("' was wrong%N")
						if spTurn then
							a2 := a2 + 1
							if a2 = maxattempts then
								print ("Player 2 lost! He wasted all the attempts.%N")
								state := false
							end
						else
							a1 := a1 + 1
							if a1 = maxattempts then
								print ("Player 1 lost! He wasted all the attempts.%N")
								state := false
							end
						end
					else
						print ("Letter '")
						print (io.last_character)
						print ("' was right%N")
					end

					spTurn := not spTurn
				end
			end
		end

	checkLetter (c: CHARACTER): BOOLEAN
		local
			initialProgress: INTEGER
			i: INTEGER
		do
			initialprogress := wordProgress
			from
				i := 1
			until
				i > word.count
			loop
				if word [i] = c and not wordState [i] then
					wordState [i] := true
					wordProgress := wordProgress + 1
				end
				i := i + 1
			end
			Result := initialProgress /= wordprogress
		end

	initWordState
		do
			create wordState.make_filled (word.count())
		end

	printWord
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > word.count
			loop
				if wordState [i] then
					print (word [i])
				else
					print ("_")
				end
				i := i + 1
			end
			print ("%N")
		end

end
