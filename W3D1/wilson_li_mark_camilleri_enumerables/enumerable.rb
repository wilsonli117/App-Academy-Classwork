require "byebug"
class Array
    def my_each(&prc)
        i = 0
        while i < self.length 
            prc.call(self[i])
            i += 1
        end

        self
    end

    def my_select(&prc)
      results = []
      self.my_each {|ele| results << ele if prc.call(ele)}
      results
    end

    def my_reject(&prc)
      results = []
      self.my_each {|ele| results << ele if !prc.call(ele)}
      results
    end

    def my_any?(&prc)
      self.my_each { |ele| return true if prc.call(ele)}
      return false
    end

    def my_all?(&prc)
      self.my_each { |ele| return false if !prc.call(ele) }
      return true
    end

    def my_flatten
      result = []
      self.each do |ele|
        if ele.is_a?(Array)
          result += ele.my_flatten
        else
          result << ele
        end
      end
      result
    end

    def my_zip(*args)
      i = 0
      result = []
      while i < self.length
        temp_arr = []#can just add self[i] as first element
        temp_arr << self[i]
        args.each_with_index do |arr, i2|
          temp_arr << arr[i]
        end
        result << temp_arr
        i += 1
      end
      result
    end

    def my_rotate(n = 1)
      result = self.dup
      if n > 0
        i = 1
        while i <= n 
          first = result.shift
          result.push(first) 
          i += 1
        end
      else
        i = -1
        while i >= n
          last = result.pop
          result.unshift(last) 
          i -= 1
        end
      end
      result
    end

    def my_join(arg="")

    result = ""
    self.each { |ele| result += "#{ele}#{arg}" }
    result 

    end

    def my_reverse
      result = []
      i = self.length - 1
      while i >= 0
        result << self[i]
        i -= 1
      end
      result
    end
    
end

