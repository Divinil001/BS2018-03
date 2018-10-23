class
	LIBRARY
create make

feature
	users: ARRAY[USER]
	books: ARRAY[BOOK]

feature
	make
		do
			create users.make_empty
			create books.make_empty
		end
feature -- Commands
	add_user(user: USER)
		do
			users.force(user, users.count + 1)
		end

	add_book(book: BOOK)
		do
			books.force(book, books.count + 1)
		end

feature -- Query
	print_books: STRING
		local
			i : INTEGER
		do
			from
				i := 1
				Result := ""
			until
				i > books.count
			loop
				Result := Result + books[i].get_name + "%N"
				i := i + 1
			end
		end

	find_book_by_name(name: STRING): INTEGER -- request of book's ID
		local
			break : BOOLEAN
			i : INTEGER
		do
			from
				i := 1
				break := False
			until
				i > books.count or break = True
			loop
				if books[i].get_name = name then
					Result := i
					break := True
				end
				i := i + 1
			end
		end
		
	amount_of_users: INTEGER
		do
			Result := users.count
		end

	amount_of_books: INTEGER
		do
			Result := books.count
		end
end
