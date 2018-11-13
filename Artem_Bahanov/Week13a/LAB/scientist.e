deferred class
	SCIENTIST
feature
	id: INTEGER
	name: STRING
	discipline: STRING
	deferred
	end
	make(id_n: INTEGER name_n: STRING)
	do
		id := id_n
		name := name_n
	end

	introduce: STRING
	do
		Result := "---%NScientist #" + id.out + "%NName: " + name.out + "%N"
	end
end
