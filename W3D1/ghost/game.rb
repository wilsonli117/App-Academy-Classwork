require_relative "player.rb"
# Game::DICTIONARY

require "set"

class Game
    attr_accessor :dictionary, :fragment, :players

    def initialize
        @players = []
        @fragment = ""
        @dictionary = Set.new
        File.open('dictionary.txt').each { |word| @dictionary << (word.chomp) }
    end

    def current_player
        @players.first
    end

    def previous_player
        @players.last
    end

    def next_player!
        @players.rotate!(1)
    end

    def take_turn(player)
        puts "Please enter a letter"
        letter = gets.chomp.downcase
        if valid_play?(letter)
            @fragment += letter
        else
            take_turn(player)
            raise "Invalid play"
        end
        
    end

    def valid_play?(string)
        return false if string.length > 1 || !("a".."z").to_a.include?(string)
        if !dictionary.select {|ele| ele.start_with?(@fragment + string)}.empty?
            return true
        else
            return false
        end
    end

   
        

    def play_round
    end
        



end