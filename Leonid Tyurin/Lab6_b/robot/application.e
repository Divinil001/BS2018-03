note
	description: "pobot_path application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	r, c: INTEGER

	map: ARRAY [ARRAY [INTEGER]]

	solve (r1, c1: INTEGER): ARRAY [STRING]
		local
			a1, a2: ARRAY [STRING]
		do
			if r1 > r or c1 > c or map[r1].item (c1) = 1 then
				Result := <<>>
			elseif r1 = r and c1 = c then
				Result := <<"finish">>
			else
				a1 := solve (r1 + 1, c1)
				a2 := solve (r1, c1 + 1)
				if a2.count /= 0 and (a1.count = 0 or a2.count < a1.count) then
					a2.force ("right", a2.count + 1)
					Result := a2
				elseif a1.count /= 0 and (a2.count = 0 or a1.count < a2.count) then
					a1.force ("down", a1.count + 1)
					Result := a1
				else
					Result := << >>
				end
			end
		end

	rec_print (i: INTEGER; a: ARRAY [STRING])
		do
			if i /= a.count then
				rec_print (i + 1, a)
			end
			print (a [i] + "%N")
		end

	make
		do
			r := 3
			c := 3
			map := <<<<0, 1, 1>>,
					 <<0, 0, 0>>,
					 <<0, 1, 0>>>>
			rec_print (1, solve (1, 1))
		end

end
