class
    PEOPLE

create
    make_person

feature
    name : STRING
    age : INTEGER
    rented : ARRAY[EQUIPMENT]
    
    
    make_person(new_name : STRING new_age : INTEGER)
        do
            name := new_name
            age := new_age
            create rented.make_empty
        end
    
    has_prime : BOOLEAN
    local
        i, j : INTEGER
        do
            from i := 1 until i = rented.count + 1
            loop
                if attached {PRIME} rented[i] as a then
                    j := j + 1
                end
                i := i + 1
            end
            if j > 0 then
                RESULT := TRUE
            end
        end
    
    rent_equipment(a : EQUIPMENT)
    require
         current.type(a) ~ "SECONDARY" implies has_prime
        do
            rented.force(a, rented.count + 1)
        end
    type(a : EQUIPMENT) : STRING
        do
            RESULT := " "
            if attached {PRIME} a as s then
                RESULT := "PRIME"
            end
            if attached {secondary} a as s then
                RESULT := "SECONDARY"
            end
        end
end
