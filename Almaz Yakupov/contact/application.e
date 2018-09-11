note
	description: "coams_v3 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	cms: CMS
	c1: detachable CONTACT
	c2: detachable CONTACT
	c3: detachable CONTACT

feature
	make
		do
			create cms

			c1 := cms.create_contact("Almaz", 123456789, "SpaceX", "mail_1@mail.mail", Void)
			c2 := cms.create_contact("Salavat", 987654321, "SpaceX", "mail_2@mail.mail", c1)
			c3 := cms.create_contact("Renat", 987656789, "SpaceX", "mail_3@mail.mail", c2)

			print(c2)
			cms.edit_contact (c2, Void, 111111111, Void, "mail_4@mail.mail", Void)
			print(c2)

			cms.remove_emergency_contact(c2)
			cms.remove_emergency_contact (c3)
		end

end
