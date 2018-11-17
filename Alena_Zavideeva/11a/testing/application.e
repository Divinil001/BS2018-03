class
	APPLICATION

create
	make

feature

	a: ARRAY [INTEGER]

	n: INTEGER

	make
		local
			i: INTEGER
		do
			create a.make_empty
		end

	add_event (time: INTEGER)
		require
			not_negative: time >= 0
		local
			i, j: INTEGER
			b: ARRAY [INTEGER]
			tmp : INTEGER
		do
			if not the_same (time) then
				a.force (time, a.count + 1)
				from
					i := 1
				until
					i > a.count
				loop
					from
						j := i + 1
					until
						j > a.count
					loop
						if a[i] > a[j] then
							tmp := a[j]
							a[j] := a[i]
							a[i] := tmp
						end
						j := j + 1
					end
					i := i + 1
				end
			end
		end

	remove_event: INTEGER
		require
			any_el: a.count > 0
		do
			Result := a [a.count]
			a.remove_tail (1)
		end

	the_same (event: INTEGER): BOOLEAN
		local
			i: INTEGER
		do
			Result := False
			from
				i := 1
			until
				i > a.count or Result
			loop
				if event = a [i] then
					Result := True
				end
				i := i + 1
			end
		end

end
