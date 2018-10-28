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

feature
    b1, b2 : BOOKS
    Ivan, Ann : PERSON
    a :ARRAY[PERSON]

    make
        do
           create a.make_empty
           create b1.make_book("War and Peace", "Lev Nikolaevich Tolstoy",  12, TRUE, 1000)
           create b2.make_book("Crime and punishement", "Fedor Michailovich Dostoevskiy",  18, TRUE, 800)
           create Ivan.make_person("Ivan", 12, "Innopolis", 88888,  001)
           create Ann.make_person("Ann", 12, "Innopolis", 66666,  002)

           Ivan.take_book(b1)
           Ivan.take_book(b1)
           print(Ivan.taken_books.count)
           Ann.take_book(b1)
           --Ivan.check_fee(30)
           a.force(Ivan, a.count + 1)
           a.force(Ann, a.count + 1)
           print(get_fee(a, 30))
        end

    get_fee(m : ARRAY[PERSON] d  :INTEGER) : INTEGER
    local
        i, j, k, fee : INTEGER
    do
        j := 0
        from i := 1 until i = m.count + 1
        loop
            if m[i].check_fee(d) > 0 then
                print(m[i].name + " you should total pay: " + m[i].check_fee(d).out + "%N")
                print(m[i].taken_books.count.out + " books %N")
                from k := 1 until k = m[i].time.count + 1
                loop
                    if (m[i].time[k] - d) < 0 then
                        if (d - m[i].time[k]) * 100 > m[i].taken_books[k].price then
                            fee := m[i].taken_books[k].price
                    else
                            fee := (d - m[i].time[k]) * 100
                    end
                    print("Book: " + m[i].taken_books[k].name + " debt: " + fee.out + "%N")
                    k := k + 1
            end


                    print(m[i].taken_books)
                end
            end
            i := i + 1
        end
        RESULT := j
    end
end
