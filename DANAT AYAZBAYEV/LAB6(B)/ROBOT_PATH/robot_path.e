note
	description: "ROBOT_PATH application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	ROBOT_PATH

inherit
	ARGUMENTS

create
	make

feature
	px : ARRAY2[INTEGER]
	py : ARRAY2[INTEGER]
	a : ARRAY2[CHARACTER]
	n : INTEGER
	m : INTEGER
	ax : INTEGER
	ay : INTEGER
	help : INTEGER
	pathx : ARRAYED_LIST[INTEGER]
	pathy : ARRAYED_LIST[INTEGER]
	used : ARRAY2[BOOLEAN]

feature
	dfs (x : INTEGER; y : INTEGER)
		do
			used[x, y] := True
			if x < n and used[x + 1, y] = False and a[x + 1, y] /= '*' then
				px[x + 1, y] := x
				py[x + 1, y] := y
				dfs(x + 1, y)
			elseif y < m and used[x, y + 1] = False and a[x, y + 1] /= '*' then
				px[x, y + 1] := x
				py[x, y + 1] := y
				dfs(x, y + 1)
			--elseif x > 1 and used[x - 1, y] = False and a[x - 1, y] /= '*' then
			--	px[x - 1, y] := x
			--	py[x - 1, y] := y
			--	dfs(x - 1, y)
			--elseif y > 1 and used[x, y - 1] = False and a[x, y - 1] /= '*' then
			--	px[x, y - 1] := x
			--	py[x, y - 1] := y
			--	dfs(x, y - 1)
			end
		end

feature {NONE}
	make
		local
			s : STRING
			i : INTEGER
			start : BOOLEAN
			j : INTEGER
		do
			--Program is not comput

			--INPUT EXAMPLE

			--4 4 (n, m in one line)
			--.*** (every row in one line)
			--..**
			--*..*
			--**..

			-- . -> can_step (empty_space)
			-- * -> cannot_step (wall)
			io.read_line
			s := io.last_string.out
			from
				i := 1
			until
				i > s.count
			loop
				if s.at (i).is_digit then
					if start = False then
						n := n * 10
						n := n + s.at (i).code - 48
					else
						m := m * 10
						m := m + s.at (i).code - 48
					end
				else
					start := True
				end
				i := i + 1
			end
			create a.make_filled ('.', n, m)
			create px.make_filled (0, n, m)
			create py.make_filled (0, n, m)
			create pathx.make (0)
			create pathy.make (0)
			create used.make_filled (False, n, m)
			from
				i := 1
			until
				i > n
			loop
				io.read_line
				s := io.last_string.out
				from
					j := 1
				until
					j > m
				loop
					if s[j] = '*' then
						a[i, j] := '*'
					end
					j := j + 1
				end
				i := i + 1
			end
			dfs(1, 1)
			if px[n, m] = 0 then
				print("Cannot reach")
			else
				from
					ax := n
					ay := m
				until
					ax = 0 and ay = 0
				loop
					pathx.extend(ax)
					pathy.extend(ay)
					help := ax
					ax := px[help, ay]
					ay := py[help, ay]
				end
				from
					i := pathx.count
				until
					i = 0
				loop
					print(pathx[i].out + " " + pathy[i].out)
					if i /= 1 then
						print(" -> ")
					end
					i := i - 1
				end
			end
		end
end
