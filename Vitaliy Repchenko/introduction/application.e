class
  APPLICATION

create
  execute

feature {NONE} -- Initialization

  execute
      -- Run application.
    do
      io.put_string("Name: Vitaliy Repchenko%N")
      io.put_string("Age:")
      io.put_integer (17)
      io.new_line
      io.put_string ("Mother tongue: Russia%N")
      io.put_string ("Has a cat:")
      io.put_boolean (True)
      io.new_line
    end

end
