require_relative 'tile'
require_relative 'board'
require 'byebug'

class Game

    attr_reader :board

    def initialize
        @board = Board.from_file
    end

    


end