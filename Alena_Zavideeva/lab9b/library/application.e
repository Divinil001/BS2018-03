class
	APPLICATION
create
	make

feature

	library: LIBRARY
	book: BOOK
	user: USER
	make
		do
			create library.make
			create book.make("alice from wonderland", 12, True, library.amount_of_books + 1)
			library.add_book (book)

			create user.make("Alice", 23, library.amount_of_users + 1)
			library.add_user(user)

			user.rent_book (book, create {DATE}.make (2018, 1, 2))
			user.return_book (book, create {DATE}.make (2018, 2, 15))

			print(user.size_of_fine)

		end

end
