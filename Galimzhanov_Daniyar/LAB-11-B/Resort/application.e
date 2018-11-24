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

feature {NONE} 
    resort : RESORT
    a, b, c, d, e : EQUIPMENT
    p : PEOPLE

    make
            
        do
           create resort.make_resort
           create {SECONDARY} a.make_secondary("Googles", 10)
           create {PRIME} b.make_prime("Skiing", 25)
           create {SECONDARY} c.make_secondary("Googles", 10)
           create {SECONDARY} d.make_secondary("Googles", 10)
           create {SECONDARY} e.make_secondary("Googles", 10)
           create p.make_person("Ivan", 18)
           p.rent_equipment(a)
           p.rent_equipment(b)
           print(p.has_prime)
           --print(p.type(a))
           
        end

end
