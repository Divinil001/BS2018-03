note
	description: "CALENDAR application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

inherit
	ARGUMENTS

create
	make

feature
	my_list : ARRAYED_LIST[DAY]
	list_length : INTEGER

feature {NONE}
	make
		local
			ent : ENTRY
			a_date : THE_TIME
			the_owner : PERSON
			ent2 : ENTRY
			a_date2 : THE_TIME
			the_owner2 : PERSON
			some_list : ARRAYED_LIST[ENTRY]
		do
			create my_list.make (0)
			create some_list.make (0)
			list_length := 0
			create the_owner.init_person("DANAT", 500396, "INNOPOLIS UNIVERSITY", "danat.ayazbayev@gmail.com")
			create a_date.time_init(13, 15)
			create ent.entry_init(a_date, the_owner, "ETHNO-VILLAGE", "READING HALL")
			create the_owner2.init_person("SOME_OTHER_GUY", 500396, "INNOPOLIS UNIVERSITY", "danat.ayazbayev@gmail.com")
			create a_date2.time_init(14, 19)
			create ent2.entry_init(a_date2, the_owner2, "ETHNO-VILLAGE", "PLAYGROUND")
			add_entry(ent, 9)
			add_entry(ent2, 9)
			some_list := in_conflict(9)
			print(some_list[1].get_owners_name + "%N")
			print(printable_month)
		end

feature
	days : ARRAYED_LIST[DAY]
		do
			Result := my_list
		end
	add_entry (e : ENTRY; the_day : INTEGER)
		local
			i : INTEGER
			ended : BOOLEAN
			day_added : DAY
		do
			ended := FALSE
			from
				i := 1
			until
				i > list_length or ended = TRUE
			loop
				if my_list[i].get_day = the_day then
					my_list[i].add_event(e)
					ended := TRUE
				end
				i := i + 1
			end
			if ended = FALSE then
				create day_added.day_init(the_day)
				day_added.add_event(e)
				my_list.extend(day_added)
				list_length := list_length + 1
			end
		end
	edit_subject (e : ENTRY; new_subject : STRING)
		do
			e.edit_the_subject (new_subject)
		end
	edit_date (e : ENTRY; new_date : THE_TIME)
		do
			e.edit_the_date (new_date)
		end
	get_owner_name (e : ENTRY) : STRING
		do
			Result := e.get_owners_name
		end
	in_conflict (the_day : INTEGER) : ARRAYED_LIST[ENTRY]
		local
			i : INTEGER
			empty_list : ARRAYED_LIST[ENTRY]
			ended : BOOLEAN
		do
			create empty_list.make(0)
			ended := FALSE
			Result := empty_list
			from
				i := 1
			until
				i > list_length or ended = TRUE
			loop
				if my_list[i].get_day = the_day then
					Result := my_list[i].get_overlapped
					ended := TRUE
				end
				i := i + 1
			end
		end
	printable_month : STRING
		local
			i : INTEGER
		do
			Result := ""
			from
				i := 1
			until
				i > list_length
			loop
				Result := Result + "DAY " + my_list[i].get_day.out + ":%N"
				Result := Result + my_list[i].print_events
				Result := Result + "%N"
				i := i + 1
			end
		end
end
