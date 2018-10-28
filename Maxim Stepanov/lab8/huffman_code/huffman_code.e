note
	description: "Summary description for {HUFFMAN_CODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HUFFMAN_CODE

create
	make

feature

	make
		do
		end

	build_tree (bag: CHAR_BAG): M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]]
		local
			n1, n2, n3: M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]]
			m1: M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]]
			list: ARRAYED_LIST [M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]]]
			i: INTEGER
		do
			create list.make (0)
			from
				i := 1
			until
				i > bag.chars.count
			loop
				create m1.make (bag.chars [i])
				list.extend (m1)
				i := i + 1
			end
			from
			until
				list.count <= 1
			loop
				list.start
					--				n1 := list [list.count]
				n1 := list [1]
				list.prune (n1)
				list.start
					--				n2 := list [list.count]
				n2 := list [1]
				list.prune (n2)
				create n3.make (create {BAG_PAIR [CHARACTER]}.make ('\'))
				n3.info.set_count (n1.info.count + n2.info.count)
				n3.set_left (n1)
				n3.set_right (n2)
				list.extend (n3)
				sort (list)
			end
			Result := list [1]
		end

	sort (l: ARRAYED_LIST [M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]]])
		local
			i, j: INTEGER
			value: M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]]
		do
			from
				i := 2
			until
				i > l.count
			loop
				value := l [i]
				j := i - 1
				from
				until
					not (j >= 1 and l [j].info.count > value.info.count)
				loop
					l [j + 1] := l [j]
					j := j - 1
				end
				l [j + 1] := value
				i := i + 1
			end
		end

	traverse (root: detachable M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]] seq: STRING)
		local
			s: STRING
		do
			if attached root then
				s := seq
				if (not attached root.left) and (not attached root.right) then
					print (seq)
					print (" ")
					print (root.info.val)
					print ("%N")
				else
					if attached root.left then
						traverse (root.left, s + "0")
					end
					if attached root.right then
						traverse (root.right, s + "1")
					end
				end
			end
		end

	encode (root: detachable M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]] c: CHARACTER seq: STRING): STRING
		local
			s: STRING
			tmp: STRING
		do
			Result := ""
			if attached root then
				s := seq
				if (not attached root.left) and (not attached root.right) then
					if c = root.info.val then
						Result := s
					end
				else
					if attached root.left then
						tmp := encode (root.left, c, s + "0")
						if not (tmp ~ "") then
							Result := tmp
						end
					end
					if attached root.right then
						tmp := encode (root.right, c, s + "1")
						if not (tmp ~ "") then
							Result := tmp
						end
					end
				end
			end
		end

	decode (root: detachable M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]] str: STRING seq: STRING): CHARACTER
		local
			s: STRING
			tmp: CHARACTER
		do
			Result := '\'
			if attached root then
				s := seq
				if (not attached root.left) and (not attached root.right) then
					if str ~ seq then
						Result := root.info.val
					end
				else
					if attached root.left then
						tmp := decode (root.left, str, s + "0")
						if tmp /= '\' then
							Result := tmp
						end
					end
					if attached root.right then
						tmp := decode (root.right, str, s + "1")
						if tmp /= '\' then
							Result := tmp
						end
					end
				end
			end
		end

	character_length (root: detachable M_BINARY_TREE_NODE [BAG_PAIR [CHARACTER]] str: STRING seq: STRING): INTEGER
		local
			s: STRING
			tmp: INTEGER
		do
			Result := 0
			if attached root then
				s := seq
				if (not attached root.left) and (not attached root.right) then
					if str ~ seq then
						Result := seq.count
					end
				else
					if attached root.left then
						tmp := character_length (root.left, str, s + "0")
						if tmp > 0 then
							Result := tmp
						end
					end
					if attached root.right then
						tmp := character_length (root.right, str, s + "1")
						if tmp > 0 then
							Result := tmp
						end
					end
				end
			end
		end

end
