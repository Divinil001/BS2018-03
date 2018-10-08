note
	description: "THE_HANGMAN_GAME application root class"
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
		do
			--| Add your code here
			p:=1
			print("%N")
			create play.make(1,1)
			print ("Number of players: ")
			io.read_integer
			play.set_players (io.last_integer)
			print ("Number of guesses: ")
			io.read_integer
			play.set_guesses (io.last_integer)
			play.make (play.players, play.guesses)
			from i:=1
			until i>play.world.count
			loop
				print(play.ArWorld[i].out)
				i:=i+1
			end
			print("%N")
			from
				i:=1
			until
				p>play.guesses or play.proverka
			loop
				if i\\play.players = 0 then
					pl:= play.players
				else
					pl:=i\\play.players
				end
				print ("Player "+pl.out+" letter: ")
				io.read_character
				if not play.guess (io.last_character) then
					Print("%N"+"Number of ERRORS: "+p.out+"%N")
					p:=p+1
				end

				if
					play.proverka
				then
					io.put_string("Player: "+pl.out+ " win!!!")
				end
				io.read_line
				i:=i+1
			end
			if not play.proverka then
				print("You lose!!!"+"%N"+"Word: "+play.world.out)
			end
		end
feature
	play: GAME
	i, pl, p:INTEGER
end
