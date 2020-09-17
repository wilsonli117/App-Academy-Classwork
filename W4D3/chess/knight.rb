require_relative "piece.rb"

class Knight < Piece 
    include Stepable

    def symbol
        if self.color == :white
            "♘" 
        else
            "♞"
        end
    end

    def move_diffs
        return 1
    end

end