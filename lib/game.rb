require 'pry'

class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        self.board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
        winning_combination = []
        WIN_COMBINATIONS.each do |combo|
            if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]]
                winning_combination = combo
                @winning_token = @board.cells[combo[0]]
            end
        end
        winning_combination.empty? ? false : winning_combination
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        @board.full?
    end

    def winner
        self.won?
        @winning_token == " " ? nil : @winning_token
    end

    def turn
        current_player = player_1 unless current_player = player_1
        input = current_player.move(@board)
        if @board.valid_move?(input) == false
            turn
        end
        current_player = player_2
    end

end