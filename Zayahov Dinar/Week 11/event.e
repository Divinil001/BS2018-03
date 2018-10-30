note
	description: "Summary description for {EVENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EVENT

create
	set_event

feature
	time_tag: INTEGER assign set_tag
	name: STRING assign set_name

feature
	set_event(t: INTEGER; n: STRING)
		do
			time_tag:=t
			name:=n
		end

	set_tag(t: INTEGER)
		do
			time_tag:=t
		end

	set_name(n: STRING)
		do
			name:=n
		end

end
