-- NOT TESTED
class
	POWER_SET

feature -- Access

	set: ARRAYED_LIST [INTEGER]

	power_set (s: ARRAYED_LIST [INTEGER]): ARRAYED_LIST [ARRAYED_LIST [INTEGER]]
			-- `power_set'
		require
			s_not_empty: not s.is_empty
		local
			i, c: INTEGER
			s_help: ARRAYED_LIST [ARRAYED_LIST [INTEGER]]
			empty: ARRAYED_LIST [INTEGER]
		do
			create Result.make (0)
			create empty.make (0)
			if s.count = 1 then
				Result.extend (s)
				Result.extend (empty)
			else
				c := s[s.count]
				s.prune (c)
				s_help := power_set (s)
				Result.append (s_help)
				from i := 1
				until i > s_help.count
				loop
					s_help [i].extend (c)
					i := i + 1
				end
				Result.append (s_help)
			end
		end

	power_set_print (p_s: ARRAYED_LIST [ARRAYED_LIST [INTEGER]])
		require
			p_s_not_empty: not p_s.is_empty
		local
			i, j: INTEGER
		do
			from i := 1
			until i > p_s.count
			loop
				print ("{ ")
				if not p_s[i].is_empty then
					from j := 1
					until j > p_s[i].count
					loop
						print (p_s[i].i_th (j).out + " ")
						j := j + 1
					end
				end
				print ("} ")
				i := i + 1
			end
		end
end
