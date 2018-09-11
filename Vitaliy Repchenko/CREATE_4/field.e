class
	FIELD
inherit
	ARGUMENTS
create
	make

feature
	field : ARRAY2[INTEGER]
	array : ARRAY[INTEGER]
	m, n : INTEGER


feature

	make( a_m, a_n: INTEGER)
		do
			set_field( a_m, a_n)
			create field.make_filled (0, a_m, a_n)
			create array.make_filled (a_m, 1, a_n)
		end

	set_field( a_m, a_n: INTEGER)
		do
			m:= a_m
			n:= a_n
		end

	edit_field(a_n, player: INTEGER)
		do
			if a_n-1<n then
				if
				array[a_n] > 0
			then
				field[array[a_n],a_n]:= player
				array[a_n]:=array[a_n]-1
			else
				io.put_string ("%N"+"This colomn is full or you write impossible number"+"%N")
				io.read_integer
				edit_field(io.last_integer, player)
			end
			else
				io.put_string ("%N"+"This colomn is full or you write impossible number"+"%N")
				io.read_integer
				edit_field(io.last_integer, player)
			end


		end


	print_field()
		local
			i,j:INTEGER
		do

			from
				i:=1
			until
				i=m+1
			loop
				io.put_string ("%N")
				from
					j:=1
				until
					j=n+1
				loop
					io.put_string(field[i,j].out+" ")
					j:=j+1
				end
				i:=i+1
			end
		end

	finish_game_full(): BOOLEAN
		local
			i,j:INTEGER
		do
			Result:= true
			from
				i:=1
			until
				i=n+1
			loop
				if
					array[i] /= 0
				then
					Result:=false
				end
				i:=i+1
			end
		end

	finish_game_win(): BOOLEAN
		local
			i,j:INTEGER
		do
			Result:= false
			from
				i:=1
			until
				i=m+1
			loop
				from
					j:=1
				until
					j=n+1
				loop
					if
						field[i,j] /= 0
					then

						if
							j+2<n
						then
							if
								field[i,j]=field[i,j+1] and field[i,j]=field[i,j+2] and field[i,j]=field[i,j+3]
							then
								Result:= true
							end
						end
						if
							i+2<m
						then
							if
								field[i,j]=field[i+1,j] and field[i,j]=field[i+2,j] and field[i,j]=field[i+3,j]
							then
								Result:= true
							end
						end
						if
							j+2<n and i+2<m
						then
							if
								field[i,j]=field[i+1,j+1] and field[i,j]=field[i+2,j+2] and field[i,j]=field[i+3,j+3]
							then
								Result:= true
							end
						end
						if
							j-3>0 and i+2<m
						then
							if
								field[i,j]=field[i+1,j-1] and field[i,j]=field[i+2,j-2] and field[i,j]=field[i+3,j-3]
							then
								Result:= true
							end
						end
					end
					j:=j+1
				end
				i:=i+1
			end

		end
end
