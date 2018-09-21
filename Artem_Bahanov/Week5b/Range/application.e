class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			create r1.make(1, 4)
			create r2.make(3, 7)
			create r3.make(10, 15)
			create r4.make(2, 1)
			r1.print1("r1")
			r2.print1("r2")
			r3.print1("r3")
			r4.print1("r4")
			r1 := r1.add (r2)
			r1.print1 ("r1 = r1 + r2")
			r1 := r1.subtract(r2)
			r1.print1 ("r1 - r2")
		end

	r1, r2, r3, r4: RANGE

end
