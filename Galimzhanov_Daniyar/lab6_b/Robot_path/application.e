class
    APPLICATION

inherit
    ARGUMENTS

create
    make

feature {NONE}

    path(f : ARRAY[ARRAY[INTEGER]]; n, m : INTEGER) : ARRAY[STRING]
        local
            tmp : ARRAY[STRING]
        do
            create tmp.make_empty
            tmp.force("NIL", 1)
            tmp.compare_objects
            Result := tmp

            if n = 1 and m = 1 then
                create Result.make_empty
            else
                if n /= 1 and f.item(n - 1).item(m) = 1 then
                    Result := path(f, n - 1, m)
                    
                    if not tmp.is_equal(Result) then
                        Result.force("DOWN!%N", Result.count + 1)
                    end
                end

                if m /= 1 and tmp.is_equal(Result) and f.item(n).item(m - 1) = 1 then
                    Result := path(f, n, m - 1)
                    
                    if not tmp.is_equal(Result) then
                        Result.force("RIGHT!%N", Result.count + 1)
                    end
                end
            end
        end

    make
        local
            n, m, i, j, k : INTEGER
            field : ARRAY[ARRAY[INTEGER]]
            tmp, p : ARRAY[STRING]
        do
            create field.make_empty;
            
            io.put_string("n is ")
            io.read_integer
            n := io.last_integer
            
            io.put_string("m is ")
            io.read_integer
            m := io.last_integer
            
            from i := 1 until i > n loop
                field.force(create {ARRAY[INTEGER]}.make_empty, i)

                from j := 1 until j > m loop
                    io.put_string("Input ")
                    io.put_integer(i)
                    io.put_string(" ")
                    io.put_integer(j)
                    io.put_string(" ")
                    
                    io.read_integer
                    k := io.last_integer
                    field.item(i).force(k, j)
                    
                    j := j + 1
                end
                i := i + 1
            end
            
            p := path(field, n, m)
            create tmp.make_empty
            tmp.force("NIL", 1)
            tmp.compare_objects
            
            if tmp.is_equal(p) then
                io.put_string("%NNo path!%N")
            else
                io.put_string("%NPath is:%N")
                across p as it loop
                    io.put_string(it.item)
                end
            end
        end
end

