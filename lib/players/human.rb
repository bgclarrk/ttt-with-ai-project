module Players
    class Human < Player

        def move(board)
            puts "What's your move?"
            gets.chomp
        end

    end
end