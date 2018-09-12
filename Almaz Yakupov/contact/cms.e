note
	description: "Summary description for {CMS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CMS

feature
	create_contact(i_name: STRING; i_phone_number: INTEGER; i_work_place: STRING; i_email: STRING; i_call_emergency: detachable CONTACT): CONTACT
		local
			cash: detachable CONTACT
		do
			create cash.fill_contact(i_name, i_phone_number, i_work_place, i_email, i_call_emergency)
			Result := cash
		end

feature
	edit_contact(i_c: detachable CONTACT; i_name: detachable STRING; i_phone_number: detachable INTEGER; i_work_place: detachable STRING; i_email: detachable STRING; i_call_emergency: detachable CONTACT)
		do
			if attached i_c then
				if attached i_name then
					i_c.set_name(i_name)
				end
				if attached i_phone_number then
					i_c.set_phone_number(i_phone_number)
				end
				if attached i_work_place then
					i_c.set_work_place(i_work_place)
				end
				if attached i_email then
					i_c.set_email(i_email)
				end
				if attached i_call_emergency then
					i_c.set_call_emergency(i_call_emergency)
				end
			end
		end

feature
	add_emergency_contact(i_c1: detachable CONTACT; i_c2: detachable CONTACT)
		do
			if attached i_c1 and attached i_c2 then
				i_c1.set_call_emergency (i_c2)
			end
		end

feature
	remove_emergency_contact(i_c: detachable CONTACT)
		do
			if attached i_c then
				i_c.remove_call_emergency()
			end
		end

end
