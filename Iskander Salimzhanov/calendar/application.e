note
	description: "calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	WORK

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
		local
			name: STRING
			phone: INTEGER
			work_place: STRING
			email: STRING
			n: INTEGER
			m: INTEGER
			i: INTEGER
			j: INTEGER
			e: ENTRY
			day: DAY
			owner: PERSON
			calendar: CALENDAR
			hour: INTEGER
			min: INTEGER
			sec: INTEGER
			date: DT_TIME
		do
			print("Type amount of days:")
			create calendar.fill_in()
			io.read_integer
			n := io.last_integer
			from
				i := 0
			until
				i >= n
			loop
				create day.fill_in (j)
				print("Type amount of events: ")
				io.read_integer
				m := io.last_integer
				from
					j := 0
				until
					j >= m
				loop
					print("Owner's name, phone, job, email: ")
					io.read_line
					name := io.last_string
					io.read_integer
					phone := io.last_integer
					io.read_line
					work_place := io.last_string
					io.read_line
					email := io.last_string
					create owner.fill_in(name, phone, work_place, email)
					print("Information about date: hour, minutes, seconds: ")
					io.read_integer
					hour := io.last_integer
					io.read_integer
					min := io.last_integer
					io.read_integer
					sec := io.last_integer
					create date.make (hour, min, sec)
					print("Type subject and place: ")
					io.read_line
					name := io.last_string
					io.read_line
					work_place := io.last_string
					create e.fill_in (date, owner, name, work_place)
					calendar.add_entry (e, i)
					j := j + 1
				end
				i := i + 1
			end
		name := calendar.printable_month
		print(name)
	end
end
