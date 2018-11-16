note
	description: "ski_resort application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature

	person: PERSON
	your_name: STRING

	primary, sec_sk, sec_sb : ARRAYED_LIST[S_ITEM]
	rentals : ARRAYED_LIST[RENTALS]
	r : RENTALS

	i, j, tmp: INTEGER
	s: STRING



	make
	do
		initialize

		rent_items (person)
		print_rentals

		io.put_string ("Return all items... %N")
		return_items (person)
		print_rentals
	end

	initialize
	do
		s := ""
		create rentals.make(0)
		create primary.make(0)
		create sec_sk.make(0)
		create sec_sb.make(0)

		io.put_string ("Enter your name: ")
		io.read_line
		your_name := io.last_string

		create person.make (your_name, "+123456789")
		create r.make(person)

		primary.extend (create {S_ITEM}.make("skies", 5))
		primary.extend (create {S_ITEM}.make("snowboard", 5))

		sec_sk.extend (create {S_ITEM}.make("helmet", 5))
		sec_sk.extend (create {S_ITEM}.make("goggles", 5))
		sec_sk.extend (create {S_ITEM}.make("ski sticks", 5))
		sec_sk.extend (create {S_ITEM}.make("ski boots", 5))
		sec_sb.extend (create {S_ITEM}.make("snowboard boots", 5))
		sec_sk.extend (create {S_ITEM}.make("ski pass", 5))
		sec_sb.extend (create {S_ITEM}.make("ski pass", 5))
		sec_sb.extend (create {S_ITEM}.make("helmet", 5))
		sec_sb.extend (create {S_ITEM}.make("goggles", 5))
	end

	print_rentals
	do
		from i := 1
		until i > rentals.count
		loop
			print ("PERSON: " + rentals[i].person.name + " %N")

			from j := 1
			until j > rentals[i].equipment.count
			loop
				io.put_string (" - " + rentals[i].equipment[j])

				if rentals[i].available = True then
					io.put_string (" (RETUREND)")
				end

				io.put_new_line
				j := j + 1
			end
			i := i + 1
		end
		io.put_new_line
	end

	rent_items (p: PERSON)
	do
		create r.make (p)

		io.put_new_line
		print("Do you want to rent a primary equipment? %NType 1 for YES or 0 for NO: ")
		io.read_integer
		tmp := io.last_integer.twin

		from
		until tmp = 1 or tmp = 0
		loop
			print("Error. Input 1 or 0: ")
			io.read_integer
			tmp := io.last_integer.twin
		end

		if tmp = 1 then

			io.put_new_line
			io.put_string ("Do you want to rent skies or snowboard equipment? %NType 1 for skies or 2 for snowboard: ")
			io.read_integer
			tmp := io.last_integer.twin

			from
			until tmp = 1 or tmp = 2
			loop
				print("Error. Enter only the number: ")
				io.read_integer
				tmp := io.last_integer.twin
			end

			i := tmp

			primary[i].add_number (-1)
			r.add (primary[i].name)
			p.add_primary (primary[i].name)
		end

		io.put_new_line
		io.put_string ("Do you want to rent a secondary equipment? %NType 1 for YES or 0 for NO: ")

		io.read_integer
		tmp := io.last_integer.twin

		from
		until tmp = 1 or tmp = 0
		loop
			print("Error. Input 1 or 0: ")
			io.read_integer
			tmp := io.last_integer.twin
		end

		if tmp = 1 then

			io.put_new_line

			if p.does_person_own ("skies") = True then
				from i := 1
				until i > sec_sk.count
				loop
					print(" Do you want to rent " + sec_sk[i].name + "? %N Type 1 for YES or 0 for NO: ")
					io.read_integer
					tmp := io.last_integer.twin
					io.put_new_line

					if (tmp = 1) and sec_sk[i].number > 1 then
						p.add_secondary (sec_sk[i].name)
						r.add (sec_sk[i].name)
						sec_sk[i].add_number (-1)
					end
					i := i + 1
				end
			end

			if p.does_person_own ("snowboard") = True then
				from i := 1
				until i > sec_sb.count
				loop
					print(" Do you want like to rent " + sec_sb[i].name + "? %N Type 1 for YES or 0 for NO: ")
					io.read_integer
					tmp := io.last_integer.twin
					io.put_new_line

					if (tmp = 1) and sec_sb[i].number > 1 then
						p.add_secondary (sec_sb[i].name)
						r.add (sec_sb[i].name)
						sec_sb[i].add_number (-1)
					end
					i := i + 1
				end
			end

			rentals.extend (r)
		end
	end

	return_items (p: PERSON)
	do
		from i := 1
		until i > p.primary.count
		loop
			from j := 1
			until j > primary.count
			loop
				if primary[j].name ~ p.primary[i] then
					primary[j].add_number (1)
				end
				j := j + 1
			end
			i := i + 1
		end

		from i := 1
		until i > p.secondary.count
		loop
			from j := 1
			until j > sec_sk.count
			loop
				if sec_sk[j].name ~ p.secondary[i] then
					sec_sk[j].add_number (1)
				end
				j := j + 1
			end
			i := i + 1
		end

		from i := 1
		until i > p.secondary.count
		loop
			from j := 1
			until j > sec_sb.count
			loop
				if sec_sb[j].name ~ p.secondary[i] then
					sec_sb[j].add_number (1)
				end
				j := j + 1
			end
			i := i + 1
		end

		p.return_all

		from i := 1
		until i > rentals.count
		loop
			if rentals[i].person = p then
				rentals[i].return
			end
			i := i + 1
		end

		io.put_string ("You successfully returned all items! %N%N")
	end

end
