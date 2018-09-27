note
	description: "Summary description for {MERGE_SORT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MERGE_SORT

feature

	mergesort (a: ARRAY [INTEGER]; l, r: INTEGER)
		local
			m: INTEGER
		do
			if l < r then
				m := (l + r) // 2
				mergesort(a, l, m)
				mergesort(a, m + 1, r)
				merge(a, l, m, r)
			end
		end

feature

	merge (a: ARRAY [INTEGER]; l, m, r: INTEGER)
		local
			b: ARRAY [INTEGER]
			h, i, j, k: INTEGER
		do
			i := l
			j := m + 1
			k := l
			create b.make (l, r)
			from
			until
				i > m or j > r
			loop
				if a.item (i) <= a.item (j) then
					b.item (k) := a.item (i)
					i := i + 1

				elseif a.item (i) > a.item (j) then
					b.item (k) := a.item (j)
					j := j + 1
				end
				k := k + 1
			end
			if i > m then
				from
					h := j
				until
					h > r
				loop
					b.item (k + h - j) := a.item (h)
					h := h + 1
				end
			elseif j > m then
				from
					h := i
				until
					h > m
				loop
					b.item (k + h - i) := a.item (h)
					h := h + 1
				end
			end
			from
				h := l
			until
				h > r
			loop
				a.item (h) := b.item (h)
				h := h + 1
			end

		end
end
