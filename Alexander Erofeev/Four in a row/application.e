note
	description: "l4inrow application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	game: ARRAY2 [CHARACTER]

	i, j, k, z, p, t: INTEGER

	b: BOOLEAN

	make
			-- Run application.
		do
			z := 1
			io.read_integer
			i := io.last_integer
			io.read_integer
			j := io.last_integer
			create game.make_filled ('.', i, j)
			show (game)
			print ("first")
			io.new_line
			from
				b := false
			until
				b = true
			loop
				io.read_integer
				k := io.last_integer
				edit
				show (game)
				z := - z
				if z = 1 then
					print ("first")
					io.new_line
				else
					print ("second")
					io.new_line
				end
				b := check1
				if b = true then
					if z = -1 then
						print ("win first")
						io.new_line
					else
						print ("win second")
						io.new_line
					end
				end
			end
		end

	edit
		do
			if game [i, k] = '.' then
				p := i
				if z = 1 then
					game [i, k] := 'f'
				else
					game [i, k] := 's'
				end
			else
				from
					p := i
				until
					game [p, k] = '.'
				loop
					p := p - 1
				end
				if z = 1 then
					game [p, k] := 'f'
				else
					game [p, k] := 's'
				end
			end
		end

	show (m: ARRAY2 [CHARACTER])
		local
			j1: INTEGER
		do
			j1 := 1
			across
				m as c
			loop
				print (c.item.out)
				if (j1 = i) then
					j1 := 0
					io.new_line
				end
				j1 := j1 + 1
			end
		end

	check1: BOOLEAN
		local
			y, o: CHARACTER
			col,p1: INTEGER
		do
			col := 0
			if z = 1 then
				o := 's'
			else
				o := 'f'
			end
			y := game [p, k]
			if (i - p>2 and game [p-1, k] = y and game [p-2, k] = y and game [p-3] = y) then
				Result := true
			elseif 1 = 1 then
				col := 0
				from
					t := k
				until
					game [p, t] = '.' or game [p, t] = o or t = 1 or col = 3
				loop
					col := col + 1
					t := t - 1
				end
				from
					t := k
				until
					game [p, t] = '.' or game [p, t] = o or t = j or col = 3
				loop
					col := col + 1
					t := t + 1
				end
				if col = 3 then
					Result := true
				end
			end

			col := 0
			p1:=p
						from
							t := k
						until
							game [p1, t] = '.' or game [p1, t] = o or t = 1 or col = 3 or p1 = 1
						loop
							col := col + 1
							t := t - 1
							p1:=p1-1
						end
						from
							t := k
						until
							game [p, t] = '.' or game [p, t] = o or t = j or col = 3 or p1 = i
						loop
							col := col + 1
							t := t + 1
							p1:=p1 + 1
						end
						if col = 3 then
							Result := true
						end


		end

end
