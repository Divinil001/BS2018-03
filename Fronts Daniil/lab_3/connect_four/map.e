note
	description: "Summary description for {MAP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MAP

create
	make

feature
	n : INTEGER
	m : INTEGER
	map: ARRAY[ARRAY[INTEGER]]
	i : INTEGER
	j : INTEGER
	row : ARRAY[INTEGER]

feature
	check_winner(win_i: INTEGER; win_j: INTEGER; p_num: INTEGER) : BOOLEAN
	local
		win : BOOLEAN
	do
		win := check_row_win(win_i, p_num)
		if win /= True then
			win := check_column_win(win_j, p_num)
		end
		if win /= True then
			win := check_diagonal_win(win_i, win_j, p_num)
		end
		Result := win
	end

	check_column_win(column_j: INTEGER; p_num: INTEGER) : BOOLEAN
	local
		counter : INTEGER
		win : BOOLEAN
	do
		win := False
		counter := 0
		from
			i := 1
		until
			i = n + 1
		loop
			row := map[i]
			if row[column_j] = p_num then
				counter := counter + 1
				if counter = 4 then
					win := True
				end
			else
				counter := 0
			end
			i := i + 1
		end
		Result := win
	end

	check_row_win(row_i: INTEGER; p_num: INTEGER) : BOOLEAN
	local
		counter : INTEGER
		win : BOOLEAN
	do
		row := map[row_i]
		win := False
		counter := 0
		from
			j := 1
		until
			j = m + 1
		loop
			if row[j] = p_num then
				counter := counter + 1
				if counter = 4 then
					win := True
				end
			else
				counter := 0
			end
			j := j + 1
		end
		Result := win
	end

	check_diagonal_win(diag_i: INTEGER; diag_j: INTEGER; p_num: INTEGER) : BOOLEAN
	local
		tmp : ARRAY[INTEGER]
		counter : INTEGER
		win : BOOLEAN
	do
		counter := 0
		win := False
		from
			i := diag_i
			j := diag_j
		until
			i = 1 or j = 1
		loop
			i := i - 1
			j := j - 1
		end
		from
			i := i
			j := j
		until
			(i = n + 1) or (j = n + 1)
		loop
			row := map[i]
			if  row[j] = p_num then
				counter := counter + 1
				if counter = 4 then
					win := True
				end
			else
				counter := 0
			end
			i := i + 1
			j := j + 1
		end
		--print("From_left%N")
		if win /= True then
			counter := 0
			from
				i := diag_i
				j := diag_j
			until
				(i = 1)  or j = m
			loop
				i := i - 1
				j := j + 1
			end
			--print("SET TO " + i.out + " " + j.out + "%N")
			from
				i := i
				j := j
			until
				(i = n + 1) or (j = 0)
			loop
				--print(i.out + " " + j.out + "%N")
				row := map[i]
				if  row[j] = p_num then
					counter := counter + 1
					if counter = 4 then
						win := True
					end
				else
					counter := 0
				end
				i := i + 1
				j := j - 1
			end
		end
		Result := win
	end

	printable
	do
		from
			i := 1
		until
			i = n + 1
		loop
			row := map[i]
			from
				j := 1
			until
				j = m + 1
			loop
				print(row[j].out + " ")
				j := j + 1
			end
			print("%N")
			i := i + 1
		end
	end

	change(i_c: INTEGER; j_c: INTEGER; new_num: INTEGER)
	do
		row := map[i_c]
		row.put (new_num, j_c)
	end

	check_column(check_j: INTEGER) : INTEGER
	local
		c : BOOLEAN
		check_i : INTEGER
	do
		c := False
		Result := 0
		from
			check_i := n
		until
			check_i = 0
		loop
			row := map[check_i]
			if row[check_j] = 0 and c = False then
				c := True
				Result := check_i
			end
			check_i := check_i - 1
		end
	end

feature
	make(new_n: INTEGER; new_m: INTEGER)
	do
		n := new_n
		m := new_m
		if n < 4 then
			n := 4
		end
		if m < 4 then
			m := 4
		end
		create map.make_empty
		create row.make_empty
		from
			i := 1
		until
			i = n + 1
		loop
			create row.make_empty
			from
				j := 1
			until
				j = m + 1
			loop
				row.force(0, j)
				j := j + 1
			end
			map.force (row, i)
			i := i + 1
		end
	end
end
