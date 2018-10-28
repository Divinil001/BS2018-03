note
	description: "Summary description for {DICTIONARY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DICTIONARY

create
	make

feature

	words: ARRAYED_LIST [STRING]

	file: PLAIN_TEXT_FILE

	make (path: STRING)
		do
			create words.make (0)
			print("Opening dictionary file...%N")
			create file.make_open_read (path)
			from
				file.read_line
			until
				file.exhausted
			loop
				words.extend (file.last_string.out)
				file.read_line
			end
			words.extend (file.last_string.out)
			print ("Loaded ")
			io.put_integer (words.count)
			print (" words%N")
			file.close()
		end

	pick_word: STRING
		local
			r: RANDOM
			l_time: TIME
			l_seed: INTEGER
			index: INTEGER
		do
			create l_time.make_now
			l_seed := l_time.hour
			l_seed := l_seed * 60 + l_time.minute
			l_seed := l_seed * 60 + l_time.second
			l_seed := l_seed * 1000 + l_time.milli_second
			create r.set_seed (l_seed)
			r.start
			r.forth
			index := r.item \\ words.count + 1
			Result := words [index]
		end

end
