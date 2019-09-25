require_relative 'tile'

class Board

    def initialize(grid)
        @grid = grid
    end

    def from_file
        arr = File.readlines('puzzles/sudoku1.txt').map do |line|
            line.split.map do |ele|
                ele.to_s
                ele.split('')
            end
        end
        return arr.map { |ele| ele.flatten}
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