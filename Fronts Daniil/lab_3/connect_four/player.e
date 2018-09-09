note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	make

feature
	player_num : INTEGER
	map : MAP

feature
	make(new_player_num: INTEGER; new_map : MAP)
	do
		map := new_map
		player_num := new_player_num
	end

feature
	turn : ARRAY[INTEGER]
	local
		turn_i : INTEGER
		turn_j : INTEGER
		done : BOOLEAN
		res : ARRAY[INTEGER]
	do
		create res.make_empty
		Result := res
		from
			done := False
		until
			done = True
		loop
			print("COLUMN:")
			io.read_integer
			turn_j := io.last_integer
			print("%N")
			turn_i := map.check_column(turn_j)
			if turn_i /= 0 then
				map.change (turn_i, turn_j, player_num)
				done := True
				res.force (turn_i, 1)
				res.force (turn_j, 2)
				Result := res
			end
			map.printable
		end
	end
end
