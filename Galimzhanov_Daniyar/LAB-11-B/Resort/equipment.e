deferred class
    EQUIPMENT

    
feature
    type : STRING
    amount : INTEGER

    make_equipment(new_type : STRING new_amount : INTEGER)
    require
        new_amount > 0
        do
            type := new_type
            amount := new_amount
        end
    
    rent(n : INTEGER)
    require
        (amount - n) >= 1
        do
           amount := amount - n
        end
    
invariant
    amount > 0
        
end
