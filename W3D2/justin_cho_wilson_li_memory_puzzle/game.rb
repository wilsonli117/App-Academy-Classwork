#exposing revealed. do we just change hidden grid?
#first row will be [" ", 0, 1, 2 ,3]
#column idx 0 will be [" ", 0, 1, 2 ,3]
#populate? i.e. 4x4 , there will be 8 pairs ("a".."z").to_a.sample for the pairs
# [rand(1...x), rand(1...x)] if empty?
# input will be "int,int" = [int, int]
require_relative "board"

class Game 
    attr_accessor :board, :previous_guess 
    def initialize(n=5)
        @board = Board.new(n)
        @previous_guess = nil 
    end

    def play 
        until self.board.won? 
            self.board.render 
            position = self.player_input
            self.make_guess(position)
        end
    end

    def player_input
        puts 'please enter a position in this format: row,column:'
        position = gets.chomp.split(",").map(&:to_i)
        position.map!{ |num| num + 1}
    end

    def make_guess(position)
        if @previous_guess.nil? 
            self.board.reveal(position)
            @previous_guess = position 
        elsif position != @previous_guess 
           if !(self.board[position].face_value == self.board[@previous_guess].face_value) 
                self.board.reveal(position)
                self.board.render
                self.board[position].hide
                self.board[@previous_guess].hide
                @previous_guess = nil 
           else
                self.board.reveal(position)
                self.board.render
                @previous_guess = nil 
           end
        else 
            @previous_guess = nil 
        end
    end

end
