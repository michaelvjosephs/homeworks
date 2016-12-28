class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def add(el)
    stack << el
  end

  def remove
    stack.pop
  end

  def show
    stack.dup
  end
end

# s = Stack.new
# s.add(10)
# p s
# s.add(20)
# p s
# s.remove
# p s
# s.remove


class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
  end

  def dequeue
    queue.shift
  end

  def show
    queue.dup
  end
end

# q = Queue.new
# q.enqueue(10)
# p q
# q.enqueue(20)
# p q
# q.dequeue
# p q
# q.dequeue

class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def assign(key, value)
    map.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    map << [key, value]
  end

  def lookup(key)
    map.each do |pair|
      return pair[1] if pair[0] == key
    end

    nil
  end

  def remove(key)
    map.reject! { |pair| pair[0] == key }
    nil
  end

  def show
    deep_dup(map)
  end

  def deep_dup(array)
    array.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end

# m = Map.new
# m.assign(8, 4)
# p m
# m.assign(9, 10)
# p m
# m.assign(9, 11)
# p m
# p m.lookup(9)
# p m.lookup(5)
# m.remove(9)
# p m
# m.remove(3)
# p m
