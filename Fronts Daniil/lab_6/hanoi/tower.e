note
	description: "Summary description for {TOWER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TOWER

create
	make_empty, make_main

feature
	make_empty(n: INTEGER)
	do
		create disks.make
	end

	make_main(n: INTEGER)
	local
		i: INTEGER
	do
		create disks.make
		from
			i := 1
		until
			i = n + 1
		loop
			disks.extend (i)
			i := i + 1
		end
	end

	is_empty: BOOLEAN
	do
		Result := disks.is_empty
	end

	top: INTEGER
	do
		Result := disks.last
	end

	pop
	do
		disks.finish
		disks.remove
	end

	add(num: INTEGER)
	do
		disks.extend (num)
	end

	printt: STRING
	local
		i: INTEGER
	do
		Result := ""
		from
			i := 1
		until
			i = disks.count + 1
		loop
			Result := Result + disks[i].out + " "
			i := i + 1
		end
	end


feature
	disks: LINKED_LIST[INTEGER]
end
