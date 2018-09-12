note
	description: "contact_of_a_management_system application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			local
			c1, c2, c3: CONTACT
			e: CMS
			a_name: STRING
			a_phone_number: STRING
			a_work_place: STRING
			a_email: STRING
		do
			io.put_string ("Enter the name:")
			io.read_line
			a_name:= io.last_string

			io.put_string ("Enter the phone number:")
			io.read_line
			a_phone_number:= Io.last_string

			io.put_string("Enter the work place:")
			io.read_line
			a_work_place:= Io.last_string

			io.put_string ("Enter the email:")
			io.read_line
			a_email:= Io.last_string
			io.new_line

			create c1.create_contact(a_name, a_phone_number, a_work_place, a_email)


			io.put_string ("Enter the name:")
			io.read_line
			a_name:= io.last_string

			io.put_string ("Enter the phone number:")
			io.read_line
			a_phone_number:= Io.last_string

			io.put_string("Enter the work place:")
			io.read_line
			a_work_place:= Io.last_string

			io.put_string ("Enter the email:")
			io.read_line
			a_email:= Io.last_string
			io.new_line

			create c2.create_contact(a_name, a_phone_number, a_work_place, a_email)


			io.put_string ("Enter the name:")
			io.read_line
			a_name:= io.last_string

			io.put_string ("Enter the phone number:")
			io.read_line
			a_phone_number:= Io.last_string

			io.put_string("Enter the work place:")
			io.read_line
			a_work_place:= Io.last_string

			io.put_string ("Enter the email:")
			io.read_line
			a_email:= Io.last_string
			io.new_line

			create c3.create_contact(a_name, a_phone_number, a_work_place, a_email)

			create e
			e.add_emergency_contact (c1, c2)

			e.add_emergency_contact (c2, c3)

			io.put_string ("Enter the new name:")
			io.read_line
			a_name:= io.last_string

			io.put_string ("Enter the new phone number:")
			io.read_line
			a_phone_number:= Io.last_string

			io.put_string("Enter the new work place:")
			io.read_line
			a_work_place:= Io.last_string

			io.put_string ("Enter the new email:")
			io.read_line
			a_email:= Io.last_string
			io.new_line

			e.edit_contact (c2, a_name, a_phone_number, a_work_place, a_email)

			e.remove_emergency_contact (c2)

			e.remove_emergency_contact (c3)


		end
end

