# Iterator Interface
class Iterator
  def has_next?
    raise NotImplementedError
  end

  def next
    raise NotImplementedError
  end
end

# Concrete Iterator for an Array
class ArrayIterator < Iterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def next
    value = @array[@index]
    @index += 1
    value
  end
end

# Aggregate Collection
class Collection
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def create_iterator
    ArrayIterator.new(@items)
  end
end

# Application
collection = Collection.new([1, 2, 3, 4, 5])
iterator = collection.create_iterator

while iterator.has_next?
  puts "Next item: #{iterator.next}"
end
