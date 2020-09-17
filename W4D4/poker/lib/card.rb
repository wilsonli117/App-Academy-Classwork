class Card
    attr_reader :face, :suit
    
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

    def initialize(face, suit)
        raise "Not a valid card" if !FACES.include?(face) || !SUITS.include?(suit)
        @face = face
        @suit = suit
    end

end
