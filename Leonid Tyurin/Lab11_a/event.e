class
	EVENT

inherit
	COMPARABLE

create
	make

feature
	time:INTEGER
	type:STRING

	make(seconds: INTEGER; t: STRING)
	require
		not t.is_empty
	do
		time := seconds;
		type := t
	end

	get_time : INTEGER
	do
		Result := time
	end

	is_less alias "<" (other: like Current): BOOLEAN
		do
			Result := Current.get_time > other.get_time
		end

	put: STRING
	do
		Result := "type: " + type + ", time: " + time.out + "%N"
	end
end
