note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	cur : INTEGER
	--number of days passed starting from the creation of ski resort
	--by it we will denote the date

	stock : ARRAYED_LIST[STRING]
	--stock[i] => name of i-th equipment

	ps : ARRAYED_LIST[BOOLEAN]
	--if ps[i] = true then i-th thing is primary equipment
	--else secondary equipment

	num : ARRAYED_LIST[INTEGER]
	--how much equipment of type stock[i] has left

	rentals : ARRAYED_LIST[STRING]
	--rentals[i] -> nickname of i-th person in the database

	rentday : ARRAYED_LIST[ARRAYED_LIST[INTEGER]]
	--rentday[i][j] ->
	--the day of renting of some equipment j-th time by rentals[i]

	rented : ARRAYED_LIST[ARRAYED_LIST[ARRAYED_LIST[STRING]]]
	--rentday[i][j] ->
	--the set of equipment rented j-th time by rentals[i]

	returned : ARRAYED_LIST[BOOLEAN]
	--if rentals[i] returned equipment returned[i] = true
	--else returned[i] = false

	instr : ARRAYED_LIST[STRING]
	--all instructions

	whatdoes : ARRAYED_LIST[STRING]
	--what instr[i] does

feature
	init
		--Create the ski resort
		local
			i : INTEGER
		do
			print("PRESS ENTER TO INITIALIZE%N")
			io.read_line
			create stock.make (0)
			create ps.make (0)
			create num.make (0)
			create rentals.make (0)
			create returned.make(0)
			create rentday.make (0)
			create rented.make (0)
			stock.extend ("skies")
			stock.extend ("snowboards")
			stock.extend ("helmets")
			stock.extend ("goggles")
			stock.extend ("ski sticks")
			stock.extend ("ski boots")
			stock.extend ("snowboard boots")
			stock.extend ("ski passes")
			from i := 1 until i > stock.count loop
				if i < 3 then
					ps.extend(true)
				else
					ps.extend(false)
				end
				i := i + 1
			end
			from i := 1 until i > stock.count loop
				print("how many " + stock[i] + " does ski resort have?%N")
				io.read_integer
				if io.last_integer < 1 then
					print("to create ski resort it should be at least 1 " + stock[i] + "%N")
					i := i - 1
				else
					num.extend (io.last_integer)
				end
				i := i + 1
			end
		end

feature
	instr_init
		--initialize the instructions
		--instruction list
		do
			create instr.make(0)
			create whatdoes.make(0)
			instr.extend("list")
			whatdoes.extend("prints all possible instructions")
			instr.extend("register")
			whatdoes.extend("registers some people in the database")
			instr.extend("rent")
			whatdoes.extend("rents out equipment to some ALREADY REGISTERED person")
			instr.extend("return")
			whatdoes.extend("accepts a returning of equipment from the person who ALREADY RENTED equipment")
			instr.extend("add")
			whatdoes.extend("adds new equipment to the store")
			instr.extend("new day")
			whatdoes.extend("ends the working day and starts a new one")
			instr.extend("info")
			whatdoes.extend("prints the history of actions of some person")
			instr.extend("terminate")
			whatdoes.extend("terminates the program")
			instr.extend("listeq")
			whatdoes.extend("prints all available equipment")
		end

feature
	list
		--prints all instructions
		local
			j : INTEGER
		do
			from j := 1 until j > instr.count loop
				print(instr[j] + " : " + whatdoes[j] + "%N")
				j := j + 1
			end
			print("%N")
		end

feature
	list_eq
		--prints all available equipment
		local
			j : INTEGER
		do
			from j := 1 until j > stock.count loop
				print(stock[j] + " : " + num[j].out + " copies left%N")
				j := j + 1
			end
			print("%N")
		end

