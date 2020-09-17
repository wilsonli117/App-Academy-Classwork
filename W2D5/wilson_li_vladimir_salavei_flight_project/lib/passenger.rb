class Passenger

    attr_reader :name #:flight_numbers we don't want to give outside access (encapsulation)

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(str)
        @flight_numbers.include?(str.upcase) #possibly convert to integer
    end

    def add_flight(str)
        @flight_numbers << str.upcase if !self.has_flight?(str) #shovel operator mutates not reassigns
    end
        

end