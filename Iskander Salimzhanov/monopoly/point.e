note
	description: "Summary description for {POINT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	POINT
create
	make

feature
	make(a_player: PLAYER; a_location: INTEGER)
	do
		set_player(a_player)
		set_location(a_location)
	end

feature {NONE}
	player: PLAYER
	location: INTEGER

feature {POINT, BOARD}
	set_player(a_player: PLAYER)
	do
		player := a_player
	ensure
		set_operation_was_succesful: player = a_player
	end

	set_location(a_location: INTEGER)
	do
		location := a_location
	ensure
		set_operation_was_succesful: location = a_location
	end

feature {ANY}
	get_player: PLAYER
	do
		Result := player
	ensure
		get_operation_was_succesful: Result = player
	end

	get_location: INTEGER
	do
		Result := location
	ensure
		get_operation_was_succesful: Result = location
	end
end
