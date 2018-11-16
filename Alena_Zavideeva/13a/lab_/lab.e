class
	LAB

create
	make

feature {NONE}

	scientists: LINKED_LIST [SCIENTIST]

feature

	make
		do
			create scientists.make
		end

feature

	add_member (person: SCIENTIST)
		require
			not has_member (person.id)
		do
			scientists.extend (person)
		end

	remove_member (id: INTEGER)
		local
			break: BOOLEAN
		do
			across
				scientists as sc
			from
				break := False
			until
				break
			loop
				if sc.item.id = id then
					scientists.go_i_th (sc.cursor_index)
					scientists.remove
					break := True
				end
			end
		end

	introduce_all
		do
			across
				scientists as sc
			loop
				sc.item.introduce
				print("%N")
			end
		end

	has_member (id: INTEGER): BOOLEAN
		do
			Result := (across scientists as sc some sc.item.id = id end)
		end

end
