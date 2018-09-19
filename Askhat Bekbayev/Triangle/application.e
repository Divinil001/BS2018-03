note
	description: "Writing application root class"
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

		do
			print ("%N"+"Write a number"+"%N")
			io.read_integer_64
			set_number(io.last_integer_64)
			number_written_out_1 := 1
			max_value := 0
			max_number_of_spaces := 0

			if
				num \\ 2 = 1
			then
				max_value := max_value + (num+1) // 2
			end


			from
				i := num // 2
			until
				i = 0
			loop
				max_value := max_value + i*2
				i := i-1
			end


			from
				i:= (num+1)//2
			until
				i < 1
			loop
				max_number_of_spaces := max_number_of_spaces + max_value.out.count*2+2
				max_value:= max_value -1
				i:=i-1
			end


			from
				i := 1
			until
				i = num + 1
			loop
				number_of_digits_in_a_row:=(i+1) // 2

				number_of_spaces:=max_number_of_spaces

				from
					l:=0
				until
					l = number_of_digits_in_a_row
				loop
					if i \\ 2 =1 then
						io.put_integer_64(number_written_out_1)
						print(" ")


					else
						print(" ")
						io.put_integer_64(number_written_out_1)

					end

					number_of_spaces := number_of_spaces - (number_written_out_1.out.count)*2
					l:=l+1
					number_written_out_1:=number_written_out_1+1
				end

				number_of_spaces:= number_of_spaces - (i//2)*2


				from
					o:=0
				until
					o > number_of_spaces
				loop
					print(" ")
					o:=o+1
				end

				number_written_out_2:=number_written_out_1-1

				from
					l:=0
				until
					l = number_of_digits_in_a_row
				loop
					if i \\ 2 =1 then
						io.put_integer_64(number_written_out_2)
						print(" ")
					else
						print(" ")
						io.put_integer_64(number_written_out_2)
					end
					l:=l+1
					number_written_out_2:=number_written_out_2-1
				end
				print("%N")
				i:=i+1
			end
		end

feature
	num : INTEGER_64
	number_of_digits_in_a_row : INTEGER_64
	i, l, o, y : INTEGER_64
	max_number_of_spaces : INTEGER_64
	number_of_spaces : INTEGER_64
	max_value : INTEGER_64
	pre_last_number_written_out : INTEGER_64
	number_written_out_1: INTEGER_64
	number_written_out_2: INTEGER_64

	set_number(a_num: INTEGER_64)
		do
			num:=a_num
		end

end
