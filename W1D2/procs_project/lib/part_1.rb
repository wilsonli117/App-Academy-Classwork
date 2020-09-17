def my_map(arr,&prc)
    new_arr = []
    arr.each {|el| new_arr << prc.call(el)}
    new_arr
end

def my_select(arr,&prc)
    new_arr = []
    arr.each do |el|
        if prc.call(el)
            new_arr << el
        end
    end
    new_arr
end

def my_count(arr,&prc)
    count = 0 
    arr.each do |el|
        if prc.call(el)
            count += 1
        end
    end
    count
end

def my_any?(arr,&prc)
    arr.each do |el|
        if prc.call(el)
            return true
        end
    end
    return false
end

def my_all?(arr,&prc)
    arr.each {|el| return false if !prc.call(el)}
    return true
end

[1,2,3,-4,5]

def my_none?(arr,&prc)
    arr.each {|el| return false if prc.call(el)}
    return true
end