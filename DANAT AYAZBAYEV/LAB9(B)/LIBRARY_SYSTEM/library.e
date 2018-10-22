note
	description: "LIBRARY application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	LIBRARY

inherit
	ARGUMENTS

create
	make

feature
	add_person (p1 : PERSON)
		do
			people.extend(p1)
		end
	add_book (p1 : BOOK)
		do
			all_books.extend(p1)
			queue.extend (help)
		end
	new_day
		local
			i : INTEGER
		do
			from i := 1 until i > people.count loop
				people[i].increase
				people[i].count_fine
				i := i + 1
			end
		end
	order_book (p1 : PERSON; book_index : INTEGER)
		do
			if all_books[book_index].restrict and p1.age < 13 then
				print("%NWe are really sorry, " + p1.name + "!You are not old enough to order this book%N")
			elseif all_books[book_index].available then
				p1.order_book(all_books[book_index])
				all_books[book_index].set_b3(false)
				--If this book is available, person includes it in his list
			else
				print("%NWe are really sorry, " + p1.name + "!%NThere is a queue for this book of " + queue[book_index].count.out + " people.%NInclude you in the queue? [Y/N]%N")
				io.read_line
				if io.last_string.out ~ "Y" then
					queue[book_index].extend (p1)
				end
				--If this book is unavailable, person is asked for waiting or not taking the book
			end
		end
	return_book (p1 : PERSON; book_index_in_person : INTEGER; book_index_in_library : INTEGER)
		local
			p2 : PERSON
		do
			p2 := p1
			p1.remove(book_index_in_person)
			if queue[book_index_in_library].count = 0 then
				all_books[book_index_in_library].set_b3(true)
				--If there are not queue for this book anymore, it becomes available
			else
				p2 := (queue[book_index_in_library])[1]
				p2.order_book(all_books[book_index_in_library])
				queue[book_index_in_library].remove_right
				--First element of queue is the first people in the queue
				--If people who was using the book returned the book, a new person started to use it
			end
		end


feature
	people : ARRAYED_LIST[PERSON]   --List of all people registered in library
	all_books : ARRAYED_LIST[BOOK]  --List of all books in library
	queue : ARRAYED_LIST[ARRAYED_LIST[PERSON]]  --Queue waiting for a certain the book to
	help : ARRAYED_LIST[PERSON] --Just helping thing

feature {NONE} --Do not make incorrect creation
	make
		local
			danat : PERSON
			some_guy : PERSON
			another : PERSON
			ca : BOOK
			i : INTEGER
		do
			create help.make (0)
			create people.make (0)
			create all_books.make (0)
			create queue.make (0)
			create danat.init ("Danat", 17, "Universitetskaya-1-4", 89869069524, 1)
			create some_guy.init ("Anonym", 17, "Random", 89866666666, 2)
			create another.init ("A", 1, "123", 123123, 3)
			add_person(danat)
			add_person(some_guy)
			add_person(another)
			create ca.init ("CA", false, false, 250)
			add_book(ca)
			order_book(danat, 1)
			from i := 1 until i > 24 loop
				new_day
				i := i + 1
			end
			order_book(some_guy, 1)
			order_book(another, 1)
			return_book(danat, 1, 1)
			return_book(another, 1, 1)
			order_book(danat, 1)
			return_book(danat, 1, 1)
		end
end
