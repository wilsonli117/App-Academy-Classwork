def average(num1, num2)
    sum = num1 + num2
    sum / 2.0
end

def average_array(array)
    sum = array.sum
    sum / (array.length * 1.0)
end

def repeat(string, number)
    string * number
end

def yell(string)
    string.upcase + "!"
end

def alternating_case(str)
    words = str.split(" ")

    words.each_with_index do |word, i|
        if i % 2 == 0
            words[i] = words[i].upcase
        else 
            words[i] = words[i].downcase
        end
    end

    words.join(" ") 

end

