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
	phone_number: INTEGER_64
	work_place: STRING
	email: STRING


	make(a_name: STRING; a_phone_number: INTEGER_64	; a_work_place: STRING; a_email: STRING)
		do
			set_name (a_name)
			set_phone_number (a_phone_number)
			set_work_place (a_work_place)
			set_email (a_email)

		end

	set_name (a_name: STRING)
		require
      		name_exists: a_name /= Void
    	do
      		name := a_name.twin
    	end

   set_phone_number (a_phone_number: INTEGER_64)
   		require
      		it_is_10_or_not: a_phone_number.out.count = 10
   		do
   			phone_number := a_phone_number
   		end

   set_work_place (a_work_place: STRING)
   		require
   			work_place_exists: a_work_place /= Void
    	do
      		work_place := a_work_place.twin
    	end

   set_email (a_email: STRING)
   		require
   			email_exists: a_email /= Void
    	do
      		email := a_email.twin
    	end





end
