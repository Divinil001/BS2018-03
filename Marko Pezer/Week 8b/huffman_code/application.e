note
	description: "huffman application root_value class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

create
	make

feature

	i, j: INTEGER
	str : STRING

	ac: ARRAY[CHARACTER]
	aw: ARRAY[LEAF]
	arr_bint: ARRAY[MY_BINARY_TREE[LEAF]]

	encrypt_str: STRING
	decrypt_str : STRING

	make
	local
		break, flag: BOOLEAN
		ll, lr, tmp: MY_BINARY_TREE[LEAF]
	do
		io.put_string ("Input your word: ")
		io.read_line
		str := io.last_string.out
		io.put_new_line

		create ac.make_empty
		create aw.make_empty

		from i := 1
		until i > str.count
		loop
			flag := False
			break := False

			from j := 1
			until (j > aw.count or break)
			loop
				if aw[j].get_char = str[i] then
					aw[j].add_value
					break := True
					flag := True
				end
				j := j + 1
			end

			if flag = False then
				aw.force (create {LEAF}.make(str[i]), aw.count + 1)
				ac.force (str[i], ac.count + 1)
			end
			i := i + 1
		end

		create arr_bint.make_empty

		from i := 1
		until i > aw.count
		loop
			arr_bint.force (create {MY_BINARY_TREE[LEAF]}.make (aw[i]), arr_bint.count + 1)
			i := i + 1
		end


		from
		until arr_bint.count = 1
		loop
			ll := arr_bint[1]
			lr := arr_bint[2]

			from j := 3
			until j > arr_bint.count
			loop
				if arr_bint[j].root_value.get_val < ll.root_value.get_val then
					lr := ll
					ll := arr_bint[j]
				elseif arr_bint[j].root_value.get_val <= lr.root_value.get_val then
					lr := arr_bint[j]
				end
				j := j + 1
			end

			create tmp.make(create {LEAF}.make (' '))

			tmp.root_value.set_value (lr.root_value.get_val + ll.root_value.get_val)

			tmp.add_left (ll)
			tmp.add_right (lr)

			arr_bint := delete_element(ll)
			arr_bint := delete_element(lr)

			arr_bint.force (tmp, arr_bint.count + 1)
		end

		generate_codes_recursive ("", arr_bint[1])

		-- Print encrypt and descrypt

		io.put_string ("Coded word: ")
		encrypt_str := encrypt(str, aw)
		io.put_string (encrypt_str.out)
		io.put_new_line

		io.put_string ("Decoded word: ")
		decrypt_str := decrypt (encrypt_str, aw)
		io.put_string (decrypt_str.out)
		io.put_new_line
	end

	generate_codes_recursive (s: STRING; cl: MY_BINARY_TREE[LEAF])
	do
		if (cl.root_value.get_char ~ ' ') = False then
			from i := 1
			until i > aw.count
			loop
				if  (aw[i].get_char ~ cl.root_value.get_char) = True then
					aw[i].set_code(s)
				end
				i := i + 1
			end
		else
			if attached cl.leftst as l then
				generate_codes_recursive(s + "0", l)
			end
			if attached cl.rightst as r then
				generate_codes_recursive(s + "1", r)
			end
		end
	end

	encrypt(s: STRING; arr_bintc: ARRAY[LEAF]): STRING
	do
		Result := ""

		from i := 1
		until i > s.count
		loop
			from j := 1
			until j > arr_bintc.count
			loop
				if (arr_bintc[j].get_char ~ s[i]) = True then
					Result := Result + arr_bintc[j].code
				end
				j := j + 1
			end
			i := i + 1
		end
	end

	decrypt(s: STRING; arr_bintc: ARRAY[LEAF]): STRING
	local
		tmp: STRING
		flag: BOOLEAN
	do
		tmp := ""
		Result := ""
		flag := False

		from i := 1
		until i > s.count
		loop
			tmp := tmp + s[i].out

			from j := 1
			until j > arr_bintc.count or flag
			loop
				if (arr_bintc[j].get_code ~ tmp) = True then
					Result.append (arr_bintc[j].get_char.out)
					flag := True
				end
				j := j + 1
			end

			if flag then
				tmp := ""
				flag := False
			end
			i := i + 1
		end
	end

	delete_element (leaf: MY_BINARY_TREE[LEAF]): ARRAY[MY_BINARY_TREE[LEAF]]
	do
		create Result.make_empty

		from i := 1
		until i > arr_bint.count
		loop
			if (leaf ~ arr_bint[i]) = False then
				Result.force (arr_bint[i], Result.count + 1)
			end
			i := i + 1
		end
	end

end
