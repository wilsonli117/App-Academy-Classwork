require_relative "piece.rb"
#require_relative "board.rb"

class Pawn < Piece
    def moves
        self.forward_steps + self.side_attacks
        #black pawns can only move downwards 
        #white pawns can only move upwards 
    end
    
    def symbol
        if self.color == :white
            "♙" 
        else
            "♟"
        end
    end

    
    def at_start_row?
        #if it's black, start row would be 1
        #if it's white, start row would be 6
        #and if it's still in start row, it can jump 2 spaces( if pos[0] is 1 or 6)
        #return true if ^^ false if not
        return true if self.pos[0] == 6 && self.color == :white
        return true if self.pos[0] == 1 && self.color == :black
        false
    end

    def forward_dir #returns 1 or -1
        #return 1 if color is black
        #return -1 if color is white
        return 1 if self.color == :black
        return -1 if self.color == :white
    end

    def forward_steps
        possible_moves = []

        if self.color == :black && self.at_start_row? #[1,3]
            possible_moves << [self.pos[0] + 2, self.pos[1]]
        elsif self.color == :white && self.at_start_row?
            possible_moves << [self.pos[0] - 2, self.pos[1]]
        end

        possible_moves << [self.pos[0] + self.forward_dir, self.pos[1]]

        possible_moves.reject { |move| !@board[move].is_a?(NullPiece) }
        #goes in forward positions 1 step unless position is occupied???
    end

    def side_attacks
        attacks = []
        #if black pawn can row + 1 and col +1/-1 if that position has a piece(that is not same color)
            attacks << [self.pos[0] + self.forward_dir, self.pos[1] + 1]
            attacks << [self.pos[0] + self.forward_dir, self.pos[1] - 1]
        #if white pawn can row - 1 and col +1/-1 if that position has a piece(that is not same color)   
        attacks.reject do |move| 
            @board[move].is_a?(NullPiece) || @board[move].color == self.color 
        end
    end

end