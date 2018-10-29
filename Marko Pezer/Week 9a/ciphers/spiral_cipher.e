class
	SPIRAL_CIPHER

inherit
	UNKEYED_CIPHER

feature

feature

	encrypt (m: STRING): STRING
	local
		mat: ARRAY2[STRING]
		i, j, msize, sb, eb, d: INTEGER
	do
		msize := get_size (m.count)
		create mat.make_filled ("", msize, msize)

		from i := 0
		until i > m.count - 1
		loop
			mat[i // msize + 1, i \\ msize + 1] := m[i + 1].out
			i := i + 1
		end

		sb := 0
		eb := 0
		d := mat.height
		Result := ""

		from
		until sb + 1 > d - eb
		loop

			from i := 1 + sb
			until i > d - eb
			loop
				Result.append (mat[i, d - eb])
				i := i + 1
			end

			eb := eb + 1

			from j := d - eb
			until j < sb + 1
			loop
				Result.append (mat[d - sb, j])
				j := j - 1
			end

			from i := d - eb
			until i < sb + 1
			loop
				Result.append (mat[i, sb + 1])
				i := i - 1
			end

			sb := sb + 1

			from j := 1 + sb
			until j > d - eb
			loop
				Result.append (mat[sb, j])
				j := j + 1
			end
		end
	end

	decrypt(m: STRING): STRING
	local
		msize, i, j, sb, eb, dm, es, mcount, d: INTEGER
		mat: ARRAY2[STRING]
		nmat: ARRAY2[INTEGER]
	do
		mcount := 1
		d := 1

		msize := get_size (m.count)
		create nmat.make_filled (0, msize, msize)
		create mat.make_filled ("", msize, msize)

		from i := 1
		until i > msize
		loop
			from j := 1
			until j > msize loop
				nmat[i, j] := d
				d := d + 1
				j := j + 1
			end
			i := i + 1
		end

		es := msize - (msize * msize - m.count)
		sb := 0
		eb := 0
		dm := mat.height
		Result := ""

		from
		until sb + 1 > dm - eb
		loop

			from i := 1 + sb
			until i > dm - eb
			loop
				if nmat[i, dm - eb] <= m.count then
					mat[i, dm - eb] := m[mcount].out
					mcount := mcount + 1
				end
				i := i + 1
			end

			eb := eb + 1

			from j := dm - eb
			until j < sb + 1
			loop
				if nmat[dm - sb, j] <= m.count then
					mat[dm - sb, j] := m[mcount].out
					mcount := mcount + 1
				end
				j := j - 1
			end

			from i := dm - eb
			until i < sb + 1
			loop
				if nmat[i, sb + 1] <= m.count then
					mat[i, sb + 1] := m[mcount].out
					mcount := mcount + 1
				end
				i := i - 1
			end

			sb := sb + 1

			from j := 1 + sb
			until j > dm - eb
			loop
				if nmat[sb, j] <= m.count then
					mat[sb, j] := m[mcount].out
					mcount := mcount + 1
				end
				j := j + 1
			end
		end

		from i := 1
		until i > dm
		loop
			from j := 1
			until j > dm
			loop
				result.append (mat[i, j].out)
				j := j + 1
			end
			i := i + 1
		end

	end

	get_size (x: INTEGER): INTEGER
	do
		from Result := 1
		until Result * Result >= x
		loop
			Result := Result + 1
		end
	end

end
