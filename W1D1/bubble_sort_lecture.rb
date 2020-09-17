def bubble_sort(arr)
    sorted = false #scope inside def 
    while !sorted #Josh used 'until sorted' 
        sorted = true
        (0...arr.length - 1).each do |i|
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                sorted = false #this is in it's own scope
            end
        end
    end

    arr
end

arr = [2, 8, 5, 2,6, 1]

p bubble_sort(arr)