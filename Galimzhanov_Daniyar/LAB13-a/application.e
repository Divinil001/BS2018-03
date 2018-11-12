note
	description: "project_lab13a application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	biologist:BIOLOGIST
	bioinformatic:BIO_INFORMATIC
	lab:LAB

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			io.new_line
			create biologist.create_biolog("Robert", 1234, "Animals", "Keks")
			io.new_line

			print(biologist.introduce)

			io.new_line


			create bioinformatic.create_bioinfo("Fiona", "Jake", "CYBERTATARSTAN", 6667 )
			io.new_line
			bioinformatic.set_bio ("I worked in...")
			print(bioinformatic.introduce)
			io.new_line
			io.new_line

			create lab.make


			lab.add_member ("Andrew")
			lab.add_member ("Mahmood")
			lab.add_member ("Ordinator")
			lab.add_member ("Dzunhuinvchai")
			lab.introduce_all

			lab.remove_member ("Andrew")
			lab.remove_member ("Ordinator")
			print("%NAfter removing member %N")
			--print("%N")
			lab.introduce_all

		end

end
