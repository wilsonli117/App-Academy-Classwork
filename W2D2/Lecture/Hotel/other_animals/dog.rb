p "running dog file"

class Dog

attr_accessor :name, :age, :favorite_food

    def initialize(name, age, favorite_food)
        @name = name
        @age = age
        @favorite_food = favorite_food
    end

end

my_dog = Dog.new("Eevy", 3, "chicken")
p my_dog

my_dog.age = 4
my_dog.favorite_food = "sushi"
p my_dog.age