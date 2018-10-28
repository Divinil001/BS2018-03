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
	single_math: SINGLE_MATH
	    once
	        create Result
	    end
	encrypt (in : STRING; pas : STRING) : STRING
		local
			x : INTEGER  --Current coordinate x
			y : INTEGER  --Current coordinate y
			n : INTEGER --Size of matrix
			lef : INTEGER --Left boundary
			rig : INTEGER  --Right boundary
			up : INTEGER   --Upper boundary
			down : INTEGER   --Down boundary
		do
			Result := ""
			n := single_math.sqrt(in.count).ceiling
			lef := 0
			rig := n + 1
			up := 0
			down := n + 1
			from
				x := 0
				y := n
			until
				x = (n + 1) // 2 and y = (n + 1) // 2
			loop
				if n + 1 - rig = up then
					x := x + 1
					if x + 1 = down then
						rig := rig - 1
					end
				elseif rig < down then
					y := y - 1
					if y - 1 = lef then
						down := down - 1
					end
				elseif n + 1 - down > lef then
					x := x - 1
					if x - 1 = up then
						lef := lef + 1
					end
				else
					y := y + 1
					if y + 1 = rig then
						up := up + 1
					end
				end
				if (x - 1) * n + y <= in.count then
					Result := Result + in[(x - 1) * n + y].out
				end
			end
		end
	decrypt (in : STRING; pas : STRING) : STRING
		local
			x : INTEGER  --Current coordinate x
			y : INTEGER  --Current coordinate y
			n : INTEGER --Size of matrix
			lef : INTEGER --Left boundary
			rig : INTEGER  --Right boundary
			up : INTEGER   --Upper boundary
			down : INTEGER   --Down boundary
			cnt : INTEGER  --Index
		do
			Result := " "
			Result.multiply (in.count)
			n := single_math.sqrt(in.count).ceiling
			lef := 0
			rig := n + 1
			up := 0
			down := n + 1
			from
				x := 0
				y := n
			until
				x = (n + 1) // 2 and y = (n + 1) // 2
			loop
				if n + 1 - rig = up then
					x := x + 1
					if x + 1 = down then
						rig := rig - 1
					end
				elseif rig < down then
					y := y - 1
					if y - 1 = lef then
						down := down - 1
					end
				elseif n + 1 - down > lef then
					x := x - 1
					if x - 1 = up then
						lef := lef + 1
					end
				else
					y := y + 1
					if y + 1 = rig then
						up := up + 1
					end
				end
				if (x - 1) * n + y <= in.count then
					cnt := cnt + 1
					Result[(x - 1) * n + y] := in[cnt]
				end
			end
		end

end
