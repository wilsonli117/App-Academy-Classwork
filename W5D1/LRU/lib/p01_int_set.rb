class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    is_valid?(num) ? @store[num] : false
  end

  private

  def is_valid?(num)
    (0...@store.length).include?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)
  end

  def include?(num)
    self[num].each { |ele| return true if ele == num }
    return false
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if self.count == num_buckets
    if !self.include?(num)
      self[num] << num
      self.count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      self.count -= 1
    end
  end

  def include?(num)
     self[num].each { |ele| return true if ele == num }
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
