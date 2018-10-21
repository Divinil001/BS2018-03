note
	description: "Summary description for {SPIRAL_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SPIRAL_CIPHER
--inherit
--	CIPHER
--redefine
--	encode,
--	decode
--end

feature
	encrypt(s: STRING): STRING
	local
		i: INTEGER
		j: INTEGER
		n: INTEGER
		left, right, top, down:INTEGER
		counter: INTEGER
		ended: BOOLEAN
		arr: ARRAY2[CHARACTER]
		res: STRING
	do
		print("%NSpiral encrypt string " + s + "%N")
		res := ""
		Result := ""
		from n := 1 until n*n >= s.count loop
			n := n + 1
		end
		create arr.make_filled (' ', n, n)
		counter := 1
		from
			i := 1
		until
			i = n + 1
		loop
			from
				j := 1
			until
				j = n + 1
			loop
				if counter < s.count + 1 then
					arr[i, j] := s[counter]
					counter := counter + 1
				end
				j := j + 1
			end
			i := i + 1
		end
		print_arr(arr)

		left := 0
		top := 0
		right := n + 1
		down := n + 1
		counter := 0
		from ended := False until ended = True loop
			--print(Result + "%N")

			from i := top + 1 until i >= down loop
				if counter < n*n then
					res.append_character(arr[i, right - 1])
					counter := counter + 1
				end
				i := i + 1
			end
			right := right - 1
			--print("Right%N")
			--print(Result + "%N")
			from i := right - 1 until i <= left loop
				if counter < n*n then
					res.append_character(arr[down - 1, i])
					counter := counter + 1
				end
				i := i - 1
			end
			down := down - 1
			--print("Down%N")
			--print(Result + "%N")
			from i := down - 1 until i <= top loop
				if counter < n*n then
					res.append_character(arr[i, left + 1])
					counter := counter + 1
				end
				i := i - 1
			end
			left := left + 1
			--print("Left%N")
			--print(Result + "%N")
			from i := left + 1 until i >= right loop
				if counter < n*n then
					res.append_character(arr[top + 1, i])
					counter := counter + 1
				end
				i := i + 1
			end
			top := top + 1
			--print("Top%N")
			--print(Result + "%N")
			if counter = n*n then --or left = right or top = down then
				ended := True
			end
		end
		from
			i := 1
		until
			i = res.count + 1
		loop
			if Result.is_empty  then
				if res[i] /= ' ' then
					Result.append_character(res[i])
				end
			else
				if not(Result[Result.count] = ' ' and res[i] = ' ') then
					Result.append_character(res[i])
				end
			end
			i := i + 1
		end
		print("%NResult = " + Result + "%N")
	end

	decrypt(s: STRING): STRING
	local
		i: INTEGER
		j: INTEGER
		n: INTEGER
		left, right, top, down:INTEGER
		counter: INTEGER
		ended: BOOLEAN
		arr: ARRAY2[CHARACTER]
		res: STRING
		sub: INTEGER
		new_s: STRING
		space_ind: INTEGER
		space: STRING
	do
		print("%NSpiral decrypt string " + s + "%N")
		Result := ""
		from n := 1 until n*n >= s.count loop
			n := n + 1
		end
		create arr.make_filled ('_', n, n)
		sub := n*n - s.count
		space_ind := s.index_of (' ', 1)
		new_s := ""
		if sub > 0 then
			space := " "
			space.multiply (sub)
			new_s.append_substring (s, 1, space_ind)
			new_s.append_string (space)
			new_s.append_substring (s, space_ind + 1, s.count)
		else
			new_s := s
		end
		print("%N" + s + "%N")
		--print(new_s)
		--print("%N")
		left := 0
		top := 0
		right := n + 1
		down := n + 1
		counter := 1

		from ended := False until ended = True loop
			--print(Result + "%N")

			from i := top + 1 until i >= down loop
				if counter <= n*n then
					arr[i, right - 1] := new_s[counter]
					counter := counter + 1
				end
				i := i + 1
			end
			right := right - 1
			--print_arr(arr)
			--print("%N")
			from i := right - 1 until i <= left loop
				if counter <= n*n then
					arr[down - 1, i] := new_s[counter]
					counter := counter + 1
				end
				i := i - 1
			end
			down := down - 1
			--print_arr(arr)
			--print("%N")
			from i := down - 1 until i <= top loop
				if counter <= n*n then
					arr[i, left + 1] := new_s[counter]
					counter := counter + 1
				end
				i := i - 1
			end
			left := left + 1
			--print_arr(arr)
			--print("%N")
			from i := left + 1 until i >= right loop
				if counter <= n*n then
					arr[top + 1, i] := new_s[counter]
					counter := counter + 1
				end
				i := i + 1
			end
			top := top + 1

			--print_arr(arr)
			--print("%N")
			if counter > n*n then --or left = right or top = down then
				ended := True
			end
		end
		print_arr(arr)
		counter := 1
		res := ""
		from
			i := 1
		until
			i = n + 1
		loop
			from
				j := 1
			until
				j = n + 1
			loop
				if counter < s.count + 1 then
					res.append_character (arr[i, j])
					counter := counter + 1
				end
				j := j + 1
			end
			i := i + 1
		end
		Result := res
		print("%NResult = " + Result + "%N")
	end

	print_arr(a: ARRAY2[CHARACTER])
	local
		i: INTEGER
		j: INTEGER
	do
		from
			i := 1
		until
			i = a.height + 1
		loop
			from
				j := 1
			until
				j = a.width + 1
			loop
				print(a[i, j].out + " ")
				j := j + 1
			end
			print("%N")
			i := i + 1
		end
	end

end