feature
	register
		--registration of some people in the database of the ski resort
		local
			i : INTEGER
			n : INTEGER
			j : INTEGER
			help : ARRAYED_LIST[ARRAYED_LIST[STRING]]
			help2 : ARRAYED_LIST[INTEGER]
		do
			create help.make (0)
			create help2.make (0)
			from until i > 0 loop
				i := 1
				print("Enter the number of people you want to register%N")
				io.read_integer
				n := io.last_integer
				if n < 0 then
					print("Please, enter the non-negative number%N")
					i := 0
				end
			end
			print("%N")
			from i := 1 until i > n loop
				print("Person number " + i.out + "%N")
				print("Please, enter the nickname%N")
				io.read_line
				from j := 1 until j > rentals.count or j < 0 loop
					if io.last_string.out ~ rentals[j] then
						j := -2
					end
					j := j + 1
				end
				if j < 0 then
					print("Sorry, but the nickname is already taken%NPlease, choose another one%N")
					i := i - 1
				else
					rentals.extend (io.last_string.out)
					rentday.extend (help2)
					rented.extend (help)
					returned.extend(true)
				end
				i := i + 1
				print("%N")
			end
			print("REGISTRATION SUCCESSFULLY COMPELETED!%N%N")
		end

feature
	rent
		--before renting something person should register
		--some person rents the equipment
		local
			i : INTEGER
			j : INTEGER
			k : INTEGER
			s : STRING
			pr : BOOLEAN
			--if primary is already rented then pr = true
			--else pr = 0
			arr : ARRAYED_LIST[STRING]
		do
			create arr.make (0)
			s := ""
			print("Please, enter your nickname%N")
			io.read_line
			s := io.last_string.out
			from j := 1 until j > rentals.count or j < 0 loop
				if rentals[j] ~ s then
					i := j
					j := -2
				end
				j := j + 1
			end
			if j > 0 then
				print("Your nickname was not found in the database%N")
				print("Your should register before renting someting%N%N")
			else
				if returned[i] = false then
					s := "endrent"
					print("Before renting something, please return what you have rented%N")
				end
				from until s ~ "endrent" loop
					print("type the name of the equipment you want to rent%N")
					print("or type endrent to finish and go skiing%N")
					print("or type listeq to see available equipment%N%N")
					io.read_line
					s := io.last_string.out
					if s ~ "endrent" then
						if arr.count > 0 then
							print("Thank you for coming! Spend good time%N%N")
							rented[i].extend (arr)
							rentday[i].extend (cur)
							returned[i] := false
						end
					elseif s ~ "listeq" then
						list_eq
						print("You rented : ")
						from j := 1 until j > arr.count loop
							print(arr[i])
							if j < arr.count then
								print(", ")
							end
							j := j + 1
						end
						print("%N%N")
					else
						from j := 1 until j > stock.count or j < 0 loop
							if stock[j] ~ s then
								k := j
								j := -2
							end
							j := j + 1
						end
						if j > 0 then
							print("PLEASE, ENTER THE CORRECT NAME OF THE EQUIPMENT%N")
							print("REFER TO THE LIST OF AVAILABLE EQUIPMENT BELOW:%N")
							list_eq
						else
							from j := 1 until j > arr.count or j < 0 loop
								if arr[j] ~ s then
									j := -2
								end
								j := j + 1
							end
							if j < 0 then
								print("YOU HAVE ALREADY RENTED THIS EQUIPMENT%N")
							elseif num[k] < 2 then
								print("Sorry, there are only 1 copy of this equipment right now%N")
								print("We cannot rent it out to you%N")
							else
								if s ~ "ski passes" then
									num[k] := num[k] - 1
									arr.extend (s)
								elseif ps[k] = true then
									pr := true
									num[k] := num[k] - 1
									arr.extend (s)
								elseif ps[k] = false then
									if pr = false then
										print("Before renting secondary equipment (except ski passes) ")
										print("you should rent any primary equipment%N")
									else
										num[k] := num[k] - 1
										arr.extend (s)
									end
								end
							end
						end
						print("You rented : ")
						from j := 1 until j > arr.count loop
							print(arr[j])
							if j < arr.count then
								print(", ")
							end
							j := j + 1
						end
						print("%N%N")
					end
				end
			end
		end

feature
	return
		--returning of the equipment by someone
		local
			i : INTEGER
			j : INTEGER
			s : STRING
		do
			s := ""
			print("Please, enter your nickname%N")
			io.read_line
			s := io.last_string.out
			from i := 1 until i > rentals.count or i < 0 loop
				if rentals[i] ~ s then
					j := i
					i := -2
				end
				i := i + 1
			end
			if i < 0 then
				if returned[j] = false then
					print("THANK YOU FOR RETURNING THE EQUIPMENT!%N")
					returned[j] := true
				else
					print("YOU HAVE ALREADY RETURNED THE EQUIPMENT%N")
				end
			else
				print("YOUR NICKNAME WAS NOT FOUND IN THE DATABASE%N")
			end
			print("%N")
		end

