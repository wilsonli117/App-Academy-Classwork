require_relative "piece.rb"

class King < Piece
    include Stepable
    
    def symbol
        if self.color == :white
            "♔" 
        else
            "♚"
        end
    end

protected

    def move_diffs
        return 1
    end

end