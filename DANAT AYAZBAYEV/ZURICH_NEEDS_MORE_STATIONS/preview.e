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
			Zurich.add_station ("Zoo", -100, 200)
			Zurich_map.update
			from

			until
			0 /= 0
			loop
				Zurich_map.station_view (Zurich.station ("Zoo")).highlight
				wait(1)
				Zurich_map.station_view (Zurich.station ("Zoo")).unhighlight
				wait(1)
			end


		end

end
