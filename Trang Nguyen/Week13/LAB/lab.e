note
	description: "Summary description for {LAB}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LAB

create
	make

feature

	make
		do
			create member.make (0)
		end

	member: ARRAYED_LIST [SCIENTIST]

	add_member (s: SCIENTIST)
		do
			member.extend (s)
		end

	remove_member (s: SCIENTIST)
		do
			member.prune (s)
		end

	introduce_all
		local
			i: INTEGER
		do
			from i := 1
			until i > member.count
			loop
				member [i].introduce
				i := i + 1
			end
		end

end
