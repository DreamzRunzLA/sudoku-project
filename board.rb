require_relative 'tile'
require 'byebug'

class Board

    attr_reader :grid

    def initialize(grid)
        @grid = grid
    end

    def self.from_file
        arr = File.readlines('puzzles/sudoku1.txt').map do |line|
            line.split.map do |ele|
                ele.to_s
                ele.split('')
            end
        end
        half_arr = arr.map { |ele| ele.flatten}
        # return half_arr

        ans = []

        #Now convert everything to a Tile
        half_arr.each do |sub_array|
            sub = []
            sub_array.each do |ele|
                if ele.to_i == 0
                    sub << Tile.new(ele.to_i, true)
                else
                    sub << Tile.new(ele.to_i)
                end
            end
            ans << sub
        end

        return self.new(ans)

    end

    #important method that will allow you to take 2 ints and access the grid
    #using nested array syntax
    def [](pos)
        if valid_pos?(pos)
            row, col = pos
            @grid[row][col]
        else
            puts "Invalid position"
        end
    end

    #similar to above method except that you are now assigning a value to that
    #pos
    def []=(pos, value)
        if valid_pos?(pos)
            row, col = pos
            if @grid[row][col].given == true
                @grid[row][col] = value
            else
                "Cannot change"
            end
        else
            puts "Invalid position"
        end
    end

    def valid_pos?(pos)
        #Check if input is array
        pos.is_a?(Array) &&
        #Check that only 2 values were given
        pos.count == 2
    end

    def update_tile(pos)

    end

    def render

    end

    def solved?

    end

    def row_solved?

    end

    def col_solved?

    end

    def grid_solved?

    end


end