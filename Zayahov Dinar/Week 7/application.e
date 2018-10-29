note
	description: "exercise application root class"
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
			-- Run application.
		local
			r: RANDOM
	    do
	    	create characters.make(0) -- letters from A to Z
			from
				i:=65
			until
				i>90
			loop
				characters.extend(i.to_character_8)
				i:=i+1
			end

            create input_file.make_open_read ("countries.txt") -- reading file, creating array of characters from file
            create list.make(0)
            from
                input_file.read_character
            until
                input_file.exhausted
            loop
            	list.extend (input_file.last_character)
            	input_file.read_character
            end

			--from -- show array of characters that was in file
           	--	i:=1
           	--until
           	--	i>list.count
           	--loop
           	--	print(list[i])
           	--	i:=i+1
            --end

			--io.new_line
			--from -- show array of words that was in file
            --		j:=1
            --until
            --		j>make_words(list).count
            --loop
            --		print(make_words(list)[j])
            --		io.new_line
            --		j:=j+1
          	--end

			create slovo.make (0)
          	create r.set_seed((create{TIME}.make_now).compact_time)
          	r.start
          	n:=make_words(list).count
          	slovo:=make_words(list)[r.item\\((n-1)-1)+1]
          	--print(slovo)
          	--io.new_line

          	create massiv1.make(0)    -- sozdaem massiv iz bukv slova i massiv iz podcherkivani
          	create massiv2.make(0)
          	from
          		i:=1
          	until
          		i>slovo.count
          	loop
          		massiv1.extend(slovo[i])
          		massiv2.extend('_')
          		i:=i+1
          	end

			print("Let's start our game. Word from topic 'Countries'")
			mistakes:=5
			attempts:=0
			t:=1
			from

			until
				(not	massiv2.has ('_')) or (not check_attempts)
			loop
				io.new_line
				print("You have ")
				print(mistakes-attempts)
				print(" attempts")

				io.new_line
				print("Write your letter: ")
				io.read_line
				c:=io.last_string[1]
				if
					not characters.has (c)
				then
					print("You already use this letter.")
					io.new_line
					characters.go_i_th (1)
				else
					if
						not massiv1.has (c)
					then
						attempts:=attempts+1
						print("There is no such letter in this word.")
						io.new_line
						massiv1.go_i_th (1)

						characters.search (c)
						characters[characters.index]:='.'
					else
						from
							i:=1
						until
							i>massiv1.count
						loop
							if
								massiv1[i]=c
							then
								massiv2[i]:=c
							end
							i:=i+1
						end
						characters.search (c)
						characters[characters.index]:='.'
					end
				end

				vivod_slova
				io.new_line
				vivod_alphabet
				characters.go_i_th (1)
				massiv2.go_i_th (1)
				io.new_line
			end

			if
				check_attempts
			then
				io.new_line
				print("You win!!!")
			else
				io.new_line
				print("You lose :(")
				io.new_line
				print("Word is: ")
				print(slovo)
			end


		end

feature
	check_attempts: BOOLEAN
		do
			if
				attempts<mistakes
			then
				Result:=True
			else
				Result:=False
			end
		end

	vivod_alphabet
		do
			from
				k:=1
			until
				k>characters.count
			loop
				print(characters[k])
				k:=k+1
			end
		end

	vivod_slova
		do
			from
				j:=1
			until
				j>massiv2.count
			loop
				print(massiv2[j])
				print(" ")
				j:=j+1
			end
		end

	make_words(l: ARRAYED_LIST[CHARACTER]): ARRAYED_LIST[STRING] -- make array of words
		local
			word: STRING
		do
			create Result.make(0)
			create word.make (0)
			from
				i:=1
			until
				i>l.count
			loop
				if
					l[i].out/~" "
				then
					word.extend (l[i])
				else
					Result.extend(word)
					word:=""
				end
				i:=i+1
			end
		end

feature
	massiv1: ARRAYED_LIST[CHARACTER] -- massiv iz bukv slova
	massiv2: ARRAYED_LIST[CHARACTER] -- output massiv
    input_file: PLAIN_TEXT_FILE -- file with words
    list: ARRAYED_LIST[CHARACTER] -- list of characters from input file
    characters: ARRAYED_LIST[CHARACTER]  -- alphabet
    i,j,n,k,attempts,mistakes,t: INTEGER
	slovo: STRING
	c: CHARACTER
	cond1,cond2: BOOLEAN

end
