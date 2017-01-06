class LRUCache
  attr_accessor :cache
  attr_reader :size

  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    cache.count
  end

  def add(el)
    if cache.include?(el)
      cache.delete(el)
    elsif count >= size
      cache.shift
    end

    cache << el
  end

  def show
    p cache
    nil
  end
end

# p johnny_cache = LRUCache.new(4)
#
# p johnny_cache.add("I walk the line")
# p johnny_cache.add(5)
#
# p johnny_cache.count # => returns 2
#
# p johnny_cache.add([1,2,3])
# p johnny_cache.add(5)
# p johnny_cache.add(-5)
# p johnny_cache.add({a: 1, b: 2, c: 3})
# p johnny_cache.add([1,2,3,4])
# p johnny_cache.add("I walk the line")
# p johnny_cache.add(:ring_of_fire)
# p johnny_cache.add("I walk the line")
# p johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
