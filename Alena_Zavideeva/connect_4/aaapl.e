class
	AAAPL

create
	make

feature
	n, m : INTEGER_32
	win1, win2, win : BOOLEAN
	no_spaces : BOOLEAN
	a : ARRAY2[INTEGER]
	i, j : INTEGER
	counter : INTEGER
	make

		do
			counter := 0
			win := FALSE
			no_spaces := FALSE
			create a.make_filled(0,1,1)

			create_a
			table

			from
			until
				no_spaces or win
			loop
				move1
				table
				if not win and not no_spaces  then
					move2
					table
				end
			end

			if win then
				if
					win1
				then
					Io.put_string ("Win 1")
				else
					Io.put_string ("Win 2")
				end
			else
				Io.put_string ("Draw")
			end

		end

	create_a
	--|CREATE FIELD
	do
		Io.put_string ("Column: ")
		Io.read_integer
		n := Io.last_integer

		Io.put_string ("Row: ")
		Io.read_integer
		m := Io.last_integer

		if
			n >= 4 and m >= 4
		then
			a.make_filled(0, n, m)
		else
			Io.put_string ("Your field is too small%N")
			create_a
		end
	end
	table
	 --| TABLE
	do
		from
			i := 1
		until
			i > n
		loop
			from
				j := 1
			until
				j > m
			loop
				Io.put_string (a[i, j].out + " ")
				j := j + 1
			end

			i := i + 1
			Io.put_string ("%N")
		end
	end

	move1
	local
		step : INTEGER
		break : BOOLEAN
	do
		Io.put_string ("Player one choose column: ")
		Io.read_integer
		step := Io.last_integer
		if step > m then
			Io.put_string ("You can't do this %N")
			move1
		else
			break:= FALSE
			from
				j := n
			until
				j < 1 or break
			loop
				if
					a[j, step] = 0
				then
					a[j, step] := 1
					counter := counter + 1
					break := TRUE
				end
				j := j - 1
			end

			if not break then
				Io.put_string("YOU CAN'T DO THIS!!! NOT FAIR!!!%N")
				move1
			end
			--  or check_col = 1 or check_diag1 = 1 or diag2 = 1
			if check_row = 1 or check_col = 1 or check_diag1 = 1 then
				win := TRUE
				win1 := TRUE
			else

				if counter = n * m then
					no_spaces := TRUE
				end

			end
		end

	end

	move2
	local
		step : INTEGER
		break : BOOLEAN
	do
		Io.put_string ("Player second choose column: ")
		Io.read_integer
		step := Io.last_integer
		if step > m then
			Io.put_string ("You can't do this %N")
			move2
		else
			break:= FALSE
			from
				j := n
			until
				j < 1 or break
			loop
				if
					a[j, step] = 0
				then
					a[j, step] := 2
					counter := counter + 1
					break := TRUE
				end
				j := j - 1
			end

			if not break then
				Io.put_string("YOU CAN'T DO THIS!!! NOT FAIR!!!%N")
				move2
			end
			-- or check_col = 2 or check_diag1 = 2 or diag2 = 2
			if check_row = 2 or check_col = 2 or check_diag1 = 2 then
				win := TRUE
				win2 := TRUE
			else

				if counter = n * m then
					no_spaces := TRUE
				end

			end
		end

	end

