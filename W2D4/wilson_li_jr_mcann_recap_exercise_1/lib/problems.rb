# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    pairs = []
    words.each_with_index do |word1, i1|
        words.each_with_index do |word2, i2|
            pairs << [word1,word2] if i1 < i2
        end
    end

    answer = []
    pairs.each do |pair|
        if unique_vowel_count(pair[0]+pair[1])
            answer << pair.join(" ")
        end
    end

    answer
end

def unique_vowel_count(word)
    count = 0
    temp = []
    word.each_char do |char| 
        if "aeiouAEIOU".include?(char) && !temp.include?(char)
            temp << char
            count += 1
        end
    end
    
    count == 5
end
# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false


def composite?(num)
    return false if num < 0
    (2...num).each { |n| return true if num % n == 0 }
    return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigrams.select {|bi| str.include?(bi)}
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)

        if prc == nil
            self.select {|k,v| k == v }
        else
            self.select { |k,v| prc.call(k, v) }
        end

    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]

    #fin array
    #iterate through each until length (0...self.length) o |i|

    #nest the loo   (i...self.length) do |i2|
    # fin << i1, i2
    def substrings(length = nil)
        fin = []
        (0...self.length).each do |i|
            (i...self.length).each do |x|
                fin << self[i..x]
            end
        end

        # if length == nil
        #     fin
        # else
        #     fin.select { |ele| ele.length == length }
        # end
        
    end

  
    
    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = ("a".."z").to_a.join("")
        cipher = alphabet.chars.rotate(num).join("")
        self.tr(alphabet,cipher) #tr only takes in strings as arguments, tr replaces by index
    end
end

 
    
# 6] pry(main)> "hello".tr('aeiou', '')
# => "hll"
# [47] pry(main)> 

# > "hll"
# [47] pry(main)> "hello".tr('^aeiou', '')
# => "eo"
# [48] pry(main)> 
# [48] pry(main)> "hello".tr('^aeiou', 'x')
# => "xexxo"
# [49] pry(main)> 


