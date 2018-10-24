class
    PERSON

create
    make_person

feature
    name : STRING
    age : INTEGER
    address : STRING
    phone_number : INTEGER
    library_card  : INTEGER
    taken_books : ARRAY[BOOKS]
    time : ARRAY[INTEGER]

    make_person(new_name : STRING new_age : INTEGER new_address : STRING new_phone_number : INTEGER new_library_card  :INTEGER)
    do
        name := new_name
        age := new_age
        address := new_address
        phone_number := phone_number
        library_card := new_library_card
        create taken_books.make_empty
        create time.make_empty

    end

    take_book(b : BOOKS)
    do
        if current.age >= b.age_limit then
            if current.age > 12 then
                taken_books.force(b, taken_books.count + 1)
                if b.bestseller then
                    time.force(14, time.count + 1)
                else
                   time.force(21, time.count + 1)
                end
            else
                if current.taken_books.count < 5 then
                    taken_books.force(b, taken_books.count + 1)
                    if b.bestseller then
                       time.force(14, time.count + 1)
                    else
                        time.force(21, time.count + 1)
                    end
                else
                    print("You are too young to bring more than 5 books! %N")
                end
            end

        else
            print("You cannot bring book '" + b.name.out + "', because of age limit!%N")
        end
        ensure
        taken_books.count = time.count
    end

    check_fee(days : INTEGER) : INTEGER
    require
        current.taken_books.count = current.time.count
    local
        i, fee : INTEGER
    do
        from i := 1 until i = time.count + 1
        loop
            if (time[i] - days) < 0 then
                if (days - time[i]) * 100 > taken_books[i].price then
                    fee := fee + taken_books[i].price
                else
                    fee := fee + (days - time[i]) * 100
                end
            end
            i := i + 1
        end
        RESULT :=  fee
    end
end
