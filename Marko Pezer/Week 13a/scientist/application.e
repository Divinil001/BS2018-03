note
	description: "scientist application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	cs: COMPUTER_SCIENTIST
	b: BIOLOGIST
	bi: BIO_INFORMATIC
	my_lab: LAB

	make
	do
		create cs.make (1, "John", "Computer Scientist")
		create b.make (2, "Mike", "Biologist", "Rex")
		create bi.make (3, "Julia", "Bio-Informatic", "Best scientist ever", "Cat")

		cs.introduce
		b.introduce
		bi.introduce

		create my_lab.make

		my_lab.add_member (cs)
		my_lab.add_member (b)
		my_lab.add_member (bi)

		my_lab.print_lab

		my_lab.remove_member

		my_lab.print_lab
	end

end
