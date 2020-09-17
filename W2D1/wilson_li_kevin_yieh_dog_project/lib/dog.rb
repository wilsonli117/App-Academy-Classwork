class Dog
# attr_accessor :age
# attr_accessor :color
# attr_accessor :name
# attr_reader :age
# attr_writer
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(new_age)
        @age = new_age
    end
    
    def bark
        age > 3 ? bark.upcase : bark.downcase #doesn't need @
    end


    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(str)
        @favorite_foods.each {|food| return true if food.downcase == str.downcase}
        return false
    end

end