feature

	-- 1 - win 1
	-- 2 - win 2
	-- 0 - nobody

	check_row : INTEGER

	local
		check1, check2 : INTEGER
		break: BOOLEAN
	do
		Result:= 0
		from
			i := 1
			break := FALSE
		until
			i > n or break
		loop
			from
				j := 1
			until
				j > m - 1 or break
			loop
				if (a[i, j] = a[i, j + 1])then
					if a[i, j] = 1 then
						check1 := check1 + 1
					elseif a[i,j] = 2 then
						check2 := check2 + 1
					end
				else
					if a[i, j] = 1 then
						check1 := 1
						check2 := 0
					elseif a[i, j] = 2 then
						check2 := 1
						check1 := 0
					elseif a[i, j] = 0 then
						check1 := 0
						check2 := 0
					end
				end
				j := j + 1
				if check1 = 3 then
						break := TRUE
						win1:= True
						win := True
						Result := 1
					elseif check2 = 3 then
						break := True
						win2 := true
						win := True
						Result := 2
					end
			end
			i := i + 1
			check1 := 0
			check2 := 0
		end
	end

	check_col:INTEGER
	local
		check1, check2 : INTEGER
		break: BOOLEAN
	do
		Result:= 0
		from
			j := 1
			break := FALSE
		until
			j > m or break
		loop
			from
				i := 1
			until
				i > n - 1  or break
			loop
					if (a[i, j] = a[i + 1, j])then
							if a[i, j] = 1 then
								check1 := check1 + 1
								check2 := 0
							elseif a[i,j] = 2 then
								check2 := check2 + 1
								check1 := 0
							end
					else
							if a[i, j] = 1 then
								check1 := 1
								check2 := 0
							elseif a[i, j] = 2 then
								check2 := 1
								check1 := 0
							elseif a[i, j] = 0 then
								check1 := 0
								check2 := 0
							end
					end
				i := i + 1
					if check1 = 3 then
						break := TRUE
						win1:= True
						win := True
						Result := 1
					elseif check2 = 3 then
						break := True
						win2 := true
						win := True
						Result := 2
					end
				end
			j := j + 1
			check1 := 0
			check2 := 0
		end
		--end
	end

	check_diag1:INTEGER

	local
		check1, check2 : INTEGER
		break: BOOLEAN
	do
		Result:= 0
		break := FALSE
		from
			i := 0
			break := FALSE
		until
			break or i > n
		loop
			from
				j := 1
			until
				break or j > m
			loop
				if (i + j + 1 < n+1 and j + 1 < m+1) then
					if a[i+j, j] = a[i+j+1, j + 1] then
						if
							a[i+j, j] = 1
						then
							check1 := check1 + 1
							check2 := 0
						elseif
							a[i+j, j] = 2
						then
							check2 := check2 + 1
							check1 := 0
						else
							check1 := 0
							check2 := 0
						end
					else
						if
							a[i+j, j] = 1
						then
							check1 := 1
							check2 := 0
						elseif
							a[i+j, j] = 2
						then
							check2 := 1
							check1 := 0
						else
							check1 := 0
							check2 := 0
						end
					end
				end
				j := j + 1
				if check1 = 3 then
						break := TRUE
						win1:= True
						win := True
						Result := 1
					elseif check2 = 3 then
						break := True
						win2 := true
						win := True
						Result := 2
				end
			end
			i := i + 1
		end

		check1 := 0
		check2 := 0
		from
			i := 1
			break := FALSE
		until
			break or i > m
		loop
			from
				j := 1
			until
				break or j > n
			loop
				if (i + j + 1 < m + 1 and j + 1 < n + 1) then
					if a[j, j + i] = a[j + 1, i + j + 1] then
						if
							a[j, j + i] = 1
						then
							check1 := check1 + 1
							check2 := 0
						elseif
							a[j, j + i] = 2

						then
							check2 := check2 + 1
							check1 := 0
						else
							check1 := 0
							check2 := 0
						end
					else
						if
							a[j, j + i] = 1
							then
								check1 := 1
								check2 := 0
						elseif
							a[j, j + i] = 2
							then
								check2 := 1
								check1 := 0
						else
							check1 := 0
							check2 := 0
						end
					end
				end
				j := j + 1
				if check1 = 3 then
						break := TRUE
						win1:= True
						win := True
						Result := 1
					elseif check2 = 3 then
						break := True
						win2 := true
						win := True
						Result := 2
					end
			end
			i := i + 1
			check1 := 0
			check2 := 0
		end

end
end
