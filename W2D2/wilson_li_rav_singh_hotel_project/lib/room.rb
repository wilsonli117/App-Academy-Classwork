class Room
    def initialize(capacity)
        @capacity = capacity 
        @occupants = []

    end

    def capacity 
        @capacity 
    end

    def occupants 
        @occupants 
    end

    def full? 
        # if @occupants.count < @capacity 
        #     return false 
        # else  
        #     return true 
        # end
        @occupants.count < @capacity ? false : true
    end

    def available_space 
        @capacity - @occupants.count 
    end

    def add_occupant(name)
        if self.full? 
            return false 
        else 
            @occupants << name 
            return true 
        end
    end

end
