class
	CELL_INFO
create make

feature
	make (chr : CHARACTER)
	do
		value := chr
		number_copies := 1
	end

feature
	value : CHARACTER
	number_copies : INTEGER

	add_chr(n : INTEGER)
	require
		is_natural : n > 0
	do
		number_copies := number_copies + n
	end

	remove_chr(n:INTEGER)
	require
		is_natural : n > 0
	do
		if n > number_copies then
			number_copies := 0
		else
			number_copies := number_copies - n
		end
	end
invariant
	number_of_copies_is_natural: number_copies >= 0
end
