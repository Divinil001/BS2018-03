note
	description: "Vectors application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	vector1: ARRAY[INTEGER]
	vector2: ARRAY[INTEGER]

feature
	single_math: SINGLE_MATH
		once
			create Result
		end

feature {NONE} -- Initialization
	make
			-- Testing
		local
			i: INTEGER
		do
			create vector1.make_filled(0, 1, 3)
			from
				i:=1
			until
				i>=4
			loop
				io.read_integer
				vector1.put(io.last_integer, i)
				i:=i+1
			end
			print(vector1)

			create vector2.make_filled(0, 1, 3)
			from
				i:=1
			until
				i>=4
			loop
				io.read_integer
				vector2.put(io.last_integer, i)
				i:=i+1
			end
			print(vector2)

			print(cross_product(vector1, vector2))
			print(dot_product(vector1,vector2))
			io.new_line
			print(triangle_area(vector1,vector2))
		end

feature
	cross_product(v1,v2: ARRAY[INTEGER]):ARRAY[INTEGER]
		local
			v0: ARRAY[INTEGER]
		do
			create v0.make_filled (0, 1, 3)
			v0.put(v1.item (2)*v2.item (3)-v1.item (3)*v2.item (2) , 1)
			v0.put(-(v1.item (1)*v2.item (3)-v1.item (3)*v2.item (1)) , 2)
			v0.put(v1.item (1)*v2.item (2)-v1.item (2)*v2.item (1) , 3)
		Result:=v0
		end

	dot_product(v1,v2: ARRAY[INTEGER]): INTEGER
		local
			d_p: INTEGER
		do
			d_p:=v1.item (1)*v2.item (1)+v1.item (2)*v2.item (2)+v1.item (3)*v2.item (3)
		Result:=d_p
		end

	triangle_area(v1,v2: ARRAY[INTEGER]): REAL
		local
			t_a: REAL
			v0: ARRAY[INTEGER]
		do
			v0:=cross_product(v1,v2)
			t_a:=single_math.sqrt(v0.item (1)*v0.item (1)+v0.item (2)*v0.item (2)+v0.item (3)*v0.item (3))/2
		Result:=t_a
		end

end
