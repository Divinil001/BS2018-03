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
			Zurich.add_station ("ZOO", -500, 500)
			Zurich.connect_station (13, "ZOO")
				from i := 1 until i > 2 loop
				do
					Zurich_map.update
					Zurich_map.station_view (Zurich.station ("ZOO")).highlight
					Zurich_map.update
					wait(1)
					Zurich_map.station_view (Zurich.station ("ZOO")).unhighlight
					Zurich_map.update
					wait(1)
				end
		end

end
