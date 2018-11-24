note
	description: "queue application root class"
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

			-- Run application.

		local

			q: QUEUE1

		do

			--| Add your code here

			create q.make

			q.add ("Math", -10)

			q.add ("Physics", 18)

			q.extract.print_event

			q.add ("Programming", 7)

		end



end
