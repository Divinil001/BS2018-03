note
	description: "cms application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make

		local

			a: STRING
			b: INTEGER
			c: STRING
			d: STRING

		do
			-- Contact 1

			io.put_string ("%NCREATE CONTACT 1: %N %N")

			io.put_string ("Input name: ")
			io.read_line
			a := io.last_string.twin

			io.put_string ("Input phone number: ")
			io.read_integer
			b := io.last_integer.twin

			io.put_string ("Input work place: ")
			io.read_line
			c := io.last_string.twin

			io.put_string ("Input email: ")
			io.read_line
			d := io.last_string.twin

			create c1.create_contact(a, b, c, d)

			-- Contact 2

			io.put_string ("%NCREATE CONTACT 2: %N %N")

			io.put_string ("Input name: ")
			io.read_line
			a := io.last_string.twin

			io.put_string ("Input phone number: ")
			io.read_integer
			b := io.last_integer.twin

			io.put_string ("Input work place: ")
			io.read_line
			c := io.last_string.twin

			io.put_string ("Input email: ")
			io.read_line
			d := io.last_string.twin

			create c2.create_contact(a, b, c, d)

			-- Contact 3

			io.put_string ("%NCREATE CONTACT 3: %N %N")

			io.put_string ("Input name: ")
			io.read_line
			a := io.last_string.twin

			io.put_string ("Input phone number: ")
			io.read_integer
			b := io.last_integer.twin

			io.put_string ("Input work place: ")
			io.read_line
			c := io.last_string.twin

			io.put_string ("Input email: ")
			io.read_line
			d := io.last_string.twin

			create c3.create_contact(a, b, c, d)

			-- Add emergencies

			c1.add_emergency (c2)
			c2.add_emergency (c3)

			-- Change Contact 2

			io.put_string ("%NEDIT CONTACT 2 INFO: %NIf you don't want to change some of info leave it empty!%N %N")

			io.put_string ("Input new name: ")
			io.read_line
			a := io.last_string.twin

			io.put_string ("Input new phone number: ")
			io.read_integer
			b := io.last_integer.twin

			io.put_string ("Input new work place: ")
			io.read_line
			c := io.last_string.twin

			io.put_string ("Input new email: ")
			io.read_line
			d := io.last_string.twin

			edit_contact (c2, a, b, c, d)

			c2.remove_emergency
			io.put_string ("Emergency of Contact 2 removed successfully! %N")
			c3.remove_emergency
			io.put_string ("Emergency of Contact 3 removed successfully! %N")

		end

		c1: CONTACT
		c2: CONTACT
		c3: CONTACT

		feature

			edit_contact (which_class: CONTACT; aa: STRING; bb: INTEGER; cc: STRING; dd: STRING)
			do

				if aa.is_equal ("") = false then
					which_class.set_name (aa)
				end

				which_class.set_phone_number (bb)

				if cc.is_equal ("") = false then
					which_class.set_work_place (cc)
				end

				if dd.is_equal ("") = false then
					which_class.set_email (dd)
				end

				io.put_string ("%NContact info changed successfully! %N %N")

			end

end
