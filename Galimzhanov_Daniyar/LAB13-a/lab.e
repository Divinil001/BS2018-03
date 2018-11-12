note
	description: "Summary description for {LAB}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LAB

create
	make

feature
	make
		do
			create array.make(0)
		end

	add_member(name:STRING)
		do
			array.force (name)
		end

	remove_member(name:STRING)
		local
			i:INTEGER
			flag:BOOLEAN
		do
			from i:=1 until flag=True  loop
				if i > array.count then
					print("There is no such member")
					flag:=True
				end

				if name ~ array.at (i) then
					array.go_i_th (i)
					array.remove
					array.forth
					flag:=True
				end
					i:=i+1
				end

		end

	introduce_all
		local
			i:INTEGER
		do
			print("Lab list: %N")
			from i:=1 until i>array.count loop
				print(i.out +". " + array.at (i))
				io.new_line
				i:=i+1
			end
		end

feature
	array:ARRAYED_LIST[STRING]

end
