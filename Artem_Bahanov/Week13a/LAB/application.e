class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		do
			create {COMPUTER_SCIENTIST}c.make (2000, "artem_k.a")
			create {BIO_INFORMATIC}bi.make (453, "Ivanich", create {PET}.make ("Petrovich"), "Did nothing")
			create {BIOLOGIST}b.make (1337, "Multiple inheritance", create {PET}.make ("SOS"))
			print(c.introduce)
			print(b.introduce)
			print(bi.introduce)
			create l.make("#51 (secret)")
			l.add_member(c)
			l.add_member(b)
			l.add_member(bi)
			l.remove_member (b)
			l.remove_member (b)
			print(l.introduce_all)
		end
	c, b, bi: SCIENTIST
	l: LAB
end
