require_relative 'tile'
require_relative 'board'
require 'byebug'

class Game

    attr_reader :board, :solver

    def initialize(solver=nil)
        @board = Board.from_file
        @solver = solver
    end

    #Game loop
    def play
        #Keep looping and playing the game until the won? method returns true
        #for the baord
        until @board.solved?
            #Constantly render the board
            @board.render
            #Constantly obtain the position for the player
            pos = get_player_input
            #Constantly have the player make a guess
            make_guess(pos)
        end

        puts "Congratualtions! You won."
    end

    def get_player_input

    end

    def make_guess
    
    end

    def valid_pos?(pos)
        #Check if input is array
        pos.is_a?(Array) &&
        #Check that only 2 values were given
            pos.count == 2 &&
            #Check that the numbers given fall within the boundaries of the board
            pos.all? { |x| x.between?(0, 8) }
    end

    def valid_val?(value)
        #Check if input is array
        value.is_a?(Integer) &&
        #Check that the numbers given fall within the boundaries of the board
        value.between?(1, 9)
    end


end