feature
	add
		--adding of some equipment to the store of the ski resort
		local
			i : INTEGER
			n : INTEGER
			j : INTEGER
			k : INTEGER
			s : STRING
			x : INTEGER
			l : INTEGER
		do
			s := ""
			from until i > 0 loop
				i := 1
				print("Enter the number of types of equipment you want to add in the store%N")
				io.read_integer
				n := io.last_integer
				if n < 0 then
					print("Please, enter the non-negative number%N")
					i := 0
				end
			end
			print("%N")
			from i := 1 until i > n loop
				print("Enter the name of the equipment number " + i.out + "%N")
				io.read_line
				s := io.last_string.out
				from j := 1 until j > stock.count or j < 0 loop
					if s ~ stock[j] then
						k := j
						j := -2
					end
					j := j + 1
				end
				from l := 0 until l > 0 loop
					l := 1
					print("Enter the number of this type of equipment you want to add in the store%N")
					io.read_integer
					x := io.last_integer
					if x < 0 then
						print("Please, enter the non-negative number%N")
						l := 0
					end
				end
				if j < 0 then
					num[k] := num[k] + x
				else
					print("%N")
					stock.extend (s)
					num.extend (x)
					from l := 0 until l > 0 loop
						l := 1
						print("Type 1 to set this equipment as primary%N")
						print("Type 0 to set this equipment as secondary%N")
						io.read_integer
						x := io.last_integer
						if x < 0 or x > 1 then
							print("Please, enter either 1 or 0%N")
							l := 0
						end
					end
					if x = 0 then
						ps.extend (false)
					else
						ps.extend (true)
					end
				end
				print("%N")
				i := i + 1
			end
			print("EQUIPMENT SUCCESSFULLY ADDED TO THE STORE%N%N")
		end

feature
	new_day
		--working day of ski resort ended and new is started
		--everybody who rented the equipment immediately return it
		local
			i : INTEGER
		do
			cur := cur + 1
			from i := 1 until i > rentals.count loop
				returned[i] := true
				i := i + 1
			end
		end
feature
	info
		--prints the history of actions of some person
		local
			i : INTEGER
			s : STRING
			j : INTEGER
			k : INTEGER
		do
			s := ""
			print("Enter the nickname whose renting history you want to see%N")
			io.read_line
			s := io.last_string.out
			from i := 1 until i > rentals.count or i < 0 loop
				if rentals[i] ~ s then
					j := i
					i := -2
				end
				i := i + 1
			end
			if i > 0 then
				print("Nickname was not found in the database%N")
			else
				from i := 1 until i > rented[j].count loop
					print("day number " + (rentday[j])[i].out + ", rented equipment : ")
					from k := 1 until k > (rented[j])[i].count loop
						print(((rented[j])[i])[k])
						if k < (rented[j])[i].count then
							print(", ")
						end
						k := k + 1
					end
					print("%N")
					i := i + 1
				end
			end
			print("%N")
		end
feature {NONE}
	make
		local
			inst : STRING
			--regular instruction
			flag : BOOLEAN
			j : INTEGER
		do
			inst := ""
			init
			instr_init
			from until inst ~ "terminate" loop
				print("enter the next instruction%N")
				print("or type list to see all instructions%N")
				print("or type terminate to end the program%N%N")
				io.read_line
				inst := io.last_string.out
				flag := false
				from j := 1 until j > instr.count or flag = true loop
					if instr[j] ~ inst then
						flag := true
					end
					j := j + 1
				end
				if flag = false then
					print("WRONG INSTRUCTION, REFER TO THE LIST OF INSTRUCTIONS BELOW:%N%N")
					list
				else
					if inst ~ "register" then
						register
					elseif inst ~ "rent" then
						rent
					elseif inst ~ "list" then
						list
					elseif inst ~ "return" then
						return
					elseif inst ~ "add" then
						add
					elseif inst ~ "new day" then
						new_day
					elseif inst ~ "info" then
						info
					elseif inst ~ "listeq" then
						list_eq
					end
				end
			end

		end

end
