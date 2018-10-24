class
    LIBRARY

create
    make_library

feature
    fee : ARRAY[PERSON]

    make_library
    do
        create fee.make_empty
    end
end
