require_relative "passenger.rb"

class Flight 
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number 
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger) 
       @passengers << passenger if passenger.has_flight?(@flight_number) && !self.full?
    end

    def list_passengers
        @passengers.map {|ele| ele.name} 
    end

    def [](i)
        self.passengers[i]
    end

    def <<(passenger_instance)
        self.board_passenger(passenger_instance)
    end

end