def is_prime?(num)
    return false if num < 2

    (2...num).each { |ele|  return false if num % ele == 0 }
  
    return true 

end

# require "prime"

#     Prime.prime?(num)

# end

def nth_prime(n)
   
    count = 0
    num = 0
    n_prime = nil 

    while count < n
        if is_prime?(num)
            count += 1
            n_prime = num
        end
        num += 1
    end

    n_prime 

end
def prime_range(min, max)
    (min..max).select {|num| is_prime?(num)}
end

