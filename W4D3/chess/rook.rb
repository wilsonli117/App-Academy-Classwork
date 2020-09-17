require_relative "piece.rb"

class Rook < Piece
    include Slideable

    def symbol
        if self.color == :white
            "♖" 
        else
            "♜"
        end
    end

protected

def move_dirs
    return 1
end

end

