def my_reject(arr, &blk)
    arr.select { |ele| !blk.call(ele) }
end

def my_one?(arr, &blk)
    count = 0
    arr.each { |ele| count += 1 if blk.call(ele)}
    count == 1 ? true : false
end

def hash_select(hash, &blk)
    answer = {}
    hash.each do |k, v|
        if blk.call(k, v)
            answer[k] = v
        end
    end
    return answer
end

def xor_select(arr, proc1, proc2)
    
    answer = []
    reject = []

    arr.each do |ele|
        if proc1.call(ele) && proc2.call(ele) 
            reject << ele
        elsif !proc1.call(ele) && !proc2.call(ele)
            reject << ele
        else 
            answer << ele
        end
    end

    answer

#   array.select do |el|
#     (prc_1.call(el) || prc_2.call(el)) && !(prc_1.call(el) && prc_2.call(el))
#   end
      
end

def proc_count(v, arr)

    arr.select { |proc| proc.call(v) }.count
    
end



      