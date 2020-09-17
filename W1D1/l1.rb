# p "hi".object_id
# p "hi".object_id
# p "hi".object_id
# p :hi.object_id
# p :hi.object_id
# p :hi.object_id

# bootcamp = {color:"red", name:"app academy"}
# p bootcamp[:color]

# def modify_string(str, options={"upper"=>false, "repeats"=>1})
#   str.upcase! if options["upper"]
#   p str * options["repeats"]
# end

# modify_string("hello")
# modify_string("hello", "upper"=>true, "repeats"=>3)

# def greet(first, last)
#   p "Hi #{first}, your last name is #{last}"
# end

# name = ["Wilson", "Li"]
# greet(*name)

# arr = [88, 99, 2, 4, 6, 8, 12]

# result = arr.inject(0) do |acc, ele|
#     if ele.even?
#         acc + ele
#     else 
#        acc
#     end
# end
        
# p result

# result = ["abc", "ab", "asdjnasdjn"].inject do |acc, el|
#     if acc.length < el.length 
#         el
#     else
#         acc
#     end
# end

# p result 

arr = [1.2]
arr_2 = arr.dup

p arr
p arr_2

# pass by reference > ruby, js
# pass by value > c