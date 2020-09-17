# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2) #revisit
    # m_num1 = []
    # m_num2 = []
   
    # (num_1 <=> num_2) == -1 ? n = num_2 : n = num_1
   
    # (1..n).each do |i|
    #     m_num1 << num_1 * i
    #     m_num2 << num_2 * i
    # end

    # answer = m_num1.sort & m_num2.sort 
    # answer.first

    (1..(num_1*num_2)).each { |i| return i if i % num_1 == 0 && i % num_2 == 0 }

end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str) #revisit

    substr = []
    (0...str.length).each do |i|
        (i...str.length).each do |j|
           substr << str[i..j]
        end
    end
    bigrams = substr.select { |sub| sub.length == 2}
    bi_count = Hash.new(0)
    bigrams.each {|ele| bi_count[ele] += 1}
    bi_count.sort_by { |k,v| v }[-1][0]
            # expected: "th"
            # got: ["i", "it"]
end

# puts most_frequent_bigram("thethrillofit") #=> "th"

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        fin = {}
        self.each {|k, v| fin[v] = k}
        fin
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each {|int| count += 1 if self.include?(num - int)}
        count/2
    end
    
    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        if prc == nil
            self.sort!
        else
            self.sort!{|a,b| prc.call(a,b)} #revisit
        end
    end
end
