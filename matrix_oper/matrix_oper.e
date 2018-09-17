class
	MATRIX_OPER

create
	make

feature {NONE}

	make

		do
		end

	add(ar1_, ar2_ : ARRAY2[INTEGER]): ARRAY2[INTEGER]
	require
		similiar: same(ar1_, ar2_)
		local
			i, j : INTEGER
		do
			from
				i := 1
			until
				i > ar1_.height
			loop
				from
					j := 1
				until
					j > ar1_.width
				loop
					ar1_[i, j] := ar1_[i , j] + ar2_[i, j]
					j := j + 1
				end
				i := i + 1
			end
			Result := ar1_
		end

	same (a1, a2 : ARRAY2[INTEGER]): BOOLEAN
		local
			i, j : INTEGER
		do
			Result := True
			if a1.height /= a2.height or a1.width /= a2.width then
				Result := False
			end
		end

	minus(ar1_, ar2_ : ARRAY2[INTEGER]): ARRAY2[INTEGER]
	require
		similiar: same(ar1_, ar2_)
		local
			i, j : INTEGER
		do
			from
				i := 1
			until
				i > ar1_.height
			loop
				from
					j := 1
				until
					j > ar1_.width
				loop
					ar1_[i, j] := ar1_[i, j] - ar2_[i, j]
					j := j + 1
				end
				i := i + 1
			end
			Result := ar1_
		end
	prod_check(a1, a2: ARRAY2[INTEGER]): BOOLEAN
	local
		i, j: INTEGER
	do
		Result := False
		if
			a1.height = a2.width
		then
			Result := True
		end
	end
	prod(a1, a2: ARRAY2[INTEGER]): ARRAY2[INTEGER]
	require
		not_right_size: prod_check(a1, a2)
	local
		i, j, k: INTEGER
		b : ARRAY2[INTEGER]
		do
			create b.make_filled(0,a1.height, a2.width)
			from
				i := 1
			until
				i > a1.height
			loop
				from
					j := 1
				until
					j > a2.width
				loop
					from
						k:= 1
					until
						k > a1.width
					loop
						b[i, j] := a1[i, k] * a2[k, j]
						k := k + 1
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := b
		end
	det(a : ARRAY2[INTEGER]): INTEGER
	local
		res : ARRAY2[INTEGER]
		i, j, k: INTEGER
		break: BOOLEAN
		do
			if a.height = 2 and a.width = 2 then
				Result := a[0,0]*a[1,1] - a[1,0]*a[0,1]
			else
				create res.make_filled (0, a.height - 1, a.height - 1)
				from
					k := 1
				until
					k > a.width
				loop
					from
						i := 2
					until
						i > a.width
					loop
						break := False
						from
							j := 1
						until
							j > a.width
						loop
							if
								k = j
							then
								break := true
							else
								if break then
									res[i-1, j-1] := a[i, j]
								else
									res[i-1, j] := a[i, j]
								end
							end
							j := j + 1
						end
						i := i + 1
					end
					Result := Result + ((-1)^(k+1)).floor*a[1, k]*det(res)
					k := k + 1
				end
				Result := 0
			end
		end
end
