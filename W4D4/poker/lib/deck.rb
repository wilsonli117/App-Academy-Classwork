require_relative "card.rb"

class Deck
    attr_reader :deck

    FACES = [
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        :J,
        :Q,
        :K,
        :A
    ].freeze

    SUITS = [
        :diamonds,
        :clubs,
        :hearts,
        :spades
    ].freeze

    def initialize
        @deck = []
        build_deck
    end

    def build_deck
        FACES.each { |face| SUITS.each { |suit| @deck << Card.new(face, suit) } }
        self.deck.shuffle! 
    end


end