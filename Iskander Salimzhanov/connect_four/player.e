note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER
create
	fill_in
feature {NONE}
	fill_in(a_name: STRING; a_color: INTEGER)
		do
			set_name(a_name)
			set_color(a_color)
		end
feature
	color: INTEGER
	name: STRING
feature
	set_name(a_name: STRING)
	do
		name := a_name
	end
	set_color(a_color: INTEGER)
	require
		valid_color: a_color /= 0;
	do
		color := a_color
	end
end
