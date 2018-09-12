note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR



	feature
		create_entry(a_date:DATE_TIME; a_owner:PERSON; a_subject:STRING; a_place: STRING):ENTRY
		do
			create result.make(a_date, a_owner, a_subject, a_place)
		end


		edit_subject (e: ENTRY; new_subject: STRING)
    		do
      			 e.subject := new_subject
   			end

  		edit_date (e: ENTRY; new_date: DATE_TIME)
    		do
      			e.date := new_date
   			 end

  		get_owner_name (e: ENTRY): STRING
   		 do
      		 result := e.owner.name
    		end

  in_conflict (e1, e2: ENTRY): BOOLEAN
    do
      if
        e1.date.year = e2.date.year and
        e1.date.month = e2.date.month and
        e1.date.day = e2.date.day and
        e1.date.hour = e2.date.hour and
        e1.date.minute = e2.date.minute and
        e1.date.seconds = e2.date.seconds
        or e1.place.is_equal (e2.place)
      then
        result := true
      else
        result := false
      end

    end

end
