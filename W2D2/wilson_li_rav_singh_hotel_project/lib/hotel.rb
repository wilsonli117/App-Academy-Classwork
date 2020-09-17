require_relative "room"

class Hotel
    def initialize(name, capacity)
        @name = name
        @rooms = {} #Hash.new {|h,k| rooms[h] = Room.new(cap)} 

         capacity.each do |room_name, cap|
             @rooms[room_name] = Room.new(cap)
         end
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
         @rooms.has_key?(room) ? true : false
    end

    def check_in(person, room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(person) #need to access hash value for room instance
                print "check in successful"
            else
                print "sorry, room is full"
            end
        else
            print "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.any? { |k,v| !v.full? }
    end

    def list_rooms
        @rooms.each do |k,v| 
            puts "#{k}.*#{v.available_space}" #this is tested with regexp in rspec
        end
    end
  
end

# /Basement.*4\nAttic.*2\nUnder the Stairs.*0\n/
