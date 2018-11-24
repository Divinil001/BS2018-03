class
    SECONDARY
inherit
    EQUIPMENT
redefine
    rent
end

create
    make_secondary
    
feature


    make_secondary(new_type : STRING new_amount : INTEGER)
    require
        new_amount > 0
        do
            type := new_type
            amount := new_amount
        end
    
    rent(n : INTEGER)
    require else
        (amount - n) >= 1
        
        do
            print("Rent secondary")
            amount := amount - n
        end

invariant
    amount > 0
        
end
