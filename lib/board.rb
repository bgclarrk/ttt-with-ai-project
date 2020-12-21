class Board
    attr_accessor :cells

    def initialize
        self.reset!
    end

    def cells
        @cells
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts " ------------ "
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts " ------------ "
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        @cells[input.to_i - 1]
    end

    def full?
        @cells.include?(" ") ? false : true
    end

    def turn_count
        turns = 9
        @cells.each do |cell|
           turns -= 1 if cell == " "
        end
        turns
    end

    def taken?(position)
        @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
    end

    def valid_move?(input)
        input.to_i.between?(1, 9) && self.taken?(input) != true
    end

    def update(position, player)
        @cells[position.to_i - 1] = player.token
    end

end