# def anagram?(str1, str2) # O(3n! + n) => O(n!)

#     letters = str1.split("") #O(n)
   
#     anagrams = letters.permutation(letters.length).to_a #O(n!)
    
#     anagrams.map! { |ele| ele.join("") } #O(n!) the amount of elements n!/(n! - str.length!) 120 elements

#     anagrams.include?(str2) #O(n!)
# end

def anagram?(str1, str2) #O(n * 2m)

    temp = str2.split("") #O(m)
    str1.each_char do |char| #O(n) =< O(n * 2m)
        if temp.include?(char) #O(m)
            temp.delete_at(temp.index(char)) #O(m)
        end
    end

    temp.empty? ? true : false #O(1)

end

def anagram?(str1, str2)
    

p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true


