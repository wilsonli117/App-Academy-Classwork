class Item
attr_accessor :title, :deadline, :description, :done

    def self.valid_date?(date_string)
        arr = date_string.split("-")
        return false if arr.length != 3 || arr[0].length !=4 || arr[1].length !=2 || arr[2].length !=2
        return false if !(1..12).include?(arr[1].to_i)
        return false if !(1..31).include?(arr[2].to_i)

        return true 
    end

    def initialize(title, deadline, description)
        @title = title 
        @deadline = deadline if Item.valid_date?(deadline)
        @description = description 
        @done = false
    end

    def toggle
        if @done  
            @done = false  
        else
            @done = true
        end
    end

end
