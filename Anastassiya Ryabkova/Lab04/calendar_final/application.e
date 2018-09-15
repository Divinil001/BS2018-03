note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization


      c1: ENTRY
      e: CALENDAR
      a_date: DATE_TIME  -- the date of the event;
      a_owner: PERSON  -- the person who created the event;
      a_subject: STRING -- a description of the event;
      a_place: STRING
	  second_subject:STRING
	  second_date: DATE_TIME
	make
      do
      	io.put_string ("Hello")
        create a_date.make (2008, 07, 08, 13, 37, 15)

        create a_owner.make ("Alisa", 12345678, "Innopolis University", "a.ivanova@innopolis")

        create a_subject.make_from_string ("Birthday")

        create a_place.make_from_string ("Innopolis University")

        create e

        c1 := e.create_entry(a_date, a_owner, a_subject, a_place)

        print(c1.subject)

		create second_subject.make_from_string("Vasya's birthday")
		e.edit_subject (c1, second_subject)

		print(c1.subject)

		create second_date.make(2018, 12, 12, 13, 37, 15)
		e.edit_date (c1, second_date)

		print(e.get_owner_name (c1))



end
end
