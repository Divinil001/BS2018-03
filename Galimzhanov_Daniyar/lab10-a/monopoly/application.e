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
    player:PLAYER
    monopoly: MONOPOLY

feature {NONE} -- Initialization

    make
            -- Run application.
        do
            -- Add your code here
            create player.create_player("lox")
            create monopoly.create_game

        end

end
