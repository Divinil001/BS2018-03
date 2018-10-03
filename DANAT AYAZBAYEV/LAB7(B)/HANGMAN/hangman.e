note
	description: "HANGMAN application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	HANGMAN

inherit
	ARGUMENTS

create
	make

feature
	randint : INTEGER
		do
			ranseq.forth
			Result := ranseq.item
		end

feature
	input_file : PLAIN_TEXT_FILE
	animals : ARRAYED_LIST[STRING]
	ranseq : RANDOM

feature {NONE}
	make
		local
			st : STRING
			i : INTEGER
			l_time: TIME
      		l_seed: INTEGER
      		x : INTEGER
      		attempt : INTEGER
      		flag : BOOLEAN
      		flag2 : BOOLEAN
   			guessed : INTEGER
   			space : INTEGER
   			last : STRING
   			used : ARRAYED_LIST[CHARACTER]
		do
			print("YOU ARE GOING TO GUESS A COUNTRY%NGOOD LUCK!:)%N%N")
			last := ""
			create used.make (0)
			create l_time.make_now
      		l_seed := l_time.hour
      		l_seed := l_seed * 60 + l_time.minute
      		l_seed := l_seed * 60 + l_time.second
     		l_seed := l_seed * 1000 + l_time.milli_second
      		create ranseq.set_seed (l_seed)
			st := ""
			create animals.make(0)
			create input_file.make_open_read("input.txt")
			from
				input_file.read_character
			until
				input_file.exhausted
			loop
				if input_file.last_character = '%N' then
					animals.extend(st)
					st := ""
				else
					st.extend (input_file.last_character)
					st[st.count] := st[st.count].as_upper
				end
				input_file.read_character
			end
			x := randint \\ 168 + 1
			st := animals[x]
			attempt := 8
			--print(st + "%N")
			from
				i := 1
			until
				i > st.count
			loop
				if st[i] = ' ' then
					space := space + 1
					print("  ")
					last.extend (' ')
				else
					last.extend ('_')
					print('_')
				end
				print(" ")
				i := i + 1
			end
			print ("%N")
			from
				flag := false
			until
				flag = true
			loop
				io.read_line
				from
					i := 1
					flag2 := false
				until
					i > used.count or flag2 = true
				loop
					if io.last_string.out.item (1).as_upper = used[i] then
						flag2 := true
					end
					i := i + 1
				end
				if flag2 = true then
					print("This character already was%N")
				else
					used.extend (io.last_string.out.item (1).as_upper)
					from
						i := 1
						flag2 := false
					until
						i > st.count
					loop
						if st[i] = ' ' then
							print("  ")
						else
							if st[i] = io.last_string.out.item (1).as_upper then
								print(st[i])
								guessed := guessed + 1
								last[i] := st[i]
								flag2 := true
							else
								print(last[i])
							end
						end
						print(" ")
						i := i + 1
					end
					print("%N")
					if flag2 = False then
						attempt := attempt - 1
					end
					if attempt = 0 then
						flag := true
					end
					if st.count - space = guessed then
						flag := true
					end
					print("Mistakes left: " + attempt.out + "%N")
				end
			end

			if attempt = 0 then
				print("%NYOU LOSE :(%NMORE LUCK NEXT TIME!%NTHE ANSWER IS: " + st)
			else
				print("%NCONGRATS!%NYOU WIN :)")
			end
		end
end
