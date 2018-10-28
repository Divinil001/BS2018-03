class
	APPLICATION

create
	make

feature
	--a: MY_STACK[INTEGER]
	b: MY_BOUNDED_STACK[INTEGER]
	make
		do
			create b.make_bounded(2)
			b.push(4)
			b.push(6)
			b.push(5)
			--b.push(3)
			print(b.item)
		end

end
