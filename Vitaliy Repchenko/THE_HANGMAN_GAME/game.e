note
	description: "Summary description for {GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME
create
	make
feature
	players, guesses:INTEGER
	world: STRING
	dictionary: ARRAYED_LIST[STRING]
	ArWorld: ARRAY[CHARACTER]
	flag:BOOLEAN
	input_file: PLAIN_TEXT_FILE
    output_file: PLAIN_TEXT_FILE
feature

	make(a_players, a_guesses:INTEGER )
		local
			i: INTEGER
		do
			world:=""
			create dictionary.make (0)
		 	create input_file.make_open_read ("input.txt")
            create output_file.make_open_write ("output.txt")

            from
                input_file.read_line
            until
                input_file.exhausted
            loop
                dictionary.extend (input_file.last_string.out)
                input_file.read_line
            end

            input_file.close
            output_file.close
			set_players(a_players)
			set_guesses(a_guesses)
			random_world
			create ArWorld.make_filled ('_', 1, world.count)
			from
				i:=1
			until
				i>world.count
			loop
				if
					world[i]=' ' or world[i].is_punctuation
				then
					ArWorld[i] := world[i]
				end
				i:=i+1
			end
		end

	set_players(a_players: INTEGER)
		do
			players:=a_players
		end

	set_guesses(a_guesses: INTEGER)
		do
			guesses:=a_guesses
		end

	random_world
		local
			k:RANDOM
			i:INTEGER
		do
			create k.make
			flag:=false
			from
				i:=1
			until
				i>dictionary.count
			loop
				if dictionary[i].out.count>=players then
					flag:=true
				end
				i:=i+1
			end
			if flag = true then
				from
				until
					world.count>=players
				loop
					k.forth
					world:=dictionary[k.item\\dictionary.count+1].out
				end
			else
				print("Sorry, but we don't have such a long word in our dictionary")
			end
		end



	guess(ch: CHARACTER): BOOLEAN
		local
			i: INTEGER
		do
			Result:=false
			from
				i:=1
			until
				i>world.count
			loop
				if ch = world[i] or ch.as_upper = world[i] or ch.as_lower = world[i]  then
					ArWorld[i]:=ch
					Result:=true
				end
				i:=i+1
			end

			from i:=1
			until i>world.count
			loop
				print(ArWorld[i].out)
				i:=i+1
			end
			print("%N")
		end

	proverka: BOOLEAN
		local
			i:INTEGER
		do
			Result:=true
			from
				i:=1
			until
				i>ArWorld.count
			loop
				if ArWorld[i].as_lower/= world[i] and  ArWorld[i].as_upper/= world[i] then
					Result:= false
				end
				i:=i+1
			end
		end

end
