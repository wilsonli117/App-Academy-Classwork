require "byebug"
def no_dupes?(arr)
    arr.select {|ele| arr.count(ele) == 1}
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => [] 

def no_consecutive_repeats?(arr)
    (0...arr.length - 1). each { |i| return false if arr[i] == arr[i + 1] }
    return true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])               #true


def char_indices(str)
    fin = Hash.new{|h,k| h[k] = []}
    str.each_char.with_index {|char, i| fin[char] << i}
    fin
end


# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]} 
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7p ], "m"=>[8]}


def longest_streak(str)
    long_streak = 0
    long_char = ""
    i = 0
    while i < str.length
        char = str[i]
        temp_streak = 0
       
        while char == str[i]
            temp_streak += 1
            i += 1
        end
       
        if temp_streak >= long_streak
            long_streak = temp_streak
            long_char = char
        end

    end
    long_char * long_streak
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


require 'prime'

def bi_prime?(num)
    (2...num).each {|n| return true if num % n == 0 && n.prime? && (num/n).prime?}
    false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys) 
    cipher = []
    alpha = ("a".."z").to_a.join
    keys.each do |key|
        cipher << alpha.chars.rotate(key).join
    end
    

    answer = ""
     i= 0
    message.each_char do |char|
    #    current_cipher = cipher.first
    #    answer += char.tr(alpha, current_cipher)
    #    cipher.rotate!(1)
       
       
        current_cipher = cipher[i%keys.length]
        answer += char.tr(alpha, current_cipher)
        i += 1
    end

    answer

end
# "abc"
# [37] pry(main)> p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# ["bcdefghijklmnopqrstuvwxyza", "cdefghijklmnopqrstuvwxyzab", "defghijklmnopqrstuvwxyzabc"]
# ["bcdefghijklmnopqrstuvwxyza", "cdefghijklmnopqrstuvwxyzab", "defghijklmnopqrstuvwxyzabc"]
# => ["bcdefghijklmnopqrstuvwxyza", "cdefghijklmnopqrstuvwxyzab", "defghijklmnopqrstuvwxyzabc"]



# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo" "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"  "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowel_indices = [] 
    vowels = [] 

    str.each_char.with_index do |char, i|
        if "aeiou".include?(char)
            vowels << char
            vowel_indices << i
           
        end
    end
    
#  ["o", "u", "e"] -> ["u", "e", "o"]
#  <- [e o u]
   vowels.rotate!(-1) # we had to rotate negatively 
  
   (0...vowels.length).each do |i|
        str[vowel_indices[i]] = vowels[i]
   end
   

    str

end


# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String

    def select(&prc)
        return "" if prc == nil
        answer = ""
        self.each_char { |char| answer += char if prc.call(char) }
        answer
    end




# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

    def map!(&prc)
    
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
        self
        #new_str 
        # arr = self.split("")
        # new_arr = []
        # arr.each_with_index do |ele, i|
        #     new_arr << prc.call(ele,i)
        # end
        # new_arr
        # arr = self.split("")
        #  arr.map.with_index { |ele, i| prc.call(ele,i) }.join("")
    end


end

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
    return 0 if b == 0

    if b > 0 
        return a + (multiply(a, b - 1))
    else
        return -(a + (multiply(a, -b - 1)))
    end

end



# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2, 1] if length == 2
   
    lucas_sequence(length -1) + [lucas_sequence(length -1)[-1] + lucas_sequence(length - 1)[-2]] 
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(num)
    return [num] if num.prime?

    lpf = nil
    (2...num).reverse_each { |i| lpf = i if num % i == 0 && i.prime? }
    (prime_factorization(num/lpf) + [lpf]).sort
    

end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]