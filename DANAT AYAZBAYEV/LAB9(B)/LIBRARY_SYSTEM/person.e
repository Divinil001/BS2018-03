note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	init

feature
	name : STRING
	age : INTEGER
	address : STRING
	phone : INTEGER_64
	card : INTEGER  --Library card number
	books : ARRAYED_LIST[BOOK]  --List of books of this person
	taken : ARRAYED_LIST[INTEGER]  --How many days passed from ordering i-th book
	fine : ARRAYED_LIST[INTEGER]  --A fine that person should pay for a certain book

feature
	init (new_name : STRING; new_age : INTEGER; new_address : STRING; new_phone : INTEGER_64; new_card : INTEGER)
		do
			set_name(new_name)
			set_age(new_age)
			set_address(new_address)
			set_phone(new_phone)
			set_card(new_card)
			create books.make(0)
			create taken.make(0)
			create fine.make(0)
		end
	set_name (new_name : STRING)
		do
			name := new_name
		end
	set_age (new_age : INTEGER)
		do
			age := new_age
		end
	set_address (new_address : STRING)
		do
			address := new_address
		end
	set_phone (new_phone : INTEGER_64)
		do
			phone := new_phone
		end
	set_card (new_card : INTEGER)
		do
			card := new_card
		end
	count_fine  --Going through all person's books and count fine 
		local
			i : INTEGER
		do
			from i := 1 until i > taken.count loop
				if books[i].is_best_seller then
					if taken[i] > 14 then
						if fine[i] + 100 <= books[i].get_price then
							fine[i] := fine[i] + 100
						end
					end
				else
					if taken[i] > 21 then
						if fine[i] + 100 <= books[i].get_price then
							fine[i] := fine[i] + 100
						end
					end
				end
				i := i + 1
			end
		end
	increase
		local
			i : INTEGER
		do
			from i := 1 until i > taken.count loop
				taken[i] := taken[i] + 1
				i := i + 1
			end
		end
	order_book (book : BOOK)
		do
			books.extend (book)
			taken.extend (0)
			fine.extend (0)
		end
	remove (index : INTEGER)--Removing the book from the person's list
		do
			books.go_i_th (index)
			books.remove
			taken.go_i_th (index)
			taken.remove
			fine.go_i_th (index)
			print("%NThank you for returning the book, " + name + "!%NYou paid " + fine[index].out + " rubles as a fine.%N%N")
			fine.remove
		end


end
