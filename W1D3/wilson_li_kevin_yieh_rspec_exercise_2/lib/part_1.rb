def partition(arr,num)
    # new_arr = Array.new(2) {Array.new()}
    # arr.each do |ele| 
    #     new_arr[0] << ele if ele < num
    #     new_arr[1] << ele if ele >= num
    # end
    # new_arr
    [arr.select {|el| el < num}, arr.select {|el| el >= num}]
end

def merge(hash1, hash2)
    hash3 = {}
    hash1.each { |k,v| hash3[k] = v }
    hash2.each { |k,v| hash3[k] = v }
    hash3
end

def censor(sent, arr)
    vowels = "aeiouAEIOU"
    words = sent.split(" ")
    new_words = []
    words.each do |word|
        if arr.include? word.downcase
            word.each_char.with_index {|char,i| word[i] = "*" if vowels.include? char}
        end
        new_words << word
    end
    new_words.join(" ")
end

include Math

def power_of_two?(num)
    Math::log(num,2) % 1 == 0
end
