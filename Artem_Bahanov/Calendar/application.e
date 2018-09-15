dclass
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create p1.make("Artem Bahanov", 89629524796, "Innopolis University", "artembakhanov@gmail.com")
			create p2.make("Meme A", 100, "Emergency", "sos@sos.sos")
			create c.make
			create d1.make (10, 20, 10)
			create d2.make (13, 45, 0)
			create d3.make (15, 10, 0)
			create d4.make (9, 0, 0)
			create day1.make(1)
			create day2.make(2)
			e1 := c.create_entry (p1, d1, "Algebra", "108")
			e2 := c.create_entry (p2, d1, "English", "107")
			e3 := c.create_entry (p1, d2, "ITP 1", "304")
			e4 := c.create_entry (p2, d3, "CompArch", "108")
			e5 := c.create_entry (p1, d4, "Algebra (lab)", "314")
			c.add_day(day1)
			c.add_day(day2)
			c.add_entry (e1, 1)
			c.add_entry (e3, 1)
			c.add_entry (e5, 1)
			c.add_entry (e1, 2)
			c.add_entry (e2, 2)
			c.add_entry (e4, 2)
			Io.put_string (c.printable_month)
			--Io.put_boolean (c.in_conflict (e1, e2))
		end
		p1, p2: PERSON
		c: CALENDAR
		d1, d2, d3, d4: TIME
		e1, e2, e3, e4, e5: ENTRY
		day1, day2 : DAY
end
