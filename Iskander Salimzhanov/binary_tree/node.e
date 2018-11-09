note
	description: "Summary description for {NODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NODE
create
	make

feature
	make(a_value: INTEGER; a_ancestor: detachable NODE)
		do
			set_value(a_value)
			set_ancestor(a_ancestor)
		end

feature
	value: INTEGER
	ancestor: detachable NODE

feature
	set_value(a_value: INTEGER)
		do
			value := a_value
		end

	set_ancestor(a_ancestor: detachable NODE)
		do
			if attached a_ancestor as aancestor then
				ancestor := a_ancestor
			else
				ancestor := Void
			end
		end

	is_root: BOOLEAN
		do
			if attached ancestor as aancestor then
				Result := false
			else
				Result := true
			end
		end
end
