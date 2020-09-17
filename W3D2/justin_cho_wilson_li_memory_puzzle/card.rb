class Card

    attr_accessor :face_value

    def initialize(face_value)
        @face_value = face_value
        @face_up = false

    end

    def face_up?
        @face_up
    end

    def display_card
        self.face_value if self.face_up?
    end

    # def ==(card)
    #     self.face_value == card.face_value
    # end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s

    end


end