note
	description: "Summary description for {SCIENTIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SCIENTIST

feature {NONE}
	id, name, discipline, bio: STRING

	set_id(a: STRING)
	do
		id := a
	ensure
		id = a
	end

	set_name(a: STRING)
	do
		name := a
	ensure
		name = a
	end

	set_discipline(a: STRING)
	do
		discipline := a
	ensure
		discipline = a
	end

	set_bio(a: STRING)
	do
		bio := a
	ensure
		bio = a
	end

feature {ANY}
	introduce
	do
		print("Scientist's id: ")
		print(id)
		print("%N")
		print("Scientist's name: ")
		print(name)
		print("%N")
		print("Scientist's discipline: ")
		print(discipline)
		print("%N")
	end

	get_id: STRING
	do
		Result := id
	ensure
		Result = id
	end

	get_name: STRING
	do
		Result := name
	ensure
		Result = name
	end

	get_discipline: STRING
	do
		Result := discipline
	ensure
		Result = discipline
	end

	get_bio: STRING
	do
		Result := bio
	ensure
		Result = bio
	end
end
