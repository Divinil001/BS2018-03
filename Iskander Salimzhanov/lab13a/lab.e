note
	description: "Summary description for {LAB}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LAB
create
	make_empty, make_filled

feature {NONE}
	members: ARRAYED_LIST [SCIENTIST]

	set_members(a: ARRAYED_LIST [SCIENTIST])
	do
		members := a
	ensure
		members = a
	end

feature {ANY}
	get_members: ARRAYED_LIST [SCIENTIST]
	do
		Result := members
	ensure
		Result = members
	end

	introduce_all
	local
		i: INTEGER
	do
		from
			i := 1
		until
			i > members.count
		loop
			members.i_th(i).introduce
			i := i + 1
		end
	end

	add_member(a: SCIENTIST)
	do
		members.extend (a)
	end

	remove_member(a: SCIENTIST)
	local
		ans: ARRAYED_LIST [SCIENTIST]
		i: INTEGER
	do
		create ans.make (0)
		from
			i := 1
		until
			i > members.count
		loop
			if not members.i_th (i).is_equal(a) then
				ans.extend (a)
			end
			i := i + 1
		end
	end

feature
	make_empty
	do
		create members.make(0)
	end

	make_filled(a: ARRAYED_LIST [SCIENTIST])
	do
		set_members(a)
	end
end
