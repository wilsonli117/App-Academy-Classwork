def my_min(arr) #O(n^2) time complexity, space complexity is O(1) ele1 and ele2
    arr.each do |ele1| # O(n), n is determined by the amount of eles in array
        return ele1 if arr.all? { |ele2| ele1 <= ele2 } #O(n)
    end
end

def my_min(arr) #O(n) time complexity
    min = arr.first #O(1)
    arr.each { |ele| min = ele if ele < min } #O(n)
    min #O(1)
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)


# def largest_contiguous_subsum(arr)

#     sub_arr = []
#     (0...arr.length).each do |idx1|
#         (idx1...arr.length).each do |idx2|
#             sub_arr << arr[idx1..idx2]
#         end
#     end

#     hash = Hash.new
#     sub_arr.each { |sub| hash[sub] = sub.sum }
#     hash.values.max

# end


def largest_contiguous_subsum(arr) #O(n^3) time complexity
    #n = arr.length, n always stays the same as it is the input
    subsets = [] #O(1)
    (0...arr.length).each do |i| #O(n)
        (i...arr.length).each do |k| #O(n)
            subsets << arr[i..k].sum #O(n)
        end
    end
    #arr.max #O(n) because .max is iterative 
    subsets.max #O(n^2) # line 37 is run n^2 times
end

def largest_contiguous_subsum(arr) #O(n) time complexity, O(1) memory complexity
    largest_sum = arr.first #O(1)
    current_sum = 0 #O(1)
    
    (1...arr.length).each do |i| #O(n)
        current_sum += arr[i] #O(1)

        largest_sum = current_sum if current_sum > largest_sum  #O(1)
        
        current_sum = 0 if current_sum < 0   #O(1)
    end
    
    largest_sum #O(1)
end



list0 = [5, 3, -7]
puts largest_contiguous_subsum(list0) # => 8

# # possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7

list1 = [2, 3, -6, 7, -6, 7]
puts largest_contiguous_subsum(list1) # => 8 (from [7, -6, 7])

list2 = [-5, -1, -3]
puts largest_contiguous_subsum(list2) # => -1 (from [-1])