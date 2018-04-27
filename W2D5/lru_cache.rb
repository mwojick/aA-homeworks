class LRUCache

  attr_accessor :size, :cache

  def initialize(size = 4)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    location_in_cache = where_in_cache(el)
    # if cache is not full
    if count < size
      @cache << el
    # if el is in the cache and cache is full
    elsif !location_in_cache.nil?
      @cache = @cache[0...location_in_cache] + @cache[location_in_cache + 1..-1] + [el]
    # if el is not in the cache and cache is full
    else
      @cache = @cache[1..-1] + [el]
    end
    nil
  end

  def show
    @cache.dup
  end

  private
  # helper methods go here!
  def where_in_cache(el)
    @cache.each_with_index do |item,i|
      if item == el
        return i
      end
    end
    nil
  end

end

if __FILE__ == $0

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

p johnny_cache.show

end