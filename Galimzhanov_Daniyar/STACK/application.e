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
    a : MY_BOUNDED_STACK[INTEGER]

    make

        do
          create a.make_stack(2)
          a.push(5)
          print(a.item)
          a.push(7)
          print(a.item)
          print(a.pop)
          print(a.pop)
          print(a.is_empty)

        end

end
