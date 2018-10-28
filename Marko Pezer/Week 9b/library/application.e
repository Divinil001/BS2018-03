note
	description: "library application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	b1, b2, b3, b4, b5: BOOK
	p1, p2, p3: PERSON

	make
	do
		create b1.make (1, "Harry Potter", True)
		create b2.make (2, "Anna Karenina", False)
		create b3.make (3, "Lord of the Rings", True)
		create b4.make (4, "The Great Gatsby", False)
		create b5.make (5, "Don Quixote", False)

		create p1.make (1, "John", "Innopolis 1", "+7123456", 10)
		create p2.make (2, "Mike", "Innopolis 2", "+7123123", 18)
		create p3.make (3, "Joe", "Innopolis 3", "+7654321", 40)

		p1.print_info

		io.put_string ("PERSON 1: Check out book: Anna Karenina... %N")
		p1.check_out_book (b2)
		io.put_new_line

		io.put_string ("PERSON 1: Check out book: Harry Potter... %N")
		p1.check_out_book (b1)
		io.put_new_line

		p1.print_info

		io.put_string ("PERSON 2: Check out book: Harry Potter... %N")
		p2.check_out_book (b1)
		io.put_new_line

		io.put_string ("PERSON 1: Return book: Harry Potter... %N")
		p1.return_book (b1)
		io.put_new_line

		io.put_string ("PERSON 2: Check out book: Harry Potter... %N")
		p2.check_out_book (b1)
		io.put_new_line

		p1.print_info
		p2.print_info

	end

end
