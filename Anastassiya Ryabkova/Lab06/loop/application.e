note
	description: "loop application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
        num:INTEGER


    make
            -- Run application.
        do
            -- Add your code here
            print ("Please, enter hight" + "%N")
            io.read_integer
            set_num(io.last_integer)
            print(make_triangle(num))



        end

        set_num(a:INTEGER)
        do
            num:=a

        end

        make_triangle(height_n: INTEGER): STRING
		local
			temp: ARRAYED_LIST[STRING]
			height, spaces, number, i, j: INTEGER
			string, previous_string, s, s1: STRING
		do
			create temp.make (0)
			height := height_n
			string := ""
			previous_string := ""
			s := ""
			number := 1
			from
				i := 1
			until
				i > height
			loop
				string := ""
				previous_string := ""
				if i \\ 2 = 0 then
					string.append (" ")
					previous_string.prepend (" ")
				end
				from
					j := 1
				until
					j > (i - 1) // 2 + 1
				loop
					string.append(number.out + " ")
					previous_string.prepend (" " + number.out)
					number := number + 1
					j := j + 1
				end
				previous_string.append ("%N")
				temp.extend (string)
				temp.extend (previous_string)
				i:=i+1
			end
			spaces := temp.last.count * 2
			from
				i := 1
			until
				i > temp.count
			loop
				s.append (temp[i])
				if i \\ 2 = 1 then
					s1 := " "
					s1.multiply(spaces - temp[i].count*2)
					s.append (s1)
				end
				i := i + 1
			end
			Result := s

		end


end--end of class
