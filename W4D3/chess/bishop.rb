require_relative "piece.rb"

class Bishop < Piece
    include Slideable

    def symbol
        if self.color == :white
            "♗" 
        else
            "♝"
        end
    end

    def move_dirs
        return 2
    end

end