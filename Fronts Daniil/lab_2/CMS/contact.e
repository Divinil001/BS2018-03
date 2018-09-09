note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT

feature

	name: detachable STRING

	phone: detachable INTEGER

	work_place: detachable STRING

	email: detachable STRING

	emergency_contact: detachable CONTACT

feature
	--setters

	set_name (n_name: STRING)
		do
			name := n_name
		end

	set_phone (n_phone: INTEGER)
		do
			phone := n_phone
		end

	set_work_place (n_work_place: STRING)
		do
			work_place := n_work_place
		end

	set_email (n_email: STRING)
		do
			email := n_email
		end

	set_emergency_contact (n_emergency_contact: detachable CONTACT)
		do
			if Current /= void then
				emergency_contact := n_emergency_contact
			end
		end

	remove_emergency_contact
		do
			if Current /= void then
				emergency_contact := Void
			end
		end

end
