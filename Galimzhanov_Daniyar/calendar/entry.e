class 
    ENTRY

create
    creation_class
    
feature
    date:TIME
    owner:PERSON
    subject:STRING
    place:STRING
    
feature
    creation_class(a_date:TIME;a_owner:PERSON;a_subject:STRING;a_place:STRING)
        do
            date:=a_date
            owner:= a_owner
            subject:=a_subject
            place:=a_place
        end

end

