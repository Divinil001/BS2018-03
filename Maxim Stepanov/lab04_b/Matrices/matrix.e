note
	description: "Summary description for {MATRIX}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX

create
	make

feature

	arr: ARRAY2 [REAL]

	width: INTEGER

	height: INTEGER

	make (w: INTEGER h: INTEGER)
		do
			create arr.make_filled (0, h, w)
			width := w
			height := h
		end

	set (x: INTEGER y: INTEGER v: REAL)
		do
			arr [x, y] := v
		end

	add (m: MATRIX): MATRIX
		require
			same_width: width = m.width
			same_height: height = m.height
		local
			res: MATRIX
			x, y: INTEGER
		do
			create res.make (width, height)
			from
				x := 0
			until
				x >= width
			loop
				from
					y := 0
				until
					y >= height
				loop
					res.set (x, y, arr [x, y] + m.arr [x, y])
					y := y + 1
				end
				x := x + 1
			end
			Result := res
		end

	sub (m: MATRIX): MATRIX
		require
			same_width: width = m.width
			same_height: height = m.height
		local
			res: MATRIX
			x, y: INTEGER
		do
			create res.make (width, height)
			from
				x := 0
			until
				x >= width
			loop
				from
					y := 0
				until
					y >= height
				loop
					res.set (x, y, arr [x, y] - m.arr [x, y])
					y := y + 1
				end
				x := x + 1
			end
			Result := res
		end

	mul (m: MATRIX): MATRIX
		require
			same_dimension: width = m.height
		local
			res: MATRIX
			dim: INTEGER
			other_dim: INTEGER
			x, y, i: INTEGER
		do
			dim := width;
			other_dim := height;
			create res.make (dim, dim)
			from
				x := 0
			until
				x >= dim
			loop
				from
					y := 0
				until
					y >= dim
				loop
					from
						i := 0
					until
						i >= other_dim
					loop
						res.set (x, y, arr [i, y] * m.arr [x, i])
						i := i + 1
					end
					y := y + 1
				end
				x := x + 1
			end
			Result := res
		end

	det: REAL
		require
			is_square: width = height
		local
			res: REAL
			mat: MATRIX
			mult: INTEGER
			x, this_i, i, y: INTEGER
		do
			res := 0
			from
				x := 0
			until
				x >= width
			loop
				create mat.make (height - 1, width - 1)
				from
					this_i := 0
					i := 0
				until
					this_i >= width
				loop
					if this_i /= x then
						from
							y := 1
						until
							y >= height
						loop
							mat.set (i, y, arr [this_i, y])
							y := y + 1
						end
						i := i + 1
					end
					this_i := this_i + 1
				end
				if x \\ 2 = 1 then
					mult := -1
				else
					mult := 1
				end
				res := res + x * mult * mat.det()
				x := x + 1
			end
			Result := res
		end

end
