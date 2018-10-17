note
	description: "Summary description for {SPIRAL_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SPIRAL_CIPHER

inherit
	CIPHER

feature

	encrypt(text, key : STRING) : STRING
		local
			matrix : ARRAY2[CHARACTER]
			i, k , p, a, len: INTEGER
			res : STRING
		do
			matrix := make_arr(text)
			a := matrix.width
			len := a
			create res.make_filled (' ', a*a)
			p := 1
			k := 1
			from until k > len*len loop
				from i := p until i >= a loop
					res[k] := matrix[i, a]
					k := k + 1
					i := i + 1
				end
				from i := a until i < p loop
					res[k] := matrix[a, i]
					k := k + 1
					i := i - 1
				end
				from i := a - 1 until i <= p loop
					res[k] := matrix[i, p]
					k := k + 1
					i := i - 1
				end
				from i := p until i >= a loop
					res[k] := matrix[p, i]
					k := k + 1
					i := i + 1
				end
				p := p + 1
				a := a - 1
			end
			result := res
		end

	decrypt(text, key : STRING) : STRING
		local
			matrix : ARRAY2[CHARACTER]
			i, a, j, k: INTEGER
			res : STRING
		do
			matrix := make_arr_spiral(text)
			a := matrix.width
			create res.make_filled (' ', a*a)
			k := 1
			from i := 1 until i > a loop
				from j := a until j < 1 loop
					res[k] := matrix[j, i]
					j := j - 1
					k := k + 1
				end
				i := i + 1
			end
			result := res
		end


feature{NONE}

	make_arr_spiral(s : STRING) : ARRAY2[CHARACTER]
		local
			res : ARRAY2[CHARACTER]
			p, k, a, len , i: INTEGER
		do
			a := s.capacity.power (0.5).ceiling
			len := a
			create res.make_filled (' ', a, a)
			p := 1
			k := 1
			from until k > len*len loop
				from i := p until i >= a loop--fr
					res[p, i] := s[k]
					k := k + 1
					i := i + 1
				end
				from i := p until i > a loop--lc
					res[i, a] := s[k]
					k := k + 1
					i := i + 1
				end
				from i := a - 1 until i <= p loop--lr
					res[a, i] := s[k]
					k := k + 1
					i := i - 1
				end
				from i := a until i <= p loop--fc
					res[i, p] := s[k]
					k := k + 1
					i := i - 1
				end
				p := p + 1
				a := a - 1
			end
			result := res
		end

	make_arr(s : STRING) : ARRAY2[CHARACTER]
		local
			a : INTEGER
			i, j , k: INTEGER
			res : ARRAY2[CHARACTER]
		do
			a := s.capacity.power (0.5).ceiling
			create res.make_filled (' ', a, a)
			k := 1
			from i := 1 until i > a loop
				from j := 1 until j > a or k > s.capacity loop
					res[i, j] := s[k]
					k := k + 1
					j := j + 1
				end
				i := i + 1
			end
			result := res
		end

end
