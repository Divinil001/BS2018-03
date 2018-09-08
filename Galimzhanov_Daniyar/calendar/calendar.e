class
    CALENDAR

feature
    create_entry(an_date:TIME;an_owner:PERSON;an_subject:STRING;an_place:STRING): ENTRY
    local new_entry: ENRTY
        do
            create new_enrty.creation_class(an_date, an_owner, an_subject, an_place)
            Result:=new_entry
        end
    
    edit_subject(event:ENTRY; new_subject:STRING)
	    do
		    event.set_subject (new_subject)
	    end

	edit_date(event:ENTRY; new_date:TIME)
	    do
		    event.set_date (new_date)
	    end

	get_owners_name(event:ENTRY):STRING
	    do
		    Result:=event.owner.name
	    end
	    
feature
    	in_coflict(event1,event2:ENTRY):BOOLEAN
	        do
		        if event1.date.is_equal(event2.date) then
			        Result:=True
		        else
		            Result:=False
	            end
		        if event1.place.is_equal(event1.place) then
		            Result:=True
			    else
			        Result:=False
		        end
	        end
    
end
