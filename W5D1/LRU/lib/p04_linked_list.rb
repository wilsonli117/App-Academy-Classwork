class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable 

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
  end

  def include?(key)

    self.each do |ele|
      return true if ele.key == key
    end

    return false
    
  end

  def append(key, val)
    temp = Node.new(key, val)
    temp.next = @tail
    temp.prev = @tail.prev
    @tail.prev.next = temp
    @tail.prev = temp
  end

  def update(key, val)
    self.each do |ele|
      if ele.key == key
        ele.val = val
      end
    end

  end

  def remove(key)

  end

  def each
    arr = [@head.next]
        
    until arr.last.next == @tail
      arr << arr.last.next unless arr.last.next.nil?
    end

    arr.each do |ele| 
      yield(ele)
    end
    
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

# alpha = LinkedList.new

# a = Node.new(:a, "a")
# b = Node.new(:b, "b")
# alpha.head = a
# alpha.tail = b
# c = Node.new(:c, "c")
