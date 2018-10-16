class
	APPLICATION

create
	make

feature
	A : ARRAY[CHARACTER] -- "Set" of letters
	W: ARRAY[LEAF] -- Array with our letters and their frequencies
	arr : ARRAY[BIN_TREE[LEAF]] -- Array for manipulation with leaves
	str : STRING
	encrypt_str: STRING
	decrypt_str : STRING
	make
		do
			-- Initialization
			Io.put_string ("Put word: ")
			Io.read_line
			str := Io.last_string.out

			create A.make_empty
			create W.make_empty

			symbol_frequencies
			create arr.make_empty

			creation_an_arr
			tree_creation
			print("%N")

			print_code_of_letters("", arr[1])
			encrypt_str := encrypt(str, W)
			print(encrypt_str)

			decrypt_str := decrypt(encrypt_str, W)
			print("%N" + decrypt_str)
		end
feature
	-- Creation arrays A and W
	symbol_frequencies
	local
		i, j : INTEGER
		flag, break : BOOLEAN

		do
			from
				i := 1
			until
				i > str.count
			loop
				flag := False
				from
					j := 1
					break := False
				until
					j > W.count or break
				loop
					if W[j].get_char = str[i] then
						W[j].add_v
						break := True
						flag := True
					end
					j := j + 1
				end
				if not flag then
					W.force(create {LEAF}.make(str[i]), W.count + 1)
					A.force (str[i], A.count + 1)
				end
				i := i + 1
			end
		end

	creation_an_arr
	local
		i: INTEGER
		do
			from
				i := 1
			until
				i > W.count
			loop
				arr.force(create {BIN_TREE[LEAF]}.make (W[i]), arr.count + 1)
				i := i + 1
			end
		end

feature
	tree_creation

		local
			leaf_l, leaf_r, tmp : BIN_TREE[LEAF]
			i : INTEGER
		do
			from
			until
				arr.count = 1
			loop
				leaf_l := arr[1]
				leaf_r := arr[2]
				from
					i := 3
				until
					i > arr.count
				loop
					if arr[i].root.get_val < leaf_l.root.get_val then
						leaf_r := leaf_l
						leaf_l := arr[i]
					elseif arr[i].root.get_val <= leaf_r.root.get_val then
						leaf_r := arr[i]
					end
					i := i + 1
				end
				create tmp.make(create {LEAF}.make (' '))
				tmp.root.set_v(leaf_r.root.get_val + leaf_l.root.get_val)
				tmp.add_l (leaf_l)
				tmp.add_r (leaf_r)
				arr := del_el_in_arr(leaf_l)
				arr := del_el_in_arr(leaf_r)

				arr.force (tmp, arr.count + 1)
			end
		end

	del_el_in_arr (leaf: BIN_TREE[LEAF]) : ARRAY[BIN_TREE[LEAF]]
		local
			i: INTEGER
		do
			create Result.make_empty
			from
				i := 1
			until
				i > arr.count
			loop
				if not (leaf ~ arr[i]) then
					Result.force(arr[i], Result.count + 1)
				end
				i := i + 1
			end
		end

feature
	print_code_of_letters(str_: STRING; cur_leaf: BIN_TREE[LEAF])
		local
			i : INTEGER
		do
			if not (cur_leaf.root.get_char ~ ' ') then
				from
					i := 1
				until
					i > W.count
				loop
					if  W[i].get_char ~ cur_leaf.root.get_char then
						W[i].set_code(str_)
					end
					i := i + 1
				end
				print(str_ + " : " + cur_leaf.root.get_char.out + "%N")
			else
				if attached cur_leaf.left_subtree as l then
					print_code_of_letters(str_ + "0", l)
				end
				if attached cur_leaf.right_subtree as r then
					print_code_of_letters(str_ + "1", r)
				end
			end
		end

feature
	encrypt(str_: STRING; some_arr_with_codes: ARRAY[LEAF]): STRING
		local
			i_, j_ : INTEGER
		do
			Result := ""
			from
				i_ := 1
			until
				i_ > str_.count
			loop
				from
					j_ := 1
				until
					j_ > some_arr_with_codes.count
				loop
					if some_arr_with_codes[j_].get_char ~ str_[i_] then
						Result := Result + some_arr_with_codes[j_].code
					end
					j_ := j_ + 1
				end
				i_ := i_ + 1
			end
		end

	decrypt(str_: STRING; some_arr_with_codes: ARRAY[LEAF]): STRING
		local
			i_, j_ : INTEGER
			tmp: STRING
			flag: BOOLEAN
		do
			tmp := ""
			Result := ""
			from
				i_ := 1
				flag := False
			until
				i_ > str_.count
			loop
				tmp := tmp + str_[i_].out
				from
					j_ := 1
				until
					j_ > some_arr_with_codes.count or flag
				loop
					if some_arr_with_codes[j_].get_code ~ tmp then
						Result.append(some_arr_with_codes[j_].get_char.out)
						flag := True
					end
					j_ := j_ + 1
				end

				if flag then
					tmp := ""
					flag := False
				end
				i_ := i_ + 1
			end
		end
end
