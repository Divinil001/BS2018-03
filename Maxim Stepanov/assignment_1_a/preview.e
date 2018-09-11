note
	description: "Introduction to Traffic."

class
	PREVIEW

inherit
	ZURICH_OBJECTS

feature -- Explore Zurich

	explore
		local
			view: STATION_VIEW

			-- Modify the map.
		do
			Zurich.add_station ("InnoZoo", -500, 1000)
			Zurich.connect_station (8, "InnoZoo")
			zurich_map.update
			zurich_map.fit_to_window

			view := zurich_map.station_view (zurich.station ("InnoZoo"))

			view.highlight
			wait (1)

			view.unhighlight
			wait (1)

			view.highlight
			wait (1)

			view.unhighlight
			wait (1)

			view.highlight
			wait (1)

			view.unhighlight
			wait (1)
		end

end
