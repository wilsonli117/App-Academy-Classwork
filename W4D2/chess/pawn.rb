require "piece.rb"

class Pawn < Piece
    def move_dirs
        #black pawns can only move downwards
        #white pawns can only move upwards
    end

    private 
    
    def at_start_row?
        #if it's black, start row would be 1
        #if it's white, start row would be 6
        #and if it's still in start row, it can jump 2 spaces( if pos[0] is 1 or 6)
        #return true if ^^ false if not
    end

    def forward_dir #returns 1 or -1
        #return 1 if color is black
        #return -1 if color is white
    end

    def forward_steps
        #goes in forward positions 1 step unless position is occupied???
    end

    def side_attacks
        #if black pawn can row + 1 and col +1/-1 if that position has a piece
        #if white pawn can row - 1 and col +1/-1 if that position has a piece

    end

end