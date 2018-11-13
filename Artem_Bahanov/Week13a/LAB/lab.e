class
	LAB
create
	make
feature
	members: ARRAYED_LIST[SCIENTIST]
	name: STRING
feature
	make(name_n: STRING)
	do
		create members.make(0)
		name := name_n
	end

	add_member(s: SCIENTIST)
	do
		members.force (s)
	end

	remove_member(s: SCIENTIST)
	do
		members.prune (s)
	end

	introduce_all: STRING
	local
		i: INTEGER
	do
		Result := "Lab '" + name + "'%NAll members%N"
		from
			i := 1
		until
			i > members.count
		loop
			Result := Result + members.i_th (i).introduce
			i := i + 1
		end
	end
end
