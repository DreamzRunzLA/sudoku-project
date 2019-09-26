require_relative 'tile'
require 'byebug'

class Board

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