class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)#O(1)
    resize! if self.count == num_buckets #O(n)
    if !self.include?(key)
      self[key] << key
      self.count += 1
    end
  end

  def include?(key) #O(1)
    self[key].each { |ele| return true if ele == key }
    return false
     
  end

  def remove(key) #O(1)
    if self.include?(key)
      self[key].delete(key)
      self.count -= 1
    end
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.dup
    @store = Array.new(self.count * 2) { Array.new }
    temp.flatten.each { |item| self[item % num_buckets] << item }
  end
end
