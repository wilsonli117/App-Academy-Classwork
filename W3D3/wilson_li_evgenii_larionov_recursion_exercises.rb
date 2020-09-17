def range(start, ending)
    
    return [] if start >= ending
    beginning = start+1
    [start] + range(beginning, ending)
    
end

def exponentiation1(base, n)
    return 1 if n == 0 
    return base if n == 1
    # return 1.0/(base * exponentiation1(base, n+1)) if n < 0
    base * exponentiation1(base, n-1)
end

def exponentiation2(base, n) #n can not be negative
    return 1 if n == 0 
    return base if n == 1
e(2)
    
    if n.even? 
        exponentiation2(base, n/2)**2
    else
        base * exponentiation2(base, (n-1)/2)**2
    end



end

#  exp(b, n / 2) ** 2              [for even n]
#  b * (exp(b, (n - 1) / 2) ** 2   [for odd n]

# p exponentiation1(2,10) #=> 1024
# p exponentiation1(3,3) #=> 27
# p exponentiation1(10, 3) #=> 1000
# p exponentiation1(1000, -3) #=> 1/3

def deep_dup(array)
    return [array] if !array.is_a?(Array)
    new_array = []
    array.each do |ele| 
        if ele.is_a?(Array)
           new_array += [deep_dup(ele)]
        else
            new_array << ele
        end
    end
    new_array
end

# a = [1,2,[3],4,[5,6]]
# b = ["A", "bc", [1,"a","b"], 9, [99]]
# c =  deep_dup(a)
# d = deep_dup(b)
# p a[2].object_id
# p b[2].object_id
# p c[2].object_id
# p d[2].object_id

#robot_parts_copy[1] << "LEDs"
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

# def fibonacci(n) # every fibonacci number is the sum of the previous 2 fib numbers
#     return [] if n <= 0
#     return [1] if n == 1
#     return [1,1] if n == 2
# # You shouldn't have to pass any arrays between methods

#     previous = fibonacci(n-1)
#     new_ele = previous[-1] + previous[-2]
#     previous << new_ele
#     #previous + [new_ele]

# end

def fibonacci(n)
 #   a.take(3) >> [1,2,3]
  #  return [] if n == 0
    if n <= 2
        [1,1].take(n) #take(0) returns []
    else 
        previous = fibonacci(n-1)
        new_ele = previous[-1] + previous[-2]
        previous << new_ele
    end
end


# p fibonacci(0) #=> [1,1,2,3,5]
# p fibonacci(9) #=> [1,1,2,3,5,8,13,21,34]
require "byebug"
def bsearch(array, target)
    return nil if array.empty?
    center_idx = array.length/2
    middle = array[center_idx]
    less = array[0...center_idx]
    more = array[center_idx+1..-1]#won't include middle
    #debugger
    if middle == target
        return center_idx
    elsif middle < target
        (less.length + 1) + bsearch(more, target) if bsearch(more, target) != nil
    else 
        #debugger
        bsearch(less, target)  #[1,2,3]
    end
    #solution used case statement and target <=> middle
end
# [1,2,3].llength +[middle].length

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2 
# p bsearch([1, 3, 4, 5, 9], 5) # => 3        
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5 
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil 


def merge_sort(array)
    return array if array.length < 2

    first_half = array[0...array.length/2]
    second_half = array[array.length/2..-1]
    #debugger
    merge(merge_sort(first_half), merge_sort(second_half)) 
  
    # sorted_first = merge(sorted_first)
    # sorted_half = merge(sorted_half)

end

def merge(arr1, arr2) 
    return arr2 if arr1.empty? 
    return arr1 if arr2.empty?
    new_arr = []
    if arr1[0] >= arr2[0]
        new_arr += [arr2[0]] + merge(arr1, arr2[1..-1]) #arr[0] can be from either one
    else 
       new_arr += [arr1[0]] + merge(arr1[1..-1], arr2)
    end # arr1.
    new_arr

end

# p merge_sort([1,9,11,5,3,199,2999,13,2,1,15,17,28,4,41,33,21])


class Array
def subsets
    return [[]] if self.empty?
    
    subs = self[0...-1].subsets 
    subs + subs.map {|sub| sub + [self.last]}

    # new_arr = []
    # (0...arr.length).each do |i|
    #     (i...arr.length).each do |k|
    #         new_arr << arr[i..k]
    #     end
    # end

    # new_arr
        
end
end

p [].subsets # => [[]]
p [1].subsets # => [[], [1]]
p [1,2].subsets # => [[], [1], [2], [1, 2]]
p [1,2,3].subsets
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]