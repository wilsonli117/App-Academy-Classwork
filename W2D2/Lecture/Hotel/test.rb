# require_relative "./pet_hotel.rb"

# cat4 = Cat.new("Samantha")

# p cat4

# class Person
#     attr_reader :first_name, :last_name, :age #instance method on the class Class

#     def initialize(first_name, last_name, age)
#         @first_name = first_name
#         @last_name = last_name
#         @age = age
#     end


#     def ==(other_person)
#         self.last_name == other_person.last_name #only needs 1 argument because this instance method uses self
#     end

#     def <(other_person)
#         self.age < other_person.age
#     end


# end

# person1 = Person.new("John", "Doe", 99)
# person2 = Person.new("Jane", "Doe", 99)
# person3 = Person.new("Tony", "Stark", 88)

# p person1.==(person2)
# p person1 == person2
# p person2.==(person3)
# p person3 < person1 #syntactic sugar. same as person3.<(person1)

class Queue
    def initialize 
        @line = []
    end

    def [](position)
        @line[position]
    end

    def []=(position, ele)
        @line[position] =  ele
    end

    def add(ele)
        @line << ele
    end

    def remove
        @line.shift
    end
end

checkout = Queue.new
checkout.add("fido")
checkout.add("asdf")
# p checkout.[](0)
# p checkout[0] #syntactic sugar for line 58

checkout.[]=(0, "Grace")
checkout[0] = "Grace"
p checkout