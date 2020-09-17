module Slideable #for pieces that can move diagonally, across rows/cols, or both(Queen)

end

module Stepable #for king and knights

end

class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board #the board instance the piece lives in
        @pos = pos
    end

    def pos=(val) #to change pos attribute
        self.pos = val
    end

    def valid_moves
        #return an array of valid moves
    end

    def move_into_check?(end_pos)
        #return true if end_pos value is king
    end

end