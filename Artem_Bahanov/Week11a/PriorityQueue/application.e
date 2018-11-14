class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			pq: MY_PRIORITY_QUEUE[INTEGER]
		do

			create pq.make_empty
			pq.insert (20)
			pq.insert (1)
			pq.insert (10)
			pq.insert (4)
			print(pq.extract.out + "%N")
			print(pq.extract.out + "%N")
			pq.insert (12)
			pq.insert (2)
			print(pq.extract.out + "%N")
		end

end
