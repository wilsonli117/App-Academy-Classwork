
require_relative "null_piece.rb"

class Board

    attr_accessor :board

    def initialize
        @board = Array.new(8) {Array.new(8, NullPiece.instance() }
        self.board_setup
    end

    def board_setup
       place_i = [0,1,6,7] # we can have a place_i hash with premade rows (officer row, pawn row)
       #pawn_row = [Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new]
       #officer_row = [rook, knight, bishop, queen, ]
       #(0...self.board.length).each do |i|
        self.board.map!.with_index do |row, i|
            if place_i.include?(i)
                Array.new(8) {Piece.new}
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

    def move_piece(start_pos, end_pos)
        raise "Invalid start position" if (!start_pos[0].between?(0,7) || !start_pos[1].between?(0,7)) || self[start_pos].is_a?(NullPiece)
        raise "Can not move there" if !end_pos[0].between?(0,7) || !end_pos[1].between?(0,7)
        self[end_pos] = self[start_pos]
        self[start_pos] = nil

    end
















end