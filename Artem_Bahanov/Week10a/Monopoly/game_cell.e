deferred class
	GAME_CELL
feature{NONE}
	blocked_turnes: INTEGER
	tax: INTEGER
	owner: detachable PLAYER
	random_sequence: RANDOM

feature
	pay(p: PLAYER)
	deferred
	end

	y_o_n(q: STRING): BOOLEAN
  	local
  		correct: BOOLEAN
  	do
		from
			correct := false
		until
			correct
		loop
			io.put_string (q + " [Y/n] >> ")
			io.read_line
			io.last_string.to_lower
			correct := io.last_string ~ "y" or io.last_string ~ "n"
			Result := io.last_string ~ "y"
		end
  	end

  	make_random
  	do
  		create random_sequence.set_seed ((create {TIME}.make_now).compact_time)
  	end

  	random(n: INTEGER): INTEGER
	do
		random_sequence.forth
		Result := random_sequence.item \\ n -- from 0 to n - 1
	end
end
