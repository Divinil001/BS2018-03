note
	description: "Claas COURSE"
	author: "Marko Pezer"
	date: "27.08.2018"

class
	COURSE

create
	create_class

feature

	Name: STRING
	Identifier : INTEGER
	Schedule: STRING
	Maximum_number_of_students: INTEGER

feature

	create_class (new_name: STRING; new_id: INTEGER; new_schedule: STRING; new_mns: INTEGER)

		require
			validation: new_mns >= 3

		do
			Name := new_name
			Identifier  := new_id
			Schedule := new_schedule
			Maximum_number_of_students := new_mns
		end

end
