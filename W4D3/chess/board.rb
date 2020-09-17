
require_relative "null_piece.rb"
require_relative "pawn.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "queen.rb"
require_relative "knight.rb"
require_relative "king.rb"
require "byebug"
class Board

    attr_accessor :board

    def initialize
        @board = Array.new(8) {Array.new(8, NullPiece.instance()) }
        self.board_setup
    end

    def board_setup
       pawn_i = [1,6] # we can have a place_i hash with premade rows (officer row, pawn row)
       #pawn_row = [Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new]
       #officer_row = [rook, knight, bishop, queen, ]
       #debugger
        self.board.each.with_index do |row, i|
            row.each.with_index do |el, i2|
                if pawn_i.include?(i) && i.even?
                    pos = [i, i2]
                    self[pos] = Pawn.new(:white, self, [i,i2])
                elsif pawn_i.include?(i) && i.odd?
                    #debugger
                    pos = [i, i2]
                    self[pos] = Pawn.new(:black, self, [i,i2])
                end
            end
        end

        officer_i = [0,7]
        self.board.map!.with_index do |row, i|
            if officer_i.include?(i) && i.even?
                [
                Rook.new(:black, self, [0,0]),
                Knight.new(:black, self, [0,1]),
                Bishop.new(:black, self, [0,2]),
                Queen.new(:black, self, [0,3]),
                King.new(:black, self, [0,4]),
                Bishop.new(:black, self, [0,5]),
                Knight.new(:black, self, [0,6]),
                Rook.new(:black, self, [0,7])
                ]
            elsif officer_i.include?(i) && i.odd?
                [
                Rook.new(:white, self, [7,0]),
                Knight.new(:white, self, [7,1]),
                Bishop.new(:white, self, [7,2]),
                Queen.new(:white, self, [7,3]),
                King.new(:white, self, [7,4]),
                Bishop.new(:white, self, [7,5]),
                Knight.new(:white, self, [7,6]),
                Rook.new(:white, self, [7,7])
                ]
            else
                row
            end
        end
    end

    def [](pos)# [i, i2]
        x, y = pos
        self.board[x][y]
    end

    def []=(pos, val)
        x, y = pos
        self.board[x][y] = val
    end

    def move_piece(start_pos, end_pos) #refactor for better checks
        raise "Invalid start position" if !valid_pos?(start_pos) || self[start_pos].is_a?(NullPiece)
        raise "Can not move there" if !valid_pos?(end_pos) || !self[start_pos].moves.include?(end_pos)
        moving_piece = self[start_pos]
        self[end_pos] = moving_piece
        moving_piece.pos = end_pos
        self[start_pos] = NullPiece.instance()
    end

    def valid_pos?(pos)
        return false if (pos[0].between?(0,7) || pos[1].between?(0,7))
    end 

    def find_king(color)
        self.board.flatten.each do |spot|
            return spot.pos if spot.class == King && spot.color == color
        end
    end
    # def add_piece(piece, position)
    #     self[position] = piece
    # end

    def print_board
        self.board.each do |row|
           p row.map { |el| el.symbol }
        end

    end
end

#b = Board.new
# pawn = Pawn.new(:white, b, [6, 0])
# b.add_piece(pawn, [6, 0])
# p b[[6, 0]]