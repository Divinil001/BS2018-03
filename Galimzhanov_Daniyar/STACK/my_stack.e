deferred class MY_STACK [G]

--create
--    make_stack

feature

    stack : ARRAY[G]

    push(e : G)
    do
        stack.force(e, stack.count + 1)
    end

    pop : G
    require
        not current.is_empty
    do
        RESULT := stack[stack.count]
        stack.remove_tail(1)
    end

    item : G
    require
        not current.is_empty
    do
        RESULT := current.stack[stack.count]
    end

    is_empty : BOOLEAN
    do
        RESULT := stack.count = 0
    end
end
