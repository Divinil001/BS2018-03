note
	description: "power_set application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
				set: ARRAYED_LIST [INTEGER]
	make
			-- Run application.
		do
			--| Add your code here
			create set.make_filled (0)
		end
	get_power_set(s: ARRAYED_LIST [INTEGER]): ARRAYED_LIST [ARRAYED_LIST [INTEGER]]
		require

			s_not_empty: not s.is_empty

		local

			i, c: INTEGER

			temp: ARRAYED_LIST [ARRAYED_LIST [INTEGER]]

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

				temp := get_power_set (s)

				Result.append (temp)

				from i := 1

				until i > temp.count

				loop

					temp [i].extend (c)

					i := i + 1

				end

				Result.append (temp)

			end

		end





		end

