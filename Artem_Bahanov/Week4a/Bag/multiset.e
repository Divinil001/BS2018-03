class
	MULTISET
	create make

	feature
		elements: ARRAYED_LIST[CELL_INFO]
	feature
		make
		local
			element: CELL_INFO
			i: INTEGER
		do
			create elements.make(0)
			from
				i := 0
			until
				i >= 128
			loop
				create element.make (i.to_character_8)
				elements.extend (element)
				i := i + 1
			end
		end


	feature
		add(val: CHARACTER n: INTEGER)
		do
			elements.at (val.code + 1).add_number_copies (n)
		end

		remove(val: CHARACTER n: INTEGER)
		do
			elements.at (val.code + 1).add_number_copies (-n)
		end

		min: CHARACTER
		local
			i: INTEGER
			done: BOOLEAN
		do
			from
				done := False
				i := 1
			until
				i > 128 or done
			loop
				if elements.at (i).number_copies > 0 then
					Result := elements.at (i).value
					done := True
				end
				i := i + 1
			end
		end

		max: CHARACTER
			local
				i: INTEGER
				done: BOOLEAN
			do
				from
					done := False
					i := 128
				until
					i < 1 or done
				loop
					if elements.at (i).number_copies > 0 then
						Result := elements.at (i).value
						done := True
					end
					i := i - 1
				end
			end

		is_equal_bag(b: MULTISET): BOOLEAN
		local
			i: INTEGER
		do
			Result := True
			from
				i := 1
			until
				i > 128 or not Result
			loop
				if elements.at (i).number_copies /~ b.elements.at (i).number_copies then
					Result := False
				end
				i := i + 1
			end
		end

		to_string: STRING
		do
			Result := "{"
			across elements as it
			loop
				if it.item.number_copies > 0 then
					Result.append (" (" + it.item.value.out + ", " + it.item.number_copies.out + ") ")
				end
			end
			Result.append ("}%N")
		end
end
