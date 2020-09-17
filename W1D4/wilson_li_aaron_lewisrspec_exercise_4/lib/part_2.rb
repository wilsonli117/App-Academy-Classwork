def proper_factors(num)
    (1...num).select {|n| num % n == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num) ? true : false
end

def ideal_numbers(n)
    count = 0
    number = 0
    answer = []

    while count < n 
        number += 1
        if perfect_number?(number)
            answer << number
            count += 1
        end
    end

    answer

end