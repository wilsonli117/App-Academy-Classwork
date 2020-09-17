class Cat

# attr_accessor :age
# attr_accessor :color
# attr_accessor :name
# attr_reader
# attr_writer

def initialize(name, color, age="unknown") #can have multiple default values. can also use splat operator *
    @name = name
    @color = color
    @age = age
    
end

def age # getter
    @age 
end

def age=(new_age) #setter
    @age = new_age
end

def name #getter
    @name
end

def meow_at(person)
    puts "#{@name} meows at #{person}"
end

end

cat1 = Cat.new("asdf", "blue")

# cat1.age = 99
# cat1.name = "coco"

# p cat1.age
# p cat1.name
# cat1.meow_at("wilson")

class Car

    # NUM_WHEELS = 4
    @@num_wheels = 4

    def initialize(color)
        @color = color
    end

    def self.upgrade=(num)
        # NUM_WHEELS = 0
        @@num_wheels = num
    end

    def num_wheels
        # NUM_WHEELS 
        @@num_wheels
    end

end

car_1 = Car.new("black")
car_2 = Car.new("red")

# p car_1.num_wheels
# p car_2.num_wheels

# Car.upgrade = 10
#  
# p car_1.num_wheels
# p car_2.num_wheels

# p Car::NUM_WHEELS #how to access class variables


class Dog
    def initialize(name)
        @name = name
        # Dog.make_clone(name)
    end

    def self.bark #class method because .self in method name
        "WOOF!!"
    end

    def self.compare_dogs(dog_1, dog_2)
        if (dog_1.name.length > dog_2.name.length)
            return dog_1.name
        else
            return dog_2.name
        end
    end

    # def self.make_clone(name)
    #     Dog.new(name)
    # end

    def yell_name
        @name.upcase + "!"
    end

    # def greet
    #     self.yell_name + " says hi." #use self mostly 
    # end
    def name
        @name
    end

end
#Dog::bark is a class method, usually used for utility methods. Doesn't call on attributes
#Dog#yell_name is an instance method, 

d1 = Dog.new("Eeevy")
# p dog_1.greet

d2 = Dog.new("fido")
# p dog_2.greet

# p Dog.compare_dogs(d1, d2)

#Monkey patching is adding additional methods to an existing class

# class String 
#     def upcase?
#         self == self.upcase
#     end
# end

# p "hello".upcase? #false
# p "HELLO".upcase? # true

# class Integer
#     def prime?
#         return false if self < 2
#         (2...self).each {|num| return false if self % num == 0 }
#         return true
#     end
# end

# p 5.prime? 
# p 12.prime?
# p 3.prime?

class Array
    def contains_0?
        self.include?(0)
    end
        
end

p [1,2,3,4].contains_0?
p [5,0].contains_0?
p ["a", "b", 3, 5, "zoo"].contains_0?

#require
# we right on the "main" class. whenever we write a new method that does anything, 
# it's an instance method of the "Main" class
# Main is just this gigantic object that we can define whatever we want
