note
	description: "Summary description for {MAP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MAP

create
	make

feature
	nobody: PLAYER
	squares: ARRAY[SQUARE]

	make
	local
		p: PROPERTY
		i: INCOME_TAX
		f: FREE_PARKING
		in: GO_TO_JAIL
		c: CHANCE
	do
		create nobody.make ("nobody")
		create squares.make_empty
		create f.make("GO SQUARE")
		squares.force (f, 1)
		create p.make ("Christ the Redeemer", 60, 2)
		squares.force (p, 2)
		create p.make ("Luang Pho To", 60, 4)
		squares.force (p, 3)
		create i.make
		squares.force (i, 4)
		create p.make ("Alyosha monument", 80, 4)
		squares.force (p, 5)
		create f.make ("IN JAIL SQUARE")
		squares.force (f, 6)
		create p.make ("Tokyo Wan Kannon", 100, 6)
		squares.force (p, 7)
		create p.make ("Luangpho Yai", 120, 8)
		squares.force (p, 8)
		create c.make
		squares.force (c, 9)
		create p.make ("The Motherland", 160, 12)
		squares.force (p, 10)
		create f.make ("FREE PARKING SQUARE")
		squares.force (f, 11)
		create p.make ("Awaji Kannon", 220, 18)
		squares.force (p, 12)
		create c.make
		squares.force (c, 13)
		create p.make ("Rodina-Mat Zovyot!", 260, 22)
		squares.force (p, 14)
		create p.make ("Great Buddha of Thailand", 280, 22)
		squares.force (p, 15)
		create in.make
		squares.force (in, 16)
		create p.make ("Laykyun Setkyar", 320, 28)
		squares.force (p, 17)
		create p.make ("Spring Temple Buddha", 360, 35)
		squares.force (p, 18)
		create c.make
		squares.force (c, 19)
		create p.make ("Statue of Unity", 400, 50)
		squares.force (p, 20)
	end
end
