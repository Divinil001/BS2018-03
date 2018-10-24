class
    my_bounded_stack[G]

inherit MY_STACK[G]
redefine
      push
end

create
    make_stack

feature
    capacity : INTEGER

    make_stack(i : INTEGER)
    do
        capacity := i
        create stack.make_empty
    end

    push(e : G)
    do
    if current.stack.count + 1 <= capacity then
        stack.force(e, stack.count + 1)
    else
        print("Not enough space!")
    end
    end
end
