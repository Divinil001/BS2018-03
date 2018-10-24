class
	BOARD

create
	make

feature{GAME}
	cells: ARRAYED_LIST[GAME_CELL]

feature
	make
	do
		create cells.make (0)
		cells.extend (create {PARKING}.make)
		cells.extend (create {PROPERTY}.make ("Christ the Redeemer", 60, 2))
		cells.extend (create {PROPERTY}.make ("Luang Pho To", 60, 4))
		cells.extend (create {INCOME_TAX}.make)
		cells.extend (create {PROPERTY}.make ("Alyosha monument", 80, 4))
		cells.extend (create {PARKING}.make)
		cells.extend (create {PROPERTY}.make ("Tokyo Wan Kannon", 100, 6))
		cells.extend (create {PROPERTY}.make ("Luangpho Yai", 120, 8))
		cells.extend (create {CHANCE}.make)
		cells.extend (create {PROPERTY}.make ("The Motherland", 160, 12))
		cells.extend (create {PARKING}.make)
		cells.extend (create {PROPERTY}.make ("Awaji Kannon", 220, 18))
		cells.extend (create {CHANCE}.make)
		cells.extend (create {PROPERTY}.make ("Rodina-Mat Zovyot!", 260, 22))
		cells.extend (create {PROPERTY}.make ("Great Buddha of Thailand", 280, 22))
		cells.extend (create {GOTOJAIL}.make)
		cells.extend (create {PROPERTY}.make ("Laykyun Setkyar", 320, 28))
		cells.extend (create {PROPERTY}.make ("Spring Temple Buddha", 360, 35))
		cells.extend (create {CHANCE}.make)
		cells.extend (create {PROPERTY}.make ("Statue of Unity", 400, 50))

		-- properties
--		cells.put_i_th (create {PROPERTY}.make ("Christ the Redeemer", 60, 2), 2)
--		cells.put_i_th (create {PROPERTY}.make ("Luang Pho To", 60, 4), 3)
--		cells.put_i_th (create {PROPERTY}.make ("Alyosha monument", 80, 4), 5)
--		cells.put_i_th (create {PROPERTY}.make ("Tokyo Wan Kannon", 100, 6), 7)
--		cells.put_i_th (create {PROPERTY}.make ("Luangpho Yai", 120, 8), 8)
--		cells.put_i_th (create {PROPERTY}.make ("The Motherland", 160, 12), 10)
--		cells.put_i_th (create {PROPERTY}.make ("Awaji Kannon", 220, 18), 12)
--		cells.put_i_th (create {PROPERTY}.make ("Rodina-Mat Zovyot!", 260, 22), 14)
--		cells.put_i_th (create {PROPERTY}.make ("Great Buddha of Thailand", 280, 22), 15)
--		cells.put_i_th (create {PROPERTY}.make ("Laykyun Setkyar", 320, 28), 17)
--		cells.put_i_th (create {PROPERTY}.make ("Spring Temple Buddha", 360, 35), 18)
--		cells.put_i_th (create {PROPERTY}.make ("Statue of Unity", 400, 50), 20)

--		-- parkins (including in jail, go)
--		cells.put_i_th (create {PARKING}.make, 1)
--		cells.put_i_th (create {PARKING}.make, 6)
--		cells.put_i_th (create {PARKING}.make, 11)

--		-- taxes
--		cells.put_i_th (create {INCOME_TAX}.make, 4)

--		-- chances
--		cells.put_i_th (create {CHANCE}.make, 9)
--		cells.put_i_th (create {CHANCE}.make, 13)
--		cells.put_i_th (create {CHANCE}.make, 19)

--		-- go to jail
--		cells.put_i_th (create {GOTOJAIL}.make, 16)
	end
end
