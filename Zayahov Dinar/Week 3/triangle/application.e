note
	description: "triangle application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.

		local
			i: INTEGER

		do
			--| Add your code here
			create l.make(0)
			create j.make(0)
			create n.make(0)
			io.read_integer
			num:=io.last_integer
			from
				i:=1
			until
				i>=num+1
			loop
				x:=create_array(i)
				y:=reverse(x)
				print(l)
				print(j)
				print(n)
				l.prune_all(l.count)
				j.prune_all(j.count)
				n.prune_all(n.count)
			end
		end
	l, j, n, y, x: ARRAYED_LIST[INTEGER]
feature
	--kolvo_elementov, E, B, E1, B1, num: INTEGER

feature
	create_array(number_of_string: INTEGER): ARRAYED_LIST[INTEGER]
		local
			i: INTEGER
		do

			if
				number_of_string\\2=0
			then
				B:=((number_of_string//2)*(number_of_string//2))+1
				E:=B+(number_of_string//2)-1
				from
					i:=B
				until
					i>=E
				loop
					l.extend(0)
					l.extend(i)
				end
			end
			if
				number_of_string\\2/=0
			then
				E1:=(1//2+(number_of_string//2))*(1//2+(number_of_string//2))
				B1:=E1-(number_of_string//2+1//2)+1
				from
					i:=B1
				until
					i>=E1
				loop
					l.extend(i)
					l.extend(0)
				end
			end
			Result:=l
		end

	reverse(list: ARRAYED_LIST[INTEGER]): ARRAYED_LIST[INTEGER]
		local
			i: INTEGER
		do
				i:=-1
			from
				i:=-1
			until
				i>=-(list.count)
			loop
				n.extend(i)
				i:=i-1
			end
		Result:=n
		end

	spaces(i: INTEGER)
		local
			t: INTEGER
		do
			if
				i\\2/=0
			then
				from
					t:=0
				until
					t>=(2*(num-i))-1
				loop
					j.extend(0)
				end
			end
			if
				i\\2=0
			then
				from
					t:=0
				until
					t>=(2*(num+1-i))-1
				loop
					j.extend(0)
				end
			end
		end
	E, B, E1, B1, num: INTEGER

end
