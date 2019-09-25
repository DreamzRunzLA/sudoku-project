require 'colorize'

class Tile
    
    attr_accessor :value

    def initialize(value, given=false)
        @value = value
        @given = given
    end

    def self.to_s
        if self.given == true
            return self.value.to_s
        else
            return self.value.to_s.red
        end
    end

end