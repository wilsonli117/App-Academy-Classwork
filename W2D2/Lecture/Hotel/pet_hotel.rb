require_relative "./cat.rb" #every dot is one more level out. You don't technically need the . for files in the same folder
require_relative "./other_animals/dog.rb"

class PetHotel

    def initialize(name)
        @name = name
        @guests = []
    end

    def check_in(guest)
        @guests << guest
    end

end


hotel = PetHotel.new("Animal Inn")

cat1 = Cat.new("Sennacy")
cat2 = Cat.new("Fido")

hotel.check_in(cat1)
hotel.check_in(cat2)

dog1 = Dog.new("Eevy")
dog2 = Dog.new("asdf")

hotel.check_in(dog1)

p hotel
# p Var # needs to be a constant to pull from other file. No local variables