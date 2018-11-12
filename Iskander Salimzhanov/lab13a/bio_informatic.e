note
	description: "Summary description for {BIO_INFORMATIC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIO_INFORMATIC
inherit
	COMPUTER_SCIENTIST
	undefine
		introduce,
		make
	end

	BIOLOGIST
	redefine
		introduce
	end

create
	make

feature {ANY}
	introduce
	do
		print("Scientist's id: ")
		print(id)
		print("%N")
		print("Scientist's name: ")
		print(name)
		print("%N")
		print("Scientist's discipline: ")
		print(discipline)
		print("%N")
		print("Scientist's pet: ")
		print("%N Type: ")
		print(pet.get_type)
		print("%N Name: ")
		print(pet.get_name)
		print("%N")
		print("Bio: ")
		print(bio)
		print("%N")
	end
end

