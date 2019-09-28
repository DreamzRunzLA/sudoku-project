require_relative 'tile'
require 'byebug'

class Board

    attr_reader :grid

    def initialize(grid)
        @grid = grid
    end

    def self.from_file
        arr = File.readlines('puzzles/sudoku1_solved.txt').map do |line|
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
                @grid[row][col].value = value
            else
                "Cannot change tiles that have already been set by the puzzle"
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

    def update_tile(pos, value)
        if self.[](pos).given == false
            puts "This tile is not available to change"
        else
            self.[]=(pos, value)
        end
    end

    def render
        system("clear")
        puts "  #{(0...@grid.length).to_a.join(' ')}"
        @grid.each_with_index do |row, i|
            puts "#{i} #{row.join(' ')}"
        end
    end

    def solved?
        return self.row_solved? && self.col_solved? && self.grid_solved?
    end

    def row_solved?
        @grid.each do |row|
            naked_row = []
            row.each do |tile|
                naked_row << tile.value
            end
            if naked_row.sort != [1,2,3,4,5,6,7,8,9]
                return false
            else
                next
            end
        end
        return true
    end

    def col_solved?
        @grid.each_index do |index|
            col = []
            @grid.each do |row|
                col << row[index].value
            end
            if col.sort != [1,2,3,4,5,6,7,8,9]
                return false
            else
                next
            end
        end
        return true
    end

    def grid_solved?
        third1 = [0,1,2]
        third2 = [3,4,5]
        third3 = [6,7,8]

        grid1 = [third1, third1]
        grid2 = [third1, third2]
        grid3 = [third1, third3]
        grid4 = [third2, third1]
        grid5 = [third2, third2]
        grid6 = [third2, third3]
        grid7 = [third3, third1]
        grid8 = [third3, third2]
        grid9 = [third3, third3]

        grids = [grid1, grid2, grid3, grid4, grid5, grid6, grid7, grid8, grid9]

        myCheck = []
        grids.each do |grid|
            digits = []
            grid[0].each do |i|
                grid[1].each do |j|
                    digits << @grid[i][j].value
                end
            end
            myCheck <<  digits
        end
        return myCheck.all? {|ele| ele.sort == [1,2,3,4,5,6,7,8,9]}
    end




end