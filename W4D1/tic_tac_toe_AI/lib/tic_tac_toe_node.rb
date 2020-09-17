require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos, :parent, :children
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @parent = nil
    @children = []
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    poss_moves = []
    @board.each_with_index do |row, i|
      row.each_with_index do |ele, k|
        poss_moves << [i,k] if ele.empty?
      end
    end

    poss_moves.each do |move|
      @children << TicTacToeNode.new(@board.dup, @next_mover_mark, @prev_move_pos) 
      @children.last.board.row[move] = @next_move_mark
      @children.prev_move_pos = move
      @children.last.next_mover_mark == :x ? :o : :x
    end

  end
end
