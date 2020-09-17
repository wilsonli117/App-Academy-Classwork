# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(number)
    factors = []

    (1..number).each do |i|
        if number % i == 0
            factors << i
        end
    end

    prime_factors = factors.select { |factor| is_prime?(factor) }

    prime_factors.inject do |acc, el| 
        if acc > el
            acc
        else
            el
        end
    end
end



def is_prime?(n)
    return false if n < 2

    (2...n).each do |i|
       return false if n % i == 0
    end
        true
end



def unique_chars?(str)
    count = Hash.new(0)

    str.each_char do |char|
        count[char] += 1
    end

    if count.any? { |k,v| v > 1 }
        return false
    else
        return true
    end

end


def dupe_indices(arr)
    count = Hash.new(0)
    arr.each do |char|
        count[char] += 1
    end

    multiples = count.select { |k,v| v > 1}

    result = Hash.new([])

    arr.each_with_index do |ele, i| 
        if multiples.has_key?(ele)
            result[ele] += [i]
        end
    end

    result 

end

def ana_array(arr1, arr2)

counter(arr1) == counter(arr2)

end

def counter(arr)
    count = Hash.new(0)

    arr.each do |ele|
        count[ele] += 1
    end

    count
end
