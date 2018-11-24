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

    fact(n : INTEGER) : INTEGER
        do
            if n = 1 or n = 0 then
                Result := 1
            else
                Result := n * fact(n - 1)
            end
        end

    cnk(n, k : INTEGER) : INTEGER
        do
            Result := fact(n) // fact(k) // fact(n - k)
        end

    quantity(n : INTEGER) : INTEGER
        local
            k : INTEGER
        do
            Result := 0
            from k := 0 until k > n loop
                Result := Result + cnk(n, k)
                k := k + 1
            end
        end

    powerset(s : LINKED_SET[INTEGER]) : LINKED_SET[LINKED_SET[INTEGER]]
        local
            cp : LINKED_SET[INTEGER]
        do
            create Result.make;
            Result.compare_objects
            Result.put(s)

            across s as i loop
                create cp.make;
                
                cp.compare_objects
                cp.copy(s)
                cp.prune(i.item)
                Result.merge(powerset(cp))
            end
        ensure
            valid_length: Result.count = quantity(s.count)
        end

    make
        local
            n, t, i : INTEGER
            s       : LINKED_SET[INTEGER]
            ps      : LINKED_SET[LINKED_SET[INTEGER]]
        do
            create s.make
            s.compare_objects
            
            io.read_integer
            n := io.last_integer
            
            from i := 0 until i >= n loop
                io.read_integer
                t := io.last_integer
                s.put(t)
                i := i + 1
            end
            
            ps := powerset(s)
            
            across ps as it loop
                io.put_string("( ")
                across it.item as j loop
                    io.put_integer(j.item)
                    io.put_string(" ")
                end
                io.put_string(")%N")
            end
        end
end
