note
	description: "CMS application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
    c1: CONTACT
    c2: CONTACT
    c3: CONTACT
    cms: CMS
    
	make
		do
            create cms
		
            c1 := cms.create_contact("Mom", 1234567890, "Workplace 1", "my.mom@gmail.com")
		
            create c1.make("Mom", 1234567890, "Workplace 1", "my.mom@gmail.com")
            create c2.make("Dad", 1234567809, "Workplace 2", "my.dad@gmail.com")
            create c3.make("Prof. Meyer", 1111111111, "Innopolis University", "b.meyer@innopolis.ru")
            
            cms.add_emergency_contact(c1, c2)
            cms.add_emergency_contact(c2, c3)
            
            c2.set_name("Father")
            c2.set_email("my.dad.2@gmail.com")
            cms.remove_emergency_contact(c2)
            cms.remove_emergency_contact(c3)
		end

end
