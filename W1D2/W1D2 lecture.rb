# def is_prime?(num)
#     (2..num).each do |factor|
#       return false if num % factor == 0
#     end

#     num > 1
#     true
# end

# p is_prime?(99)
# p is_prime?(13)
# require "byebug"

# def avg(a, b)
#     sum = a + b
#     sum / 2.0
# end

# debugger
# first_result = avg(15,20)
# second_result = first_result + 0.5

# p second_result
# require "byebug"

# def is_prime?(number)
#     (2...number).each do |factor|
#         return false if number % factor == 0
#     end
    
#     true
# end

# def first_n_primes(num_primes)
#     primes = []
#     num = 2

#     while primes.length < num_primes
#         primes << num if is_prime?(num)
#         num += 1
#     end

#     primes
# end

#  debugger
# p first_n_primes(5) # => [2,3,5,7,11]

#use control + c to kill infinite loops

#  SyntaxError = language/grammar errors. given line# on error will usually not be correct
#  NameError = undefined variable. Common from mispellings of variables
#  NoMethodError = type of NameError, undefined method 
#  ArgumentError = incorrect number of arguments passed into method 
#  TypeError = inccompatible data types, i.e. can't add an integer and a string

def add_and_proc(num_1, num_2, &prc) #&paramter will automatically convert a block into a proc object
    sum = num_1 + num_2
    prc.call(sum)
end


# # doubler = Proc.new { |x| x * 2 }
# p add_and_proc(2, 3) { |x| x * 2 }

negate = Proc.new { |x| -1 * x }
# p add_and_proc(6, 3) { |x| -1 * x }

# p add_and_proc(2, 3, &negate)
# &arg will convert the proc into a block

[1,2,3].map { |x| x * 2 }

def my_map(arr, &prc)
    # arr.map(&prc)
    new_arr = []

    arr.each { |ele| new_arr << prc.call(ele)}

    new_arr
end


p my_map([1,2,3], &negate)