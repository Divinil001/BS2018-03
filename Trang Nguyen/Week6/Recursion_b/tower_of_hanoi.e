-- TESTED
class
	TOWER_OF_HANOI

feature -- Access

	hanoi (disk: INTEGER; source: ARRAYED_LIST [INTEGER]; dest: ARRAYED_LIST [INTEGER]; aux: ARRAYED_LIST [INTEGER])
			-- Hanoi: each disk (from small to big) is signed from 1 to 'disk'
		do
			if disk = 1 then
				dest.extend (disk)
				source.prune (disk)
			else
				hanoi (disk - 1, source, aux, dest) -- Move n-1 disks from source to aux
				dest.extend (disk) -- Move nth disk from source to dest
				source.prune (disk)
				hanoi (disk - 1, aux, dest, source) -- move n-1 disk from aux to dest
			end
		end

end
