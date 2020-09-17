def element_count(arr)
    answer = Hash.new(0)
    arr.each {|ele| answer[ele] += 1 }
    return answer
end

def char_replace!(str, hash)

    str.each_char.with_index do |char, i|
        if hash.has_key?(char)
            str[i] = hash[char]
        end
    end

    str

end

def product_inject(arr)
    arr.inject {|accum, ele| accum * ele}
end

