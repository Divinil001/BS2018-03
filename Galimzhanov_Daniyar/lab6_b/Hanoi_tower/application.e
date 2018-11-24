note
    description : "root class of the application"
    date        : "$Date$"
    revision    : "$Revision$"

class
    APPLICATION

inherit
    ARGUMENTS

create
    make

feature {NONE} -- Initialization

    h_anoi(num, fr, to, free : INTEGER)
        do
            if num /= 0 then
                h_anoi(num - 1, fr, free, to)
                print(fr)
                print(" ")
                print(to)
                print("%N")
                h_anoi(num - 1, free, to, fr)
            end
        end

    hanoi(n : INTEGER)
        do
            h_anoi(n, 1, 3, 2)
        end

    make
            -- Run application.
        do
            hanoi(3)
        end

end
