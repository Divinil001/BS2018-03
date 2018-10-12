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

	power_set (s: LINKED_SET [INTEGER]): LINKED_SET [LINKED_SET [INTEGER]]
		local
			s1: LINKED_SET [INTEGER]
			x: INTEGER
		do
			create Result.make
			if not s.is_empty then
				s1 := s.twin
				x := s [1]
				s1.prune (x)
				Result.append (power_set(s1))
				across
					power_set (s1) as s2
				loop
					s2.item.put (x)
					Result.put (s2.item)
				end
			else
				Result.put (create {LINKED_SET [INTEGER]}.make)
			end
		end

	make
		local
			set: LINKED_SET [INTEGER]
		do
			create set.make
			set.put (3)
			set.put (5)
			set.put (7)
			set.put (8)
			across
				power_set (set) as cur
			loop
				if cur.item.is_empty then
					print ("{}%N")
				else
					print ('{')
					across
						cur.item as elem
					loop
						print (elem.item.out + ", ")
					end
					print ("%B%B}%N")
				end
			end
		end


end


