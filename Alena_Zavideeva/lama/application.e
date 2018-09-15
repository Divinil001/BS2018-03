class
	APPLICATION
create make

feature
	b1 : BUG
	b2 : BUG
	t : BOOLEAN
	make
	do
		create b1.make
		create b2.make

		b1.add ('h', 5)
		--b2.add ('m', 3)
		b1.remove ('h', 5)
		print(b1.has_in_arr ('h'))
		b2.add ('h', 5)

		t := b1.is_equal_bug (b2)
		print(t)
	end
end
