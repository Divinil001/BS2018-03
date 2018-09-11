note
	description: "Loop_painting application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			a:INTEGER
			k:INTEGER -- elems in row
			n:INTEGER -- row num
			r:INTEGER -- curr elem
			temp:INTEGER -- remember
			temp_n:INTEGER
			last_row:INTEGER
			coef:INTEGER
			i:INTEGER
			res:STRING
			temp_res:STRING
			temp_res_mir:STRING
			temp_r:INTEGER
		do
			k := 1
			io.read_integer
			a := io.last_integer
			r := 1
			last_row := a // 2 * 4 + a // 2
			create res.make_empty

			from
				n := 0
			until
				n > a - 1
			loop
				create temp_res.make_empty
				create temp_res_mir.make_empty
				coef := 0
				if n \\ 2 /= 0 then
					temp_res.append (" ")
					coef := coef + 1
				end

				temp := r

				from
					i := temp
				until
					i > temp + n // 2
				loop
					temp_res.append (i.out)

					if i < 10 then
						coef := coef + 1
					elseif i < 100 then
						coef := coef + 2
					else
						coef := coef + 3
					end

					if i /= temp + n // 2 then
						temp_res.append (" ")
						coef := coef + 1
					end
					i := i + 1
					r := r + 1
				end

				temp_r := r

				from
					i := 0
				until
					i > (last_row - coef) * 2
				loop
					temp_res.append (" ")
					i := i + 1
				end

				-------------------- mirror

				temp_r := r
				from
					i := temp_r
				until
					i < temp_r - n // 2
				loop
					temp_res_mir.append ((i-1).out)

					if i /= temp_r - n // 2 - 1 then
						temp_res_mir.append (" ")
					end
					i := i - 1
					r := r - 1
				end
				--
				----------------

				r := temp_r
				res.append (temp_res)
				res.append (temp_res_mir)
				res.append ("%N")
				n := n + 1
			end

			print(res)

		end

end
