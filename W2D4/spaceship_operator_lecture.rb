# <=> will return -1, 0, 1 : less than, equal, greater then

# def compare(a, b)
#     if (a <=> b) == -1
#         puts "a is less than b"
#     elsif (a <=> b) == 1
#         puts "a is greater than be"
#     else
#         puts "a is equal to b"
#     end
# end

# puts compare(3,5)
# puts compare(3,3)

# def bubble_sort(array, &prc)
#     sorted = false
#     while !sorted
#         sorted = true

#         (0...array.length - 1).each do |i|
#             if prc.call(array[i],array[i+1]) == -1
#                 array[i], array[i+1] = array[i+1], array[i]
#                 sorted = false
#             end
#         end
#     end
#     array
# end

# p bubble_sort([1,3,5,2]) { |a, b| a <=> b }
# sorted = bubble_sort(["y", "z", "b", "d", "a", "m"]) do |a,b|
#     alpha = ("a".."z").to_a
#     a <=> b
# end

# p sorted

#only false and nil are falsey
#everything else is truthy

# if nil
#     p "it is truethy"
# else 
#     p "it is falsey"
# end

# a || b : when the a is truthy, return a. 
# when a is falsey, return b

# p false || 42 #=> 42
# p 42 || 36 #=> 42
# p "nil" || true #=> "nil"
# p nil || false #=> false
# p 0 || "asdf" #=> 0

# def greet(person = nil)
#     # person = person || "you"
#     person ||= "you"

#     p "Hey " + person
# end

# greet
# greet("Jeff")
# greet("Wilson")

# def call_that_proc(val, &prc)
#      prc ||= Proc.new { |x| "Come on #{val}, you forgot the proc"}
#     #  p prc
#     prc.call(val)
# end

# p call_that_proc('alvin') {|x| x.upcase + "!!!!"}
# p call_that_proc('wilson')

class Restaurant
    attr_accessor :name, :chefs, :menu

    def initialize(name, chefs)
        @name = name
        @chefs = chefs
        #@menu = ["asd", "asdasd", "asdasdasd", "asdasdasd"]
    end

    def menu
        @menu ||= ["asd", "asdasd", "asdasdasd", "asdasdasd"]
    end

end

p restaurant = Restaurant.new("asdasd", "asdasd")
p restaurant.menu
p restaurant

    
