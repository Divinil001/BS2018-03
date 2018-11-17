class
	APPLICATION

create
	make

feature
	make
		do

		end

	anagram(word: STRING): LINKED_LIST[STRING]
		local
			i, j : INTEGER
			tmp : LINKED_LIST[STRING]
			str :  STRING
		do
			create Result.make
			if
				word.count <= 1
			then
				Result.extend(word)
			else
				from
					i := 1
				until
					i > word.count
				loop
					create str.make_from_string(word)
					str.remove (i)
					tmp := anagram(str)
					from
						j := 1
					until
						j > tmp.count
					loop
				 		if not same_word(result, word[i].out + tmp[j])  then
				 			Result.extend(word[i].out + tmp[j])
				 		end
						j := j + 1
					end
					i := i + 1
				end
			end
		end

	same_word(list : LINKED_LIST[STRING]; str: STRING): BOOLEAN
		local
			i : INTEGER
		do
			from
				i := 1
			until
				i > list.count or Result
			loop
				if list[i] ~ str then
					Result := True
				end
				i := i + 1
			end
		end
end
