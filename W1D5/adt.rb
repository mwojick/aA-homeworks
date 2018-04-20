class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def add(el)
    # adds an element to the stack
    @stack.push(el)
    el
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    @stack
  end
end


class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key,value)
    key_exists = false
    @map.each do |arr|
      if arr[0] == key
        key_exists = true
        arr[1] = value
      end
    end
    if !key_exists
      @map << [key,value]
    end
  end

  def lookup(key)
    key_exists = false
    @map.each do |arr|
      if arr[0] == key
        key_exists = true
        return arr[1]
      end
    end
    if !key_exists
      return nil
    end
  end

  def remove(key)
    @map.reject! {|arr| arr[0] == key}
    nil
  end

  def show
    @map
  end

end


if __FILE__ == $0

  stack = Stack.new
  queue = Queue.new
  map = Map.new

  map.assign(1,2)
  map.assign(2,3)
  map.assign(5,"hi")
  map.assign(5,:Q)
  map.remove(13)
 p map.lookup(2)
 p map.show
end
