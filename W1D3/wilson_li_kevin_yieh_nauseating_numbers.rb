include Math
require "byebug"
require 'set'
def strange_sums(arr)
    # count = 0 
    # arr.each_with_index do |el1, i| 
    #     arr[i+1..-1].each { |el2| count += 1 if el1 + el2 == 0 }
    # end
    # count
    s = Set.new()
    count = 0
    arr.each do |el|
        count += 1 if s.include? el
        s.add(0-el)
    end
    count
end



def pair_product(arr,prod)
    s = Set.new()
    # arr.each_with_index do |el1,i|
    #     arr[i+1..-1].each {|el2| return true if el1*el2 == prod}
    # end
    arr.each do |el|
        return true if s.include? el
        s.add(prod/el)
    end
    return false

    new_arr = []

    arr.each do |ele|
        return true if new_arr.include?(ele)
        new_arr << (prod/ele)
    end
    
    return false
        
end

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |char| 
        if hash[char] 
            new_str += char * hash[char]
        else
            new_str += char
        end
    end
    new_str
end

def perfect_square(num)
    # (1..num).each do |n|
    #     if n*n == num 
    #         return true
    #     end
    # end
    # return false
    Math.sqrt(num) % 1 == 0
end

def anti_prime?(num)
    fxy = factor_count(num)
    (4...num).none? { |x| factor_count(x) > fxy }
end

def factor_count(num)
    count = 0
    (1..num/2).each { |n| count += 1 if num % n == 0 }
    count   
end

def matrix_addition(mat1,mat2)
    # ans_mat = []
    # mat1.each_with_index do |r,i|
    #     row = []
    #     r.each_with_index do |el,j|
    #         row << el + mat2[i][j]
    #     end
    #     ans_mat << row
    # end
    # ans_mat
    w,l = mat1[0].length, mat1.length
    ans_mat = Array.new(l){Array.new(w)}
    (0...l).each do |i|
        (0...w).each do |j|
            ans_mat[i][j] = mat1[i][j] + mat2[i][j]
        end
    end
    ans_mat
end

def mutual_factors(*num)
    arr = []

    num.each do |n|
        arr << factors(n)
    end

    answer = arr[0]

    arr[1..-1].each { |ele| answer = answer & ele }

    answer
end

def factors(num)
    new_arr = [num]
    (1..num/2).each { |n| new_arr << n if num % n == 0 }
    new_arr << new_arr.shift
end

def tribonacci_number(n)
    # ans = [1,1,2]
    # count = 3
    # while count < n
    #     ans << ans[-3..-1].sum 
    #     count += 1
    # end
    # ans[n-1]
    if n == 1
        return 1
    elsif n == 2
        return 1
    elsif n == 3
        return 2
    else
        return tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)
    end
end


def matrix_addition_reloaded(*mat)
    l, w = mat[0].length, mat[0][0].length
    return nil if !mat.all? { |matrix| l == matrix.length && w == matrix[0].length}

    sum = mat[0]
    mat[1..-1].each do |x|
        sum = matrix_addition(sum, x)
    end

    sum
end

def squarocol?(mat)
    #check by row
    mat.each do |row|
        return true if row.all? {|el| el == row[0]}
    end

    #check by col
    w = mat[0].length
    (0...w).each do |i|
        x = mat[0][i]
        identical = true

        (1...w).each do |j|
            identical = false if x != mat[j][i]
        end
        return true if identical 
    end

    return false
end



def squaragonal?(mat)
    w = mat.length - 1

    check = mat[0][0]
    identical = true
    (1..w).each do |i| 
        identical = false if mat[i][i] != check 
    end

    return true if identical 

    check2 = mat[0][-1]
    (1..w).each do |j|  
        return false if mat[j][w-j] != check2
    end
    
    return true 

end

def pascals_triangle(n)
    #length of the triangle will be n
    triangle = [[1]]
    #i is the nth row and i is also the length of the nth row
    (2..n).each do |i|
        row = []
        (0...i).each do |x|
    # first and last element is always 1
            if x == 0 || x == i - 1
                row << 1
            else
                num1 = triangle[-1][x-1] 
                num2 = triangle[-1][x] 
                row <<  num1 + num2
            end
        end
        triangle << row
    end
    triangle
end

#     1
#    1 1
#   1 2 1
#  1 3 3 1
# 1 4 6 4 1


# 3rd row -> i = 1 => 0 + 1
# 4 -> 1 => 0 + 1
# 4 -> 2 => 1 + 2
# 5 -> 2 => 1 + 2
# 5 -> 3 => 2 + 3


# where x is previous row
# nth -> ith => x[i-1] + x[i]
require "prime"
def mersenne_prime(n)
    nth_mp = 0
    power = 1
    mp = nil

    while nth_mp < n
        num = (2**power) - 1
        if Prime.prime?(num)
            mp = num 
            nth_mp += 1
        end
        power += 1
    end
    mp 
    #     x = -1
    # count = 0
    # while count < n
    #     x += 1
    #     candidate = 2**x - 1
    #     count += 1 if prime?(candidate)
    # end
    #     2**x - 1
end

def triangular_word?(str)
    target = encode(str)
    triangular_num = 0
    i = 1
    while triangular_num < target
        triangular_num = (i * (i + 1)) / 2
        return true if triangular_num == target
        i += 1
    end

    return false
#i * (i + 1)) / 
end

def encode(str)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    sum = 0 
    str.each_char { |char| sum += alphabet.index(char) + 1 }
    sum
end
#find encoded number for the input str
#helper function should return sum of their indexes in the alphabet
# then check if number folows i * (i + 1)) / 2
# while loop, while true, use break once we find it or exceed it 
# otherwise return false

def consecutive_collapse(arr)
    collapsed = true
    while collapsed
        collapsed = false

        arr[0...-1].each_with_index do |el,i|
            if el == arr[i+1] - 1 || el == arr[i+1] + 1
                arr.delete_at(i)
                arr.delete_at(i)
                collapsed = true
                break
            end
        end
    end
    arr
end


#Go through array and check adjacent to see if they are within 1
#If they are within 1, we remove them
#Collapse flag to check if the array was collapsed in a run
#Return mutated array

def pretentious_primes(arr, n)
    arr.map { |num| nearest_prime(num, n) }
end


def nearest_prime(num, n)
    n_prime = 0
    if n > 0
        while n_prime < n 
            num += 1
            n_prime += 1 if Prime.prime?(num)
        end

        return num 
    else
        while n_prime < -n 
            return nil if num < 2 
            num -= 1
            n_prime += 1 if Prime.prime?(num)
        end

        return num 
    end
    
end
#create a function that finds nth nearest prime
# use map in main function 
# replace element with nil, only on -n

