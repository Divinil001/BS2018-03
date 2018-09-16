note
	description: "Summary description for {MATRIX_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX_OPER

feature

	add(m1,m2:ARRAY2[INTEGER]):ARRAY2[INTEGER]
	require
		equal_width: m1.width = m2.width
		equal_height : m1.height = m2.height
		filled_matrix_m1: m1.count /= 0
		filled_matrix_m2: m2.count /= 0
	local
		i,j:INTEGER
		res:ARRAY2[INTEGER]
	do
		create res.make_filled (0, m1.height, m1.width)
		print("m1 + m2= %N")
		from
			i:=1
		until
			i = m1.height + 1
		loop
			from
				j:=1
			until
				j = m1.width + 1
			loop
				res[i,j] := m1[i,j] + m2[i,j]
				j := j + 1
			end
			i:= i + 1
		end

		Result:=res
	end

	minus(m1,m2:ARRAY2[INTEGER]):ARRAY2[INTEGER]
	require
		equal_width: m1.width = m2.width
		equal_height : m1.height = m2.height
		filled_matrix_m1: m1.count /= 0
		filled_matrix_m2: m2.count /= 0
	local
		i,j:INTEGER
		res:ARRAY2[INTEGER]
	do
		create res.make_filled (0, m1.height, m1.width)
		print("m1 - m2= %N")
		from
			i:=1
		until
			i = m1.height + 1
		loop
			from
				j:=1
			until
				j = m1.width + 1
			loop
				res[i,j] := m1[i,j] - m2[i,j]
				j := j + 1
			end
			i:= i + 1
		end

		Result:=res
	end

	prod(m1,m2:ARRAY2[INTEGER]):ARRAY2[INTEGER]
	require
		equal_width_and_height: m1.width = m2.height
		filled_matrix_m1: m1.count /= 0
		filled_matrix_m2: m2.count /= 0
	local
		i,j, n,m, k,l:INTEGER
		res:ARRAY2[INTEGER]
		pr:INTEGER
	do
		create res.make_filled (0, m1.height, m2.width)

		n := m1.height
		m := m2.width
		print("m1 * m2= %N")
		from
			k := 1
		until
			k = n + 1
		loop
			from
				l:= 1
			until
				l = m + 1
			loop
					from
						j:=1
					until
						j = m1.width + 1
					loop
						pr :=pr + m1[k,j] * m2[j,l]
						j := j + 1
					end
				res[k,l] := pr
				pr := 0
				l:= l + 1
			end
			k := k + 1
		end

		Result:=res
	end

	make_matrix:ARRAY2[INTEGER]
	local
		res:ARRAY2[INTEGER]
		n,m, i,j:INTEGER
		s : STRING
	do
		print("Enter rows: %N")
		Io.read_integer_32
		n:=Io.last_integer_32
		print("Enter columns: %N")
		Io.read_integer_32
		m:=Io.last_integer_32

		create res.make_filled (0, n, m)
		from
			i:=1
		until
			i = n + 1
		loop
			Io.read_line
			s := Io.last_string
			from
				j := 1
			until
				j = m + 1
			loop
				res[i,j] := s.split (' ').at (j).to_integer_32
				j := j + 1
			end
			i := i + 1
		end
		print("-----------------------------------%N")
		Result:=res
	end

	print_matrix(m:ARRAY2[INTEGER])
	require
		positive_height_matrix: m.height /= 0
		positive_width_matrix: m.width /= 0
	local
		i, j:INTEGER
	do
		from
			i:=1
		until
			i = m.height + 1
		loop
			from
				j := 1
			until
				j = m.width + 1
			loop
				print(m[i,j].out + " ")
				j := j + 1
			end
		print("%N")
		i:= i + 1
		end
		print("-----------------------------------%N")
	end

	det(A:ARRAY2[INTEGER];N:INTEGER):DOUBLE
	require
		square_matrix:A.height=A.width
		correct_length:A.height=N
	local
		determinant:DOUBLE
		i,j,k,l:INTEGER
		m:ARRAY2[INTEGER]
    do
        determinant := 0;
        if N = 1 then
            determinant := A[1,1];

        else if (N = 2) then
            determinant := A[1,1]*A[2,2] - A[2,1]*A[1,2];
        else
            determinant:=0;
            --columns of A
            from
            	i:=1
            until
            	i = N + 1
            loop
            	create m.make_filled (0, N - 1, N - 1)

				--rows of A
           		from
           			j := 2
         	  	until
           			j = N + 1
        	   	loop
                    k:=1
                    --columns of m
                    from
                    	l:=1
                    until
                    	l = N + 1
                    loop
                        if(l /= i) then
                        	m[j-1,k] := A[j,l];
                        	k:= k+1;
                        end
                        l := l + 1
                    end
					j := j + 1
           		end
                determinant := determinant + (-1).power (i + 1)* A[1,i] * det(m,N-1);
                i := i + 1
            end

        end
        Result := determinant
    end
end
end
