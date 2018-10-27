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

feature {NONE} -- Initialization

	input_file: PLAIN_TEXT_FILE
	ans: STRING
	cnt: INTEGER
	random: INTEGER
	flag, ex: BOOLEAN
    curr: STRING
    i, j, mis: INTEGER
    c, cc: CHARACTER
   	mistake, win: BOOLEAN
   	random_sequence: RANDOM

    make
        do
        	create random_sequence.set_seed ((create {TIME}.make_now).compact_time)

			io.put_string ("Input your name: ")
			io.read_line
			io.put_new_line

        	flag := True
        	ex := False
        	cnt := 1
        	ans := ""
        	random := get_rand

            create input_file.make_open_read ("input.txt")

            from input_file.read_character
            until input_file.exhausted and cnt > random
            loop
            	if cnt = random then
            		ans := ans + input_file.last_character.out
            		from input_file.read_character
            		until flag = False
            		loop
            			if input_file.last_character.code = 10 then
            				flag := False
            				cnt := cnt + 1
            			else
							ans := ans + input_file.last_character.as_upper.out
            			end
            			input_file.read_character
            		end
            	else
            		input_file.read_character

	            	if input_file.last_character.code = 10 then
	            		cnt := cnt + 1
	            	end
            	end
            end
            if random > 1 then
            	ans.remove_head (1)
            end

			curr := ""
			from i := 1
			until i > ans.count
			loop
				curr := curr + "_"
				i := i + 1
			end

			io.put_string ("Current string: ")
			io.put_string (curr)
			io.put_new_line
			io.put_new_line

			mis := 0
			from flag := True; win := False
			until mis >= ans.count - 1 or win = True
			loop
				io.put_string ("Input your character: ")
				io.read_character
				c := io.last_character.twin
				c := c.as_upper
				io.read_character
				cc := io.last_character

				io.put_new_line
				mistake := True

				from j := 1
				until j > ans.count
				loop
					if c = ans.item (j) then
						curr.item (j) := c
						mistake := False
					end
					j := j + 1
				end

				if mistake = True then
					io.put_string ("Mistake! %N")
					mis := mis + 1
				end

				io.put_string ("Current string: " + curr + "%N")
				io.put_string ("Number of mistakes: " + mis.out + "%N")
				io.put_new_line

				if mis = ans.count - 1 then
					io.put_string ("GAME OVER!%N")
					io.put_string ("Your word was: " + ans + "%N")
				end

				win := True
				from j := 1
				until j > curr.count
				loop
					if curr.item (j) = '_' then
						win := False
					end
					j := j + 1
				end

				if win = True then
					io.put_string ("You win!%N")
				end
			end


            input_file.close
        end

	get_rand: INTEGER_32
		do
			random_sequence.forth
			Result := random_sequence.item \\ 499 + 1
		ensure
				Result > 0
		end

end
