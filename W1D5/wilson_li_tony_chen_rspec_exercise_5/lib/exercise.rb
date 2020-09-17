require "byebug"
#check for length possibly
# def zip(*arrays)
#     answer = []
#     i = 0 
#     # arrays.
#     while i < arrays[0].length 
#         temp = []
#         # debugger
#         j = 0
#         while j < arrays.length
#              temp << arrays[j][i]asfasdf
#              j += 1
#         end
#         answer << temp
#         i += 1
#     end

#     answer
# end

# def zip(*arrays)
        #answer = []
#     length = arrays[0].length
#     (0...length).map do |i| 
#         arrays.map { |array| array[i] }
#     end
# end

def zip(*arrays)
    answer = []
    length = arrays.first.length
    
    (0...length).each do |i| 
    temp = []
    arrays.each do |subarr|  # [array[0][0] , array[1][0] ,array[2][0] ]  # array[1,0] array[1,1] array[1, 2]  array[2,0] [2,1] [2,2]
        temp << subarr[i]       
    end
    answer << temp
    end

    answer
end

                          
# arr1 = ["a", "b", "c"]
# arr2 = [1,2,3]
# arr3 = ["w","x","y"]
# p zip(arr1, arr2, arr3)

def prizz_proc(arr, proc1, proc2)
    arr.select {|ele| proc1.call(ele) && !proc2.call(ele) || !proc1.call(ele) && proc2.call(ele)}
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max
    
     
        (0...length).map do |i|
            arrays.map { |array| array[i] }
    end
    
end

def maximum(array, &blk)
    return nil if array.empty?
    # debugger
    var = array[0]
    array.each do |ele|
        if blk.call(var) <= blk.call(ele)
            var = ele 
        end
    end
    var
end

def my_group_by(arr, &blk)
    answer = Hash.new { |h, k | h[k] = []}

    arr.each do |ele| 
        key =  blk.call(ele)
            answer[key] << ele
    end

    answer
end

def max_tie_breaker(array, tie_breaker, &prc)
    return nil if array.empty?  
    max = array.first 
    array.each do |el| 
        result_el = prc.call(el)
        result_max = prc.call(max)
        if result_el > result_max
            max = el
        elsif result_el == result_max && tie_breaker.call(el) > tie_breaker.call(max)
             max = el 
        end
    end
    max
end 

# def max_tie_breaker(array, tie_breaker, &prc)
#     return nil if array.empty?
#     max = array.first
#     array.each do |el|
#         result_el = prc.call(el)
#         result_max = prc.call(max)
#         if result_el > result_max
#             max = el
#         elsif result_el == result_max && tie_breaker.call(el) > tie_breaker.call(max)
#             max = el
#         end
#     end
#     max
# end



def silly_syllables(str)
    words = str.split
    answer = []

   
    words.each do |word|
        if vowel_count(word) > 1
            answer << word[first_vowel_i(word)..last_vowel_i(word)]
        else 
            answer << word
        end
    end

    answer.join(" ")

end

  

def first_vowel_i(str)
    vowels = "aeiou"
    
    str.each_char.with_index do |char, i|
            if vowels.include?(char)
                return i
        end
     end
 end

def last_vowel_i(word)
    vowels = "aeiou"

    (0..word.length - 1).reverse_each do |i|   #
       if vowels.include?(word[i]) 
            return i
       end
       i -= 1
    end
end

def vowel_count(str)
    vowels = "aeiou"
    count = 0
    str.each_char { |char| count += 1 if vowels.include?(char)}
    return count
end

# def change_word(word)
#     indices = vowel_indices(word)
#     word[indices.first..indices.last]
# end

# def vowel_indices(word)
#     vowels = 'aeiou'
#     indices = []
#     word.each_char.with_index do |char, i|
#         indices << i if vowels.include?(char)
#     end
#     indices
# end

# def silly_syllables(sentence)
#     words = sentence.split(' ')
#     new_words = words.map do |word|
#         num_vowels = vowel_indices(word).length
#         if num_vowels < 2
#             word
#         else
#             change_word(word)
#         end
#     end
#     new_words.join(' ')
# end

# silly_syllables
#   should accept a sentence as an argument (FAILED - 22)
#   should return a new sentence where all letters before the first vowel and after the last vowel are removed (FAILED - 23)
#   should not remove letters for words that contain less than two vowels (FAILED - 24)

# zip
#   should accept any number of arrays of the same length as arguments (FAILED - 1)
#   should return a 2D array where each subarray contains the elements at the same index from each argument (FAILED - 2)

# prizz_proc
#   should accept an array and two procs as arguments (FAILED - 3)
#   should return a new array containing the elements that return true for exactly one of the procs (FAILED - 4)
#   should return elements in the same order they appear in the input array (FAILED - 5)

# zany_zip
#   should accept any number of arrays as arguments (FAILED - 6)
#   should return a 2D array where each subarray contains the elements at the same index from each argument (FAILED - 7)
#   should use nil to substitute elements for the array that are too short (FAILED - 8)

# maximum
#   should accept an array and a block as args (FAILED - 9)
#   should return the element that has the largest result when passed into the block (FAILED - 10)
#   when there is a tie
#     should return the element that appears later in the array (FAILED - 11)
#   when the array is empty
#     should return nil (FAILED - 12)

# my_group_by
#   should accept an array and a block as args (FAILED - 13)
#   should not use the built-in Array#group_by (FAILED - 14)
#   should return a hash where keys are the results when the elements are given to the block (FAILED - 15)
#   should return a hash where each value is an array containing the elements that result in the corresponding key when given to the block (FAILED - 16)

# max_tie_breaker
#   should accept an array, a proc, and a block as args (FAILED - 17)
#   should return the element that has the largest result when passed into the block (FAILED - 18)
#   when there is a tie
#     should use the proc to break the tie (FAILED - 19)
#     when there is still a tie after using the proc
#       should return the element that comes first in the array (FAILED - 20)
#   when the array is empty
#     should return nil (FAILED - 21)

# silly_syllables
#   should accept a sentence as an argument (FAILED - 22)
#   should return a new sentence where all letters before the first vowel and after the last vowel are removed (FAILED - 23)
#   should not remove letters for words that contain less than two vowels (FAILED - 24)