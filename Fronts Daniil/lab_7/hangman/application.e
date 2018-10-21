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
	rand(q: INTEGER): INTEGER
	local
	    r: RANDOM
	    t: TIME
	do
		create t.make_now
	    create r.set_seed (t.compact_time) -- ... is the initial "seed"
	    r.start
	    Result := r.item \\ q + 1
	    r.forth
	end

feature {NONE} -- Initialization	
	input: PLAIN_TEXT_FILE
	words: LINKED_LIST[STRING]
	n: INTEGER
	sec : SECRET
	loop_ch: INTEGER
	chr: CHARACTER_8
	i: INTEGER
	make
			-- Run application.
		do
			create input.make_open_read("input.txt")
			create words.make
			from

				i := 1
			until
				input.exhausted
			loop
				input.read_line
				words.extend(" ")
				words[i].copy (input.laststring)
				i := i + 1
			end
			n := rand(words.count)
			create sec.make (words.at (n))
			print(sec.printable + "%N")
			print("CHARACHER: %N")

			from
				loop_ch := 1
			until
				sec.mistakes = 4 or sec.printable ~ sec.s
			loop
				loop_ch := loop_ch + 1
				io.read_line
				chr := io.laststring[1].to_character_8
				sec.guess (chr)
				print(sec.printable + "%N")
				print("Mistakes: " + sec.mistakes.out + "%N")
			end
			if  sec.printable ~ sec.s then
				print("WINNER")
				io.read_character
			else
				print(sec.s)
				io.read_character
			end
		end

end
