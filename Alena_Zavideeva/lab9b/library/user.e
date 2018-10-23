class
	USER
create make

feature -- User's Initialization
	name: STRING
	id, age: INTEGER
	rent_books: ARRAY[BOOK]
	fine: INTEGER
	max_books : INTEGER

	make (name_: STRING; age_, id_: INTEGER)
		require
			age_ >= 1

		do
			name := name_
			age := age_
			id := id_
			create rent_books.make_empty
			fine := 0
			max_books := 3

		end

feature -- Query

	size_of_fine: INTEGER
		do
			Result := fine
		end

	book_is_rent(book: BOOK): BOOLEAN
		local
			i: INTEGER
		do
			from
				i := 1
				Result := False
			until
				i > rent_books.count
			loop
				if rent_books[i] = book then
					Result := True
				end
				i := i + 1
			end
		end
	get_age: INTEGER
		do
			Result := age
		end

feature -- Command
	rent_book(book : BOOK; day : DATE)
		require
			user_can_borrow_more_books : rent_books.count + 1 <= max_books
			user_age_is_enough: age >= book.get_age_restrict
		do
			rent_books.force(book, rent_books.count + 1)
			book.change_avaliability (False)
			book.change_day_rent (day)
		end

	return_book(book: BOOK; day: DATE)
		require
			book_is_rent(book)
		local
			i : INTEGER
			user_bookshelf: ARRAY[BOOK]
		do
			punishment(book, day)

			create user_bookshelf.make_empty
			-- Deletion book from list of rent books

			from
				i := 1
			until
				i > rent_books.count
			loop
				if rent_books[i] /= book then
					user_bookshelf.force (rent_books[i], rent_books.count + 1)
				end
				i := i + 1
			end
			rent_books := user_bookshelf
			book.change_avaliability (True)

		end

	punishment(book : BOOK; day : DATE)
		local
			k: INTEGER
		do
			k := (day.relative_duration (book.get_day_rent).days_count)
			if book.is_best_seller = True then
				if k > 3 then
					fine := fine + (k - 3)*300
				end
			else
				if k > 7 then
					fine := fine + (k - 7)*100
				end
			end
		end

	pay_fine(money : INTEGER)
		do
			fine := fine - money

			if
				fine < 0
			then
				fine := 0
			end
		end
end
