note
	description: "POWER_OF_SET application root class"
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
		do
			--| Add your code here
			create b.make (0)
			b.extend ("a")
			b.extend ("b")
			b.extend ("c")
			pos(b)
		end

feature
	power_of_set(a:  ARRAYED_LIST[STRING]):  ARRAYED_LIST[STRING]
		local
			solve, k:  ARRAYED_LIST[STRING]
			i: INTEGER
		do
			create solve.make (0)
			create k.make (0)
			if a.is_empty then
				solve.extend ("")
			elseif a.count=1 then
				solve.extend ("")
				solve.extend (a[1])
			else
				k:=sub_arrated_list(a,a.count-1)
				k:=power_of_set(k)
				from
					i:=1
				until
					i>k.count
				loop
					if k[i].out.is_empty then
						solve.extend(a[a.count])
					else
						solve.extend(k[i]+", "+a[a.count])
					end
					i:=i+1
				end


				from
					i:=1
				until
					i>k.count
				loop
					solve.extend(k[i])
					i:=i+1
				end
			end
			Result:=solve
		end



	pos(a:  ARRAYED_LIST[STRING])
		local
			s:  ARRAYED_LIST[STRING]
			i: INTEGER
		do
			print("%N [")
			create s.make (0)
			s:=power_of_set(a)
			from
				i:=1
			until
				i>s.count
			loop
				if i=s.count then
					print("["+s[i].out+"]")
				else
					print("["+s[i].out+"], ")
				end
				i:=i+1
			end
			print("]")
		end

	sub_arrated_list(a: ARRAYED_LIST[STRING]; n:INTEGER): ARRAYED_LIST[STRING]
		local
			c: ARRAYED_LIST[STRING]
			i: INTEGER
		do
			create c.make (1)
			from
				i:=1
			until
				i>n
			loop
				c.extend (a[i])
				i:=i+1
			end
			Result:=c
		end





feature
	b:  ARRAYED_LIST[STRING]
end
