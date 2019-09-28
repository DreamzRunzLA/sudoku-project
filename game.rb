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
            pos = get_player_input[0]
            val = get_player_input[1]

            @board.update_tile(pos, val)
        end

        puts "Congratualtions! You won."
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

    #Here you are initially setting pos to be nil
    def get_player_input
        pos = nil
        val = nil

        #Do not end the loop until a valid position comes through and that
        #position is not simply nil
        until pos && self.valid_pos?(pos) && val && self.valid_val?(val)
            the_array = self.get_input
            #Once you recive a valid position, you can set the position to that
            #player's input and return it
            pos = the_array[0]
            val = the_array[1]
        end
        
        puts "input succeeded"
        return the_array
    end

    def prompt
        puts "please enter a row, col, and value separated by a comma"
        print "> "
    end

    def get_input
        #prompt is a custom function you defined to print to console a command
        #to the user
        prompt
        #parse is a custom function you are defining below to handle user input
        #STDIN will prioritize reading the user's input
        raw = gets.chomp
        raw_array = raw.split(',')
        print raw_array

        outer_array = []
        inner_array = []
        inner_array << raw_array[0].to_i
        inner_array << raw_array[1].to_i
        outer_array << inner_array
        outer_array << raw_array[2].to_i
        return outer_array
    end


end