def hipsterfy(word)
    vowels = 'aeiou'
    reverseletters = word.split("").reverse

    reverseletters.each_with_index do |char, i|
        if vowels.include?(char)
            reverseletters.delete_at(i)
            break
        end
       
    end

    reverseletters.reverse.join("")
end

def vowel_counts(string)
    result = Hash.new(0) 
    string.each_char do |char| 
        result[char.downcase] += 1
    end
    result
end

def caesar_cipher(str, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    str.each_char.with_index do |char, i| 
        if alphabet.include?(char)
            letter_index = alphabet.index(char)
            str[i] = alphabet[(letter_index + n) % 26]
        end
    end

    str
end



# describe "caesar_cipher" do
#     it "should accept a message and a number (n) as an arg" do
#       expect { caesar_cipher("hello", 5) }.to_not raise_error
#     end

#     it "should return a new string where every letter of the message is shifted n positions in the alphabet" do
#       expect(caesar_cipher("apple", 1)).to eq("bqqmf")
#       expect(caesar_cipher("apple", 2)).to eq("crrng")
#       expect(caesar_cipher("hello", 5)).to eq("mjqqt")
#       expect(caesar_cipher("zebra", 4)).to eq("difve")
#       expect(caesar_cipher("whoa", 26)).to eq("whoa")
#       expect(caesar_cipher("whoa", 52)).to eq("whoa")
#     end

#     it "should not modify non-alphabetic characters" do
#       expect(caesar_cipher("123 _-!?@%", 3)).to eq("123 _-!?@%")
#       expect(caesar_cipher("hello world!", 1)).to eq("ifmmp xpsme!")
#       expect(caesar_cipher("welcome to week 3, day 1", 2)).to eq("ygneqog vq yggm 3, fca 1")
#     end
#   end
# end