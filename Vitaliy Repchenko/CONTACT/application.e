note
	description: "CMS_2 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION
create
	make_2
feature
	c1: CONTACT
	c2: CONTACT
	c3: CONTACT
	cms: CMS

	make_2
		do
			create cms

			c1:= cms.create_contact("YA",1234567890,"STUDENT","C1")
			c2:= cms.create_contact("MAMA", 7987654321, "VOID", "C2")
			c3:= cms.create_contact("PAPA", 1234543210, "WORKER", "C3")

			cms.add_emergency_contact (c1, c2)
			cms.add_emergency_contact (c2, c3)

			cms.edit_contact(c1, c1.name, 5642783460, c1.work_place, "ETO YA")
			cms.remove_emergency_contact (c1)
			cms.remove_emergency_contact (c2)

		end
end
