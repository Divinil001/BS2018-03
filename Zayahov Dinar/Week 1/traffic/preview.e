﻿note
	description: "Introduction to Traffic."

class
	PREVIEW

inherit
	ZURICH_OBJECTS

feature -- Explore Zurich
	i: INTEGER
	explore
			-- Modify the map.
		do
			zurich.add_station ("Zoo", 500, 500)
			zurich.connect_station (15, "Zoo")
			zurich_map.update
			zurich_map.fit_to_window

			from
				i := 0
			until
				i >= 10
			loop
				-- do something
			zurich_map.station_view (zurich.station ("Zoo")).highlight
			wait(2)
			zurich_map.station_view (zurich.station ("Zoo")).unhighlight
			wait(2)
			i := i + 1
			end
		end

end
