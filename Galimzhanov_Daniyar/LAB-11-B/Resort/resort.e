class
    resort

create
    make_resort
        
feature
    primary_equip : ARRAY[PRIME]
    secondary_equip : ARRAY[SECONDARY]
    
    make_resort
        do
            create primary_equip.make_empty
            create secondary_equip.make_empty
        end
    
    add_primary(a : PRIME)
        do
            primary_equip.force(a, primary_equip.count + 1)
        end
    
     add_secondary(a : SECONDARY)
        do
            secondary_equip.force(a, secondary_equip.count + 1)
        end
    
    rent_equipment(a : EQUIPMENT n : INTEGER p : PEOPLE)
        do
            a.rent(n)
        end
    
end
