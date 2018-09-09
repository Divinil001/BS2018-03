note
  description: "Introduction to Traffic."

class
  PREVIEW

inherit
  ZURICH_OBJECTS

feature -- Explore Zurich

  i : INTEGER

  explore
      -- Modify the map.
    do
      zurich.add_station ("Zoo", 500, -500)
      zurich_map.fit_to_window
      zurich.connect_station (6, "Zoo")
	  zurich_map.update
	  
      from
          i := 0
      until
          i >= 10
      loop
          -- do something
          zurich_map.station_view (zurich.station ("Zoo")).highlight
          wait(100)
          zurich_map.station_view (zurich.station ("Zoo")).unhighlight
          wait(100)
          i := i + 1
      end

    end

end
