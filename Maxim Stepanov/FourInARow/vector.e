note
	description: "Summary description for {VECTOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR

create
	make

feature

	x, y: INTEGER

	make (a_x: INTEGER a_y: INTEGER)
		do
			x := a_x
			y := a_y
		end

	mclone: VECTOR
	local
		v: VECTOR
	do
		create v.make(x, y)
		Result := v
	end

	add (v: VECTOR)
		do
			x := x + v.x
			y := y + v.y
		end

end
