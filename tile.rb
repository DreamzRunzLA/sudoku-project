require 'colorize'

class Tile
    
    attr_accessor :value, :given

    def initialize(value, given=false)
        @value = value
        @given = given
    end

    def to_s
        if @given == true
            return value.to_s
        else
            return value.to_s.red
        end
    end

end