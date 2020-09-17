def palindrome?(str)
    # str = str.split("").join("*")
    left,right = 0, str.length - 1
    while left < right
        return false if str[left] != str[right]
        left += 1
        right -= 1
    end
    true
end

def substrings(str)
    answer = []
    str.each_char.with_index do |substring, i|
        answer << substring
        str[i + 1..-1].each_char do |char| 
            substring += char
            answer << substring
        end
    end
    answer
    arr = []
    rec(arr,str,"")

    return arr
end

def palindrome_substrings(str)
    substrings(str).select {|el| palindrome?(el) && el.length > 1}
end