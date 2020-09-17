module Slideable #for pieces that can move diagonally, across rows/cols, or both(Queen)
    
ORTHOGONAL = [                
    [0, -1], #left
    [0, 1], #right
    [-1, 0], #up
    [1, 0] #down
]

DIAGONAL = [
    [-1, -1], #upleft 
    [-1, 1], #upright 
    [1, -1], #downleft 
    [1, 1] #downright 
]


def orthogonal_dirs #returns array of all possible orthogonal moves
    possible_moves = []
    ORTHOGONAL.each do |dx, dy|
       possible_moves << self.grow_unblocked_moves_in_dir(dx, dy)
    end
    possible_moves
end

def diagonal_dirs #return an array of all possible diagonal moves
    possible_moves = []
    DIAGONAL.each do |dx, dy|
        possible_moves << self.grow_unblocked_moves_in_dir(dx, dy)
    end
    possible_moves
end

def moves
    case self.move_dirs 
    when 1
        self.orthogonal.flatten
    when 2 
        self.diagonal.flatten
    when 3
        self.orthogonal.flatten + self.diagonal.flatten
    end
end

def move_dirs
    raise NotImplementedError #for rook move dirs will only be orthogonal, bishop will only be diagonal, and queen will be both
end

def grow_unblocked_moves_in_dir(dx, dy)
    # stop when there is no more board (between 0,7)
    #stop when there is a piece in the way, if the piece is the same color, it must stop right before
    #if the piece is another color, it can take that piece's pos
    #we can access self.pos (starting position)
    moves = []
    row = self.pos[0] 
    col = self.pos[1]

    while (row + dx).between(0,7) && (col + dy).between(0,7)  #@board[[row, col]] != NullPiece
        row += dx
        col += dy
        if @board[[row, col]] != NullPiece.instance()
            moves << [row, col] if @board[[row, col]].color != self.color 
            break 
        end
        moves << [row, col] 
    end

    moves
end

end

module Stepable #for king and knights
    KNIGHT_MOVES = [
        [-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]
      ]

    KING_MOVES = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1],
        [1, 1],
        [1, -1],
        [-1, 1],
        [-1,-1],
    ]

    def moves
        poss_moves = []

        row = self.pos[0] 
        col = self.pos[1] 

        if self.move_diffs == -1
            KNIGHT_MOVES.each { |dx, dy| poss_moves << [row+dx, col+dy] }
        else
            KING_MOVES.each { |dx, dy| poss_moves << [row+dx, col+dy] }
        end

        poss_moves.select do |poss_move|
            (poss_move[0].between(0,7) && poss_move[1].between(0,7)) && @board[poss_move].color != self.color
        end
    end

    def move_diffs
        raise NotImplementedError #return -1 for knight, 1 for king
    end
end

class Piece
    attr_reader :color
    attr_accessor :pos
    def initialize(color, board, pos)
        @color = color #color needs to be a symbol
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