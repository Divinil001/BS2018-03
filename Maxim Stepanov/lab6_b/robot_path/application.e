note
	description: "robot_path application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature

	r: INTEGER

	c: INTEGER

	field: ARRAY2 [INTEGER]

	completed: BOOLEAN

	make
		do
			completed := false
			r := 4
			c := 4
			create field.make_filled (0, r, c)

				-- initialize some cells
			field [3, 1] := 1
			if field [1, 1] /= 1 then
				mcheck (1, 1)
			end
		end

	mcheck (x: INTEGER y: INTEGER)
		require
			x >= 1
			y >= 1
			x <= c
			y <= r
		do
			if not completed then
				if x = c and y = r then
					print ("Destination reached!%N")
					completed := true
				else
					if x < c and field [x + 1, y] /= 1 then
						mcheck (x + 1, y)
					end
					if y < r and field [x, y + 1] /= 1 then
						mcheck (x, y + 1)
					end
				end
			end
		end
end
