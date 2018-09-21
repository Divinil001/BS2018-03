note
	description: "RANGE_OF_NUMBERS application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	RANGE_OF_NUMBERS

inherit
	ARGUMENTS

create
	make

create
	init

feature
	l : INTEGER
	r : INTEGER

feature
	init (a : INTEGER; b : INTEGER)
		do
			set_left(a)
			set_right(b)
		end
	min (a : INTEGER; b : INTEGER) : INTEGER
		do
			if a > b then
				Result := b
			else
				Result := a
			end
		end
	max (a : INTEGER; b : INTEGER) : INTEGER
		do
			if a > b then
				Result := a
			else
				Result := b
			end
		end
	set_left (ll : INTEGER)
		do
			l := ll
		end
	set_right (rr : INTEGER)
		do
			r := rr
		end
	left : INTEGER
		do
			Result := l
		end
	right : INTEGER
		do
			Result := r
		end
	is_equal_range (a : RANGE_OF_NUMBERS) : BOOLEAN
		do
			if is_empty and a.left > a.right then
				Result := True
			elseif a.left = l and a.right = r then
				Result := True
			else
				Result := False
			end
		end
	is_empty : BOOLEAN
		do
			if l > r then
				Result := True
			else
				Result := False
			end
		end
	is_sub_range_of_other (a : RANGE_OF_NUMBERS) : BOOLEAN
		do
			if is_empty then
				Result := True
			elseif a.left > a.right then
				Result := False
			elseif a.left <= l and r <= a.right then
				Result := True
			else
				Result := False
			end
		end
	is_super_range_of_other (a : RANGE_OF_NUMBERS) : BOOLEAN
		do
			if a.left > a.right then
				Result := True
			elseif is_empty then
				Result := False
			elseif a.left >= l and a.right <= r then
				Result := True
			else
				Result := False
			end
		end
	left_overlaps (a : RANGE_OF_NUMBERS) : BOOLEAN
		do
			if a.left > a.right or is_empty then
				Result := False
			elseif a.left <= l and a.right >= l then
				Result := True
			else
				Result := False
			end
		end
	right_overlaps (a : RANGE_OF_NUMBERS) : BOOLEAN
		do
			if a.left > a.right or is_empty then
				Result := False
			elseif a.left <= r and a.right >= r then
				Result := True
			else
				Result := False
			end
		end
	overlaps (a : RANGE_OF_NUMBERS) : BOOLEAN
		do
			if a.left > a.right or is_empty then
				Result := False
			elseif left_overlaps(a) or right_overlaps(a) or is_super_range_of_other(a) or is_sub_range_of_other(a) then
				Result := True
			else
				Result := False
			end
		end
	add (a : RANGE_OF_NUMBERS) : RANGE_OF_NUMBERS
		require
			addable : overlaps(a) = True or a.left = right + 1 or l = a.right + 1
		local
			b : RANGE_OF_NUMBERS
		do
			if a.left > a.right and is_empty then
				Result := a
			elseif a.left > a.right then
				Result := current
			elseif is_empty then
				Result := a
			else
				create b.init(min(a.left, left), max(a.right, right))
				Result := b
			end
		end
	subtract (a : RANGE_OF_NUMBERS) : RANGE_OF_NUMBERS
		require
			subtractable : is_super_range_of_other(a) = True and (a.left = l or a.right = r)
		local
			b : RANGE_OF_NUMBERS
		do
			if is_empty and a.left > a.right then
				Result := current
			elseif is_equal_range(a) then
				create b.init (2, 1) --Empty
				Result := b
			elseif a.left = l then
				create b.init(a.right + 1, r)
				Result := b
			else
				create b.init(l, a.left - 1)
				Result := b
			end
		end

feature {NONE}
	make
		local
			a : RANGE_OF_NUMBERS
			b : RANGE_OF_NUMBERS
			c : RANGE_OF_NUMBERS
		do
			l := 5
			r := 6
			create a.init (1, 5)
			create b.init (5, 6)
			print(is_equal_range(a).out + "%N") --False
			print(is_equal_range(b).out + "%N%N") --True

			print(is_empty.out + "%N%N") --False

			create a.init (1, 6)
			print(is_sub_range_of_other(a).out + "%N") --True
			create a.init (1, 5)
			print(is_sub_range_of_other(a).out + "%N%N") --False

			create a.init(5, 6)
			print(is_super_range_of_other(a).out + "%N") --True
			create a.init (5, 7)
			print(is_super_range_of_other(a).out + "%N%N") --False

			create a.init (4, 5)
			print(left_overlaps(a).out + "%N") --True
			create a.init (6, 7)
			print(left_overlaps(a).out + "%N%N") --False

			create a.init (4, 5)
			print(left_overlaps(a).out + "%N") --True
			create a.init (6, 7)
			print(left_overlaps(a).out + "%N%N") --False

			create a.init (6, 7)
			print(right_overlaps(a).out + "%N") --True
			create a.init (4, 5)
			print(right_overlaps(a).out + "%N%N") --False

			create a.init (5, 5)
			print(overlaps(a).out + "%N") --True
			create a.init (7, 7)
			print(overlaps(a).out + "%N%N") --False

			create a.init (7, 10)
			b := add(a)
			print(b.left.out + " " + b.right.out + "%N%N")

			l := 1
			r := 10
			create a.init (1, 4)
			b := subtract(a)
			print(b.left.out + " " + b.right.out + "%N%N")
		end
end
