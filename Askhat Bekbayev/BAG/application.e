class
	APPLICATION
create
	make

feature
	make
		do
			create bag
			bag.add ('a', 1)
			bag.add ('a', 1)
			bag.add ('b', 1)
			bag.print_bag
			print(bag.elements)
		end
feature
	bag: BAG_CLASS
end
