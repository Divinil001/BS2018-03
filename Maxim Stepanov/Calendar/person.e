note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	make

feature
	name: STRING
	phone_number: INTEGER
	work_place: STRING
	email: STRING

    make (a_name: STRING a_phone_number: INTEGER a_work_place: STRING a_email: STRING)
    do
       name := a_name
       phone_number := a_phone_number
       work_place := a_work_place
       email := a_email
    end

    set_name (a_name: STRING)
    do
        name := a_name
    end


    set_phone_number (a_phone_number: INTEGER)
    do
        phone_number := a_phone_number
    end


    set_work_place (a_work_place: STRING)
    do
        work_place := a_work_place
    end


    set_email (a_email: STRING)
    do
        email := a_email
    end

end
