class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    #we should use array indices to hash
    # want to convert self(Array) to an integer
    sum = self.map.with_index do |ele, i|
      puts ele
      puts ele.hash
      ele.hash * (i+1) 
      
    end
     
    sum.sum * 13.hash
    puts "in arrayhash"
  end

  
end

class String
  def hash
    sum = self.split("").map.with_index { |char, i| char.unpack("c*").sum * i} 
    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.flatten.map { |ele| ele.to_s }.hash #maybe sort so order of insertion doesn't matter
    puts "in hashhash"
  end
end
