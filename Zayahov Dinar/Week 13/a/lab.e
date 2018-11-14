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
	members: ARRAYED_LIST[SCIENTIST]

feature
	make
		do
			create members.make (0)
		end

	add_member(s: SCIENTIST)
		do
			members.extend(s)
		end

	remove_member(s: SCIENTIST)
		do
			members.search (s)
			members.remove
		end

	introduce_all
		local
			i:INTEGER
		do
			from
				i:=1
			until
				i>members.count
			loop
				print(members[i].introduce)
				i:=i+1
			end
		end

end
