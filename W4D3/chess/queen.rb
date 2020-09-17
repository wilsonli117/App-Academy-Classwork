require_relative "piece.rb"

class Queen < Piece
    include Slideable
    
    def symbol
        if self.color == :white
            "♕" 
        else
            "♛"
        end
    end

protected

    def move_dirs
        return 3
    end

end