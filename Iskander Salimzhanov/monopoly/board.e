note
	description: "Summary description for {BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD
create
	make

feature {NONE}
	fields: ARRAYED_LIST [FIELD]
	players: ARRAYED_LIST [POINT]

	set_fields(a_fields: ARRAYED_LIST [FIELD])
	do
		fields := a_fields
	ensure
		fields.is_equal (a_fields)
	end

	set_players(a_players: ARRAYED_LIST [POINT])
	do
		players := a_players
	ensure
		players.is_equal (a_players)
	end

feature
	make
	local
		a_fields: ARRAYED_LIST [FIELD]
		a_players: ARRAYED_LIST [POINT]
	do
		create a_fields.make (0)
		create a_players.make (0)

		set_fields(a_fields)
		set_players(a_players)
	end

feature {ANY}
	in_fields(a_field: FIELD): BOOLEAN
	local
		i: INTEGER
	do
		Result := false
		from
			i := 1
		until
			i > fields.count or not Result
		loop
			if fields.i_th (i).is_equal(a_field) then
				Result := true
			end
			i := i + 1
		end
	end

	in_players(a_player: player): BOOLEAN
	local
		i: INTEGER
	do
		Result := false
		from
			i := 1
		until
			i > players.count or not Result
		loop
			if players.i_th (i).get_player.is_equal(a_player) then
				Result := true
			end
			i := i + 1
		end
	end

	get_players: ARRAYED_LIST [POINT]
	do
		Result := players
	end

	get_fields: ARRAYED_LIST [FIELD]
	do
		Result := fields
	end

feature {ANY}
	game_over: BOOLEAN
	require
		valid_board: current.get_players.count >= 1
	local
		cnt: INTEGER
		i : INTEGER
	do
		from
			i := 1
		until
			i > players.count
		loop
			if players.i_th (i).get_player.is_bankrupt then
				cnt := cnt + 1
			end
			i := i + 1
		end
		Result := cnt = 1
	end

	add_field(a_field: FIELD)
	require
		unique_field: not current.in_fields(a_field)
	do
		fields.extend (a_field)
	ensure
		field_was_added: fields.count = old fields.count + 1 and not current.in_fields(a_field)
	end

	remove_field(a_field: FIELD)
	require
		valid_remove: current.in_fields(a_field)
	local
		new_fields: ARRAYED_LIST [FIELD]
		i: INTEGER
	do
		create new_fields.make (0)
		from
			i := 1
		until
			i > fields.count
		loop
			if not fields.i_th (i).is_equal(a_field) then
				new_fields.extend (fields.i_th (i))
			end
			i := i + 1
		end
		set_fields(new_fields)
	ensure
		remove_was_succesful: fields.count = old fields.count - 1 and not current.in_fields(a_field)
	end

	vanish_fields
	do
		from
		until
			fields.is_empty
		loop
			fields.remove
		end
	ensure
		was_vanished: fields.is_empty
	end

	add_player(a_player: PLAYER)
	require
		unique_player: not current.in_players(a_player)
	local
		a_point: POINT
	do
		create a_point.make (a_player, 0)
		players.extend (a_point)
	ensure
		player_was_added: players.count = old players.count + 1 and not current.in_players(a_player)
	end

	remove_player(a_player: PLAYER)
	require
		valid_remove: current.in_players(a_player)
	local
		new_players: ARRAYED_LIST [POINT]
		i: INTEGER
	do
		create new_players.make (0)
		from
			i := 1
		until
			i > players.count
		loop
			if not players.i_th (i).get_player.is_equal(a_player) then
				new_players.extend (players.i_th (i))
			end
			i := i + 1
		end
		set_players(new_players)
	ensure
		remove_was_succesful: players.count = old players.count - 1 and not current.in_players(a_player)
	end

	vanish_players
	do
		from
		until
			players.is_empty
		loop
			players.remove
		end
	ensure
		was_vanished: players.is_empty
	end

feature {ANY}
	shaffle: INTEGER
	local
		random_seq: RANDOM
	do
		create random_seq.make
		random_seq.forth
		Result := random_seq.item \\ 6 + 1
	end

	step
	require
		valid_board: current.get_fields.count >= 1 and current.get_players.count >= 1
	local
		i: INTEGER
		x: INTEGER
		new_location: INTEGER
	do
		from
			i := 1
		until
			i > players.count
		loop
			x := shaffle + shaffle
			new_location := (players.i_th (i).get_location + x) // fields.count + 1
			players.i_th (i).set_location (new_location)
			fields.i_th (new_location).act(players.i_th (i).get_player)
			i := i + 1
		end
	end
end
