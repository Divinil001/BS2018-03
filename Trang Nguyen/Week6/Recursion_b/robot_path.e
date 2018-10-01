-- NOT TESTED
class
	ROBOT_PATH

feature -- Access
	find_path
			-- If path is possible, change path-point in grid to 2
		local
			i: INTEGER
		do
			create path.make (0)
			if is_possible (row, col) then
				from i := 1
				until i > path.count
				loop
					grid.i_th (path.i_th (i).i_th (1)).i_th (path.i_th (i).i_th (2)) := 2
					i := i + 1
				end
			end
		end

	is_possible (r, c: INTEGER): BOOLEAN
			-- Can move to destination or not
		local
			point: ARRAYED_LIST [INTEGER]
		do
			create point.make (0)
			point.extend (r)
			point.extend (c)
			if c < 1 or r < 1 then
				Result := False
			elseif grid.i_th (r).i_th (c) = 0 then
				-- point (r, c) is "off limit"
				Result := False
			elseif r = 1 and c = 1  or is_possible (r - 1, c) or is_possible (r, c - 1) then
				path.extend (point)
				Result := True
			end
		end

	col: INTEGER
			-- number of columns

	row: INTEGER
			-- number of rows

	grid, path: ARRAYED_LIST [ARRAYED_LIST [INTEGER]]
			-- grid: 0 if is "off limit", 1 if can move, 2 if is the way
			-- path: save point (row, col) of the way if possible

end
