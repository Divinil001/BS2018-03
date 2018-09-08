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

feature {NONE} -- Initialization

	mc:CMS
 	c1, c2, c3:CONTACT


	make
		do

			create mc


			c3 := mc.create_contact ("Tom", 791, "Goo", "@inn", void)
			c2 := mc.create_contact ("Ivan", 791, "Ya", "@ru",c3)
			c1 := mc.create_contact ("John", 7961, "Inno", "@mail",c2)

			mc.edit_contact (c2, c2.name, 785, c2.work_place, "@newbox", c2.call_emergency)

			mc.remove_emergency_contact (c2)

			mc.remove_emergency_contact (c3)

		end

end
