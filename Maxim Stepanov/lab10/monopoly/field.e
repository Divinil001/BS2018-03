note
	description: "Summary description for {FIELD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD

create
	make

feature
	cells: ARRAYED_LIST[FIELD_CELL]

	make
	do
		create cells.make (0)

		cells.extend (create {FIELD_CELL_GO})
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Christ the Redeemer", 60))
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Luang Pho To", 60))
		cells.extend (create {FIELD_CELL_INCOME_TAX})
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Alyosha monument", 80))
		cells.extend (create {FIELD_CELL_IN_JAIL})
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Tokyo Wan Kannon", 100))
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Luangpho Yai", 120))
		cells.extend (create {FIELD_CELL_CHANCE})
		cells.extend (create {FIELD_CELL_PROPERTY}.make("The Motherland", 160))
		cells.extend (create {FIELD_CELL_FREE_PARKING})
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Awaji Kannon", 220))
		cells.extend (create {FIELD_CELL_CHANCE})
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Rodina-Mat' Zovyot!", 260))
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Great Buddha of Thailand", 280))
		cells.extend (create {FIELD_CELL_GO_TO_JAIL})
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Laykyun Setkyar", 320))
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Spring Temple Buddha", 360))
		cells.extend (create {FIELD_CELL_CHANCE})
		cells.extend (create {FIELD_CELL_PROPERTY}.make("Statue of Unity", 400))
	end



end
