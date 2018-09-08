class
	DAY
	create make

	feature
		date: INTEGER
		events: LINKED_LIST[ENTRY]
	feature
		make(date_a: INTEGER; events_a: LINKED_LIST[ENTRY])
			do
				date := date_a
				events := events_a
			end
		printable_day:STRING
			local
				i: INTEGER
			do
				Result:= " - Date: " + date.out + "%N"
				from
					i := 1
				until
					i > events.count
				loop
					Result.append(events[i].printable_entry)
					i := i + 1
				end
			end

end
