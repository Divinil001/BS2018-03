
class
	BOARD
create
	make
feature
	make(a_m, a_n: INTEGER)
		do
			create matrix.make_filled (0, a_m, a_n)
			m := a_m
			n := a_n
		end

feature
	drop_check(i: INTEGER; player: INTEGER)
		local
			tmp_j: INTEGER
		do
			tmp_j := find_tmp_j(i)
			if tmp_j = -1 then
				print("There is no place!")
			else
				matrix[tmp_j, i] := player
			end
		end
feature
	find_tmp_j(an_i: INTEGER): INTEGER
		local
			k: INTEGER
		do
			Result := -1
			from
				k:= 1
			until
				k = m + 1
			loop
				if matrix[k, an_i] = 0 then
					Result := k
--					print("sss")
				end
				k:=k+1
			end
		end
feature
	m: INTEGER
	n: INTEGER
	matrix: ARRAY2[INTEGER]

	is_have_place: BOOLEAN
		do
			Result := matrix.full
		end

	print_matrix
		local
			I: INTEGER
			J: INTEGER
		do
			From
				i:= 1
			Until
				i > m
			Loop
				From
					j:=1
				Until
					J > n
				Loop
					print(matrix.item (I, J))
					J:=j+1
				End
				print("%N")
				I:=I+1
			End
		end

	parser: BOOLEAN
		local
			I: INTEGER
			J: INTEGER
			Cnt: INTEGER
			tmp: INTEGER
			tmp_i: INTEGER
			tmp_j: INTEGER
		do
			cnt := 0
			tmp := 2
			From
				i:= 1
			Until
				i = m + 1
			Loop
				From
					j:=1
				Until
					J = n + 1
				Loop
--					print(i.out +" "+ j.out +"    ")
					if cnt = 4 then
						Result := true
					end

					if matrix[i,j] = tmp then
						cnt := cnt + 1
					else
						cnt := 0
						if matrix[i,j] = 0
						then
							tmp := 2
						else
							tmp := matrix[i,j]
							cnt := 1
						end
					end
					J:=j+1
				End
				if cnt = 4 then
					Result := true
				end
				cnt := 0
				tmp := 2
				I:=i+1
			End
--			print("SOME%N")
			--------------------------------------------------------
			tmp := 2
			cnt := 0
			From
				j:=1
			Until
				J = n + 1
			Loop
				From
					i:= 1
				Until
					I = m + 1
				Loop
--					print(i.out  +" "+  j.out +" "+ cnt.out + " " + tmp.out+"     " )
					if cnt = 4 then
						Result := true
					end

					if matrix[i, j] = tmp then
						cnt := cnt + 1
					else
						cnt := 0
						if matrix[i, j] = 0 then
							tmp := 2
						else
							tmp := matrix[i, j]
							cnt := 1
						end
					end
					I:=i+1
				End
				if cnt = 4 then
					Result := true
				end
				cnt := 0
				tmp := 2
				J:=j+1
			End
--			print("SOME%N")
			--------------------------------------------------------------
			tmp := 2
			cnt := 0
			From
				i:= 1
			Until
				i > m
			Loop
				From
					j:=1
					tmp_i:=i
				Until
					J > n or tmp_i > m
				Loop
--					print(tmp_i.out  +" "+  j.out +" "+ cnt.out + " " + tmp.out+"     " )
					if cnt = 4 then
						Result := true
					end

					if matrix[tmp_i, j] = tmp then
						cnt := cnt + 1
					else
						cnt := 0
						if matrix[tmp_i, j] = 0 then
							tmp := 2
						else
							tmp := matrix[tmp_i, j]
							cnt := 1
						end
					end
					J:=j+1
					tmp_i:=tmp_i+1
				End
				if cnt = 4 then
					Result := true
				end
				cnt := 0
				tmp := 2
				I:=i+1
			End
			--------------------------------------------------------------
			tmp := 2
			cnt := 0
			From
				j:= 1
			Until
				J > n
			Loop
				From
					i:=1
					tmp_j:=j
				Until
					I > m or tmp_j > n
				Loop
--					print(tmp_i.out  +" "+  j.out +" "+ cnt.out + " " + tmp.out+"     " )
					if cnt = 4 then
						Result := true
					end

					if matrix[tmp_j, i] = tmp then
						cnt := cnt + 1
					else
						cnt := 0
						if matrix[tmp_j, i] = 0 then
							tmp := 2
						else
							tmp := matrix[tmp_j, i]
							cnt := 1
						end
					end
					i:=i+1
					tmp_j:=tmp_j+1
				End
				if cnt = 4 then
					Result := true
				end
				cnt := 0
				tmp := 2
				j:=j+1
			End
			--------------------------------------------------------------
			tmp := 2
			cnt := 0
			From
				i:= 1
			Until
				i > m
			Loop
				From
					j:= n
					tmp_i:= i
				Until
					J < 1 or tmp_i > m
				Loop
--					print(tmp_i.out  +" "+  j.out +" "+ cnt.out + " " + tmp.out+"     " )
					if cnt = 4 then
						Result := true
					end

					if matrix[tmp_i, j] = tmp then
						cnt := cnt + 1
					else
						cnt := 0
						if matrix[tmp_i, j] = 0 then
							tmp := 2
						else
							tmp := matrix[tmp_i, j]
							cnt := 1
						end
					end
					J:=j-1
					tmp_i:=tmp_i+1
				End
				if cnt = 4 then
					Result := true
				end
				cnt := 0
				tmp := 2
				I:=i+1
			End
			--------------------------------------------------------------
			tmp := 2
			cnt := 0
			From
				j:= n
			Until
				J < 1
			Loop
				From
					i:=1
					tmp_j:=j
				Until
					I > m or tmp_j < 1
				Loop
--					print(tmp_i.out  +" "+  j.out +" "+ cnt.out + " " + tmp.out+"     " )
					if cnt = 4 then
						Result := true
					end

					if matrix[tmp_j, i] = tmp then
						cnt := cnt + 1
					else
						cnt := 0
						if matrix[tmp_j, i] = 0 then
							tmp := 2
						else
							tmp := matrix[tmp_j, i]
							cnt := 1
						end
					end
					i:=i+1
					tmp_j:=tmp_j-1
				End
				if cnt = 4 then
					Result := true
				end
				cnt := 0
				tmp := 2
				j:=j-1
			End
		end

end
