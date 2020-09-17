def reverser(str,&prc)
    prc.call(str.reverse)
end

def word_changer(str,&prc)
    sentence = str.split(" ")
    sentence.map! {|el| prc.call(el)}
    sentence.join(" ")
end

def greater_proc_value(num,prc,prc2)
    value1,value2 = prc.call(num), prc2.call(num)
    [value1,value2].inject do |accum,el|
        if accum > el
            accum
        else
            el
        end
    end
end

def and_selector(arr,prc,prc2)
    new_arr = []
    new_arr2 = []
    arr.select {|el| new_arr << el if prc.call(el)}
    arr.select {|el| new_arr2 << el if prc2.call(el)}
    new_arr & new_arr2
end


def alternating_mapper(arr,prc,prc2)
    arr.each_with_index.map do |el,i|
        if i.even?
            prc.call(el)
        else
            prc2.call(el)
        end
    end
end