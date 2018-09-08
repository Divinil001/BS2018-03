note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	
class 
    PERSON

create 
    create_class

feature
    name:STRING
    phone_number:INTEGER    
    work_place:STRING
    email:STRING
    
feature 
    create_class(an_name:STRING;a_number:INTEGER;work:STRING;a_email:STRING)
        do
            name:=an_name
            phone_number:=a_number
            work_place:=work
            email:=a_email
        end
        
    get_name: STRING
        do
            Result:=name
        end
end
