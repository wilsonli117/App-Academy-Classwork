class Array

    def my_uniq
        uniq_array = []

        array.each do |el|
        uniq_array << el unless uniq_array.include?(el)
        end

        uniq_array
    end

    def two_sum
        pairs = []

        self.each_with_index do |ele, i|
            if self.include?(0-ele)
                pairs << [i, self.index(0-ele)].sort if i != self.index(0-ele)
            end
        end

        pairs.uniq
    end

    def my_transpose
        self.map.with_index do |row, i|
            row.map.with_index { |ele, k| self[k][i] }
        end
    end

    def stock_picker
        max_diff = 0
        days = nil
        (0...self.length - 1).each do |day|
            if self[day] - self[day + 1] < max_diff
                days = day, day + 1
                max_diff = self[day] - self[day + 1] 
            end
        end
        days
    end

end

 