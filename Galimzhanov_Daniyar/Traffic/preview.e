note
	description: "Introduction to Traffic."

class
	PREVIEW

inherit
	ZURICH_OBJECTS

feature -- Explore Zurich

	explore
		local eiffelWorld: STATION
			-- Modify the map.
		do
			Zurich.add_station ("EiffelWorld", 1000, -400)
			Zurich.connect_station (31, "EiffelWorld")
			Zurich_map.update
			Zurich_map.fit_to_window
			eiffelWorld := Zurich.station ("EiffelWorld")
			wait(3)
			Zurich_map.station_view(eiffelWorld).highlight
			wait(4)
			Zurich_map.station_view (eiffelWorld).unhighlight
		end

end
