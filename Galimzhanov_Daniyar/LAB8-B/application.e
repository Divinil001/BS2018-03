note
    description : "root class of the application"
    date        : "$Date$"
    revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature

	i, j, root, const: INTEGER

	s: STRING

	abc: ARRAY [CHARACTER]

	a: ALPHABET [INTEGER]

	arr: ARRAY [ALPHABET [INTEGER]]

	dec : ARRAY2[STRING]

	encoded_string, code_str : STRING


	make
		do
		    print("Write word%N")
		    code_str := ""
			io.read_line
			s := io.last_string
			create arr.make_empty
			create a.make (0, " ")
			create abc.make_empty
			from
				i := 1
			until
				i = s.count + 1
			loop
				if (not abc.has (s [i])) and (not (' ' ~ s[i])) then
					create a.make (1, s [i].out)
					abc.force (s[i], abc.count + 1)
					arr.force (a, arr.count + 1)
				else
					from
						j := 1
					until
						j = arr.count + 1
					loop
						if arr[j].ch ~ s[i].out then
							arr [j].v_edit (arr [j].value + 1)
						end
						j := j + 1
					end
				end
				i := i + 1
			end
			const := arr.count
			create dec.make_filled(" ", 2, const)
			encoded_string := ""


			print_arr(arr)
			encode(arr)
			--print("Huffman code: %N")
			--print_dec(dec)

			print("Enter encoded string: ")
			io.readline
			encoded_string := io.last_string
			decode(encoded_string, dec)
		end

	print_arr (m: ARRAY [ALPHABET [INTEGER]])
		local
			k : INTEGER
		do
			from
				k := 1
			until
				k = m.count + 1
			loop
			    if not (m[k].get_v ~ 2 * s.count) then
				    print ("Ch : " + m [k].ch.out + "  Value: " +  m [k].value.out + "%N")
				end
				k := k + 1
			end
		end

	encode(m : ARRAY [ALPHABET [INTEGER]])
	local
	    k, x, y, q, b, c : INTEGER
	    flag : BOOLEAN
	    d: ALPHABET[INTEGER]
	    --code : STRING
	do
	    from until flag
	    loop
	        q := 0
	        from k := 1 until k = m.count + 1
	        loop
	           if not (m[k].value = 2 * s.count) then
	               q := q + 1
	           end
	           k := k + 1
	        end
	        if q = 1 then
	            print("Huffman code: %N")
	            from i := 1 until i = const + 1
			    loop
			        print(arr[i].ch + ": ")
			        s := ""
			        dfs(arr[i], s, i)
			        dec[1, i] := arr[i].ch
			        dec[2, i] := code_str
			        print(" Code: " + code_str + "%N")
			        i := i + 1
		        end
	            flag := TRUE
	        end


	        b := 10000; c := 10000;
	        x := 100; y := 100;
	        from k := 1 until k = m.count + 1                -- find 2 smallest frequencies
	        loop
	           if ((m[k].value <= b) and (not (m[k].value = 2 * s.count))) then
	                x := k
	                b := m[k].value
	           end
	           k := k + 1
	        end
	        from k := 1 until k = m.count + 1                -- find 2 smallest frequencies
	        loop
	           if ((m[k].value <= c) and (not (m[k].value = 2 * s.count)) and (not (k = x))) then
	               y := k
	               c := m[k].value
	           end
	           k := k + 1
	        end

	        if (x <= m.count) and (y <= m.count) then
	            create d.make((m[x].value + m[y].value), (x.out + " " + y.out))
	            d.full_make((m[x].value + m[y].value), (x.out + " " + y.out), m[x], m[y])
	            m.force(d, m.count + 1)
	            m[x].set_root(m[m.count])
	            m[y].set_root(m[m.count])
	            m[y].v_edit(2 * s.count)
	            m[x].v_edit(2 * s.count)
	        end
	    end
	end

	dfs(m : ALPHABET [INTEGER] c : STRING z : INTEGER)
	do
	        if attached m.root as l then
	            if attached l.left as rl then
	                if rl.ch ~ m.ch then
	                    c.append_character('0')
	                    dfs(l, c, z)
	                else
	                    c.append_character('1')
	                    dfs(l, c, z)
	                end
	            end
	        end

	   if not attached m.root as l then
	        c.mirror
	        dec[1, z] := m.get_ch
	        dec[2, z] := c
	        code_str := c
	   end
	  end


	  decode(str : STRING dictionary : ARRAY2[STRING])
	  local
	    k, x : INTEGER
	    enc_str, dec_str : STRING
	    flag : BOOLEAN

	  do
	    enc_str := str.twin
	    dec_str := ""
	    from until flag = TRUE
	        loop

	            from k := 1 until k = dictionary.width + 1
	            loop
	                if enc_str.starts_with (dictionary[2, k]) then
	                    dec_str.append(dictionary[1, k])
	                    enc_str.remove_head(dictionary[2, k].count)
	               end
	                k := k + 1
	            end
	            if enc_str.count = 0 then
	                print("Decoded string: " + dec_str)
	                x := 1
	                flag := TRUE
	            end
	        end
	  end

	  print_dec(m : ARRAY2[STRING])
	  local
	    x : INTEGER
	  do
	    from x := 1 until x = const + 1
	    loop
	        print("Value: " + m[1, x] + " Code: " + m[2, x] + "%N")
	        x := x + 1
	    end
	  end

    end

