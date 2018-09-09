note
	description: "Introduction to Traffic."

class
	PREVIEW

inherit
	ZURICH_OBJECTS

feature -- Explore Zurich

	explore
			-- Modify the map.
		do
			zurich.add_station ("Zoo", 1800, -800)
			zurich.connect_station (5, "Zoo")
			zurich_map.update
			zurich_map.station_view(zurich.station ("Zoo")).highlight
			wait(5)
			zurich_map.station_view (zurich.station ("Zoo")).unhighlight

		end

end
