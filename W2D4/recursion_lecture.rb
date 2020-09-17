# def say_hello
#     p 'hello'
#     say_hello
# end

# say_hello #Stack Error. Infinite loop will use up all memory

# def countdown(n)
#     if n < 1 #this is a base case
#         return p "lift off!"
#     end

#     p n
#     countdown(n-1) #recursive, calling the same method again
    
# end

# countdown(10)

#almost anything that can be done recursively, you can do iteratively 

# def factorial(n)
#     return 1 if n == 0
#     #count = 0

#     return n * factorial(n-1)
# end

# p factorial(10)

def fib(n)
    # if n == 1 
    #     return 1
    # elsif n == 2
    #     return 1
    # else
    #     return fib(n-1) + fib(n-2)
    # end
    raise "Invalid Input" if n < 1
    return 1 if n == 1 || n == 2
    fib(n-1) + fib(n-2)

    
end

p fib(6)