note
	description: "Summary description for {HUFFMAN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HUFFMAN

create
	make

feature

	freq: ARRAY [INTEGER]

	tree: LINKED_SET [NODE]

	str: STRING

	emap: HASH_TABLE [STRING, CHARACTER]

	dfs (v: NODE; path: STRING)
		do
			if v.is_leaf then
				emap.put (path, v.val)
				print (v.val.out + ": " + path + "%N")
			elseif attached v.left as l and attached v.right as r then
				dfs (l, path + "0")
				dfs (r, path + "1")
			end
		end

	make (s: STRING)
		local
			m1, m2: detachable NODE
		do
			str := s
			create freq.make_filled (0, 0, 256)
			create tree.make
			create emap.make (0)
			across
				str as c
			loop
				freq [c.item.as_lower.code] := freq [c.item.as_lower.code] + 1
			end
			across
				freq as f
			loop
				if f.item /= 0 then
					tree.put (create {NODE}.make_leaf ((f.target_index).to_character_8, f.item))
				end
			end
			--print (freq)
			from
			until
				tree.count = 1
			loop
				m1 := Void
				m2 := Void
				across
					tree as e
				loop
					if m1 = Void or else e.item.freq < m1.freq then
						m1 := e.item
					end
				end
				across
					tree as e
				loop
					if (m2 = Void or else e.item.freq < m2.freq) and e.item /= m1 then
						m2 := e.item
					end
				end
				if m1 /= Void and m2 /= Void then
					tree.prune (m1)
					tree.prune (m2)
					tree.put (create {NODE}.make (m1, m2))
				end
			end
			dfs (tree.first, "")
		end

	encode (s: STRING): STRING
		require
			existing_symbols: across s as c all emap.has (c.item) end
		do
			Result := ""
			across
				s as c
			loop
				if attached emap.at (c.item) as encoded then
					Result := Result + encoded
				end
			end
		end

	decode (s: STRING): STRING
		require
			format: across s as c all c.item = '0' or c.item = '1' end
		local
			cur: NODE
		do
			cur := tree.first
			Result := ""
			across
				s as c
			loop
				if attached cur then
					if c.item = '0' then
						cur := cur.left
					elseif c.item = '1' then
						cur := cur.right
					end
				end
				if attached cur then
					if cur.is_leaf then
						Result := Result + cur.val.out
						cur := tree.first
					end
				end
			end
		end
end
