note
	description: "rec application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	a: ARRAY [INTEGER]
	b: ARRAY [INTEGER]

feature
	reverse(s: STRING; pos: INTEGER)
	do
		if pos /= 0 then
			print(s.at (pos))
			reverse(s, pos - 1)
		end
	end
	LCS(i: INTEGER; j: INTEGER): INTEGER
	local
		res: INTEGER
	do
		if i = 0 or j = 0 then
			Result := 0
		else
			res := LCS(i - 1, j)
			res := res.max(LCS(i, j - 1))
			if a.item (i).is_equal (b.item (j)) then
				res := res.max (1 + LCS(i - 1, j - 1))
			end
			Result := res
		end
	end

	merger(v: ARRAYED_LIST [INTEGER]; u: ARRAYED_LIST [INTEGER]): ARRAYED_LIST [INTEGER]
	local
		i: INTEGER
		j: INTEGER
		res: ARRAYED_LIST [INTEGER]
	do
		create res.make (v.count + u.count)
		from
			i := 1
			j := 1
		until
			i > v.count and j > u.count
		loop
			if i > v.count then
				res.extend (u.i_th (j))
				j := j + 1
			elseif j > u.count then
				res.extend (v.i_th (i))
				i := i + 1
			elseif v.i_th (i) < u.i_th (j) then
				res.extend (v.i_th (i))
				i := i + 1
			else
				res.extend(u.i_th (j))
				j := j + 1
			end
		end
		Result := res
	end

	func(l, r: INTEGER): ARRAYED_LIST [INTEGER]
	local
		res: ARRAYED_LIST [INTEGER]
		m: INTEGER
	do
		create res.make(1)
		if l = r then
			res.extend(a.item (l))
		else
			m := (l + r) // 2;
			res := merger(func(l, m), func(m + 1, r))
		end
		Result := res
	end

feature {NONE} -- Initialization
	make
		local
			s: STRING
			n: INTEGER
			m: INTEGER
			i: INTEGER
			j: INTEGER
			res: ARRAYED_LIST [INTEGER]
			-- Run application.
		do
			io.read_integer
			n := io.last_integer
			io.read_integer
			m := io.last_integer
			create a.make_filled (1, 1, n)
			create b.make_filled (1, 1, m)
			from
				i := 1
			until
				i > n
			loop
				io.read_integer
				a.item(i) := io.last_integer
				i := i + 1
			end

			from
				j := 1
			until
				j > m
			loop
				io.read_integer
				b.item(j) := io.last_integer
				j := j + 1
			end
			print(LCS(n, m))
		end
end
