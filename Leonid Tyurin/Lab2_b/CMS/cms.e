class
	CMS

feature

	create_contact(n:STRING; p:INTEGER; w:STRING; e:STRING; emerge: detachable CONTACT):CONTACT
		local
			c:CONTACT
		do
			create c.init
			c.set_name (n)
			c.set_phone_number (p)
			c.set_work_place (w)
			c.set_email (e)
			c.set_emergency_contact (emerge)
			result := c

		end

	edit_contact(c:CONTACT; nam:STRING; phone:INTEGER; work:STRING; mail:STRING; emerge: detachable CONTACT)
		do
			c.set_name (nam)
			c.set_work_place (work)
			c.set_phone_number (phone)
			c.set_email (mail)
			c.set_emergency_contact (emerge)
		end

	add_emergency_contact(c1: CONTACT; c2: detachable CONTACT)
		do
			c1.set_emergency_contact(c2)
		end

	remove_emergency_contact(c:CONTACT)
		do
			c.set_emergency_contact (void)
		end

end
