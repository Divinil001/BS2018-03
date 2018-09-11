note
    description : "root class of the application"
    date        : "$Date$"
    revision    : "$Revision$"

class
    APPLICATION

inherit
    ARGUMENTS

create
    make
    
feature
        create_person(a_name:STRING;number:INTEGER;a_work:STRING;an_email:STRING): PERSON
        local new_object:PERSON
            do
                create new_object.create_class(a_name, number, a_work, an_email)
                Result:=new_object
            end     

feature
    object: PERSON
    entry1: ENTRY
    entry2: ENTRY
    time: TIME

feature {NONE} -- Initialization

    make
            -- Run application.
        do
            -- Add your code here
            object := create_person("Sam", 322855,"worker", "df@email.com")
            entry1 := create_entry(time, object, "event", "Zurich")
            
        end

end

