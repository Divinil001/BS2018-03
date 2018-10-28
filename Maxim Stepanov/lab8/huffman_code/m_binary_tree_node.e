note
	description: "Summary description for {M_BINARY_TREE_NODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	M_BINARY_TREE_NODE [G]

create
	make

feature

	info: G
	left: detachable like current
	right: detachable like current

feature

	make (value: G)
		do
			info := value
			left := void
			right := void
		end

	height: INTEGER
		local
			h, tmp: INTEGER
		do
			h := 0
			if attached left as l then
				tmp := l.height
				if tmp > h then
					h := tmp
				end
			end
			if attached right as r then
				tmp := r.height
				if tmp > h then
					h := tmp
				end
			end
			Result := 1 + h
		end

	add (e: like current)
		require
			has_space: left = Void or right = Void
		do
			if not attached left then
				left := e
			else
				right := e
			end
		end

	set_left(e: like current)
	do
		left := e
	end

	set_right(e: like current)
	do
		right := e
	end

end
