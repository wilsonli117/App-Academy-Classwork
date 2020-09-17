# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        self.empty? ? nil : (self.max - self.min)
    end

    def average
        self.empty? ? nil : self.sum/(self.length * 1.0)
    end

    def median
        return nil if self.empty?
        return self.sort[(self.length/2).to_i] if self.length.odd? 
        med = self.sort[(self.length/2)] + self.sort[(self.length/2) - 1]
        return med/2.0 
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

    def my_count(val)
        count = 0
        self.each {|ele| count += 1 if ele == val}
        count
    end

    def my_index(val)
        self.each_with_index {|ele, i| return i if ele == val}
        return nil
    end

    def my_uniq
        new_arr = []
        self.each {|ele| new_arr << ele if !new_arr.include?(ele)}
        new_arr
    end

    def my_transpose
        w = self.length 
        new_arr = Array.new(w) {Array.new(w)}
        (0...w).each do |row|
            (0...w).each do |column|
                new_arr[column][row] = self[row][column]
            end
        end
        new_arr 
    end

end