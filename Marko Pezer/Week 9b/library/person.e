note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	make

feature

	id: INTEGER
	name: STRING
	address: STRING
	phone: STRING
	age: INTEGER
	kid: BOOLEAN
	number: INTEGER
	books: ARRAY[INTEGER]

feature

	make (i: INTEGER; n, ad, p: STRING; ag: INTEGER)
	require
		correct_age: ag > 0
	do
		id := i
		name := n
		address := ad
		phone := p
		age := ag

		if age <= 12 then
			kid := True
		else
			kid := False
		end

		number := 0
		create books.make_filled (0, 1, 5)
	end

	check_out_book (b: BOOK)
	do
		if ((b.for_kids = False) and (kid = True)) then
			io.put_string ("This book is not for kids! %N")
		elseif number = 5 then
			io.put_string ("You have already have 5 books! %N")
		elseif b.taken = True then
			io.put_string ("This book is currently taken! %N")
		else
			number := number + 1
			b.set_taken (True)
			books.put (b.id, number)
			io.put_string ("You have successfully check out the book: " + b.name + "%N")
		end
	end

	return_book (b: BOOK)
	local
		i, j: INTEGER
		flag: BOOLEAN
	do
		flag := False

		from i := 1
		until i > number
		loop
			if b.id = books.item (i) then

				flag := True
				number := number - 1
				books.put (0, i)

				from j := i
				until j > number
				loop
					books.put (books.item (j + 1), j)
					j := j + 1
				end

			end
			i := i + 1
		end

		if flag = False then
			io.put_string ("You did not check out this book! %N")
		else
			b.set_taken (False)
			io.put_string ("You successfully returned the book: " + b.name + "%N")
		end
	end

	print_info
	local
		i: INTEGER
	do
		io.put_string ("PERSON INFO: %N%N")
		io.put_string (" ID:      " + id.out + "%N")
		io.put_string (" Name:    " + name + "%N")
		io.put_string (" Address: " + address + "%N")
		io.put_string (" Phone:   " + phone + "%N")
		io.put_string (" Age:     " + age.out + "%N")
		io.put_string (" Books:   " + number.out + "%N")
		io.put_new_line
	end

end
