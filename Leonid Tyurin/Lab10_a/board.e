note
	description: "Summary description for {BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

create
	make

feature

	jail: IN_JAIL

	start: GO

	turn, cycle: INTEGER

	fields: ARRAY [ACTION]

	players: ARRAY [PLAYER]

	get (i: INTEGER): ACTION
		do
			Result := fields [i]
		end

	size: INTEGER
		do
			Result := fields.count
		end

	add_player (name: STRING)
		do
			players.force (create {PLAYER}.make (name, Current), players.count + 1)
		end

	make
		do
			turn := 0
			cycle := 1
			create players.make_empty
			create start.make (0)
			create jail.make (5)
			fields := <<start, create {PROPERTY}.make (1, "Christ the Redeemer", 60, 2), create {PROPERTY}.make (2, "Luang Pho To", 60, 4), create {PAY_TAX}.make (3), create {PROPERTY}.make (4, "Alyosha monument", 80, 4), jail, create {PROPERTY}.make (6, "Tokyo Wan Kannon", 100, 6), create {PROPERTY}.make (7, "Luangpho Yai", 120, 8), create {PAY_RANDOM}.make (8), create {PROPERTY}.make (9, "The Motherland", 160, 12), create {SKIP}.make (10), create {PROPERTY}.make (11, "Awaji Kannon", 220, 18), create {PAY_RANDOM}.make (12), create {PROPERTY}.make (13, "Rodina-Mat' Zovyot!", 260, 22), create {PROPERTY}.make (14, "Great Buddha of Thailand", 280, 22), create {GO_TO_JAIL}.make (15), create {PROPERTY}.make (16, "Laykyun Setkyar", 320, 28), create {PROPERTY}.make (17, "Spring Temple Buddha", 360, 35), create {PAY_RANDOM}.make (18), create {PROPERTY}.make (19, "Statue of Unity", 400, 50)>>
		end

	start_game
		do
			from
			until
				cycle = 101
			loop
				if turn = 0 then
					print("%N%N%NCycle #" + cycle.out + "%N%N%N")
					cycle := cycle + 1
				end
				print ("Press to continue%N")
				io.read_line
				players [turn + 1].go
				turn := (turn + 1) \\ players.count
			end

			print("%N%NWinners are:%N")
			across players as p loop
				if p.item.balance >= 0 then
					print(p.item.name + ", " + p.item.balance.out + "K%N")
				end
			end

		end

end
