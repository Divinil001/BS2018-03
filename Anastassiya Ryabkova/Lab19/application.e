note
	description: "multipe_inheritance application root class"
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

			cs: COMPUTER_SCIENTIST

			bio: BIOLOGIST

			bio_info: BIO_INFORMATIC

			lab: LAB

		do

			create cs.make ("Member 1", 1000)

			create bio.make ("Member 2", 1001, "Pet 1")

			create bio_info.make ("Member 3", 1002, "Pet 2", "Ph.D")

			create lab.make

			lab.add_member (cs)

			lab.add_member (bio)

			lab.add_member (bio_info)

			lab.introduce_all

			io.new_line

			lab.remove_member (bio)

			lab.introduce_all

		end



end
