class Stack
  def initialize
    @store = []
  end

  def push(element)
    @store.push(element)
  end

  def pop
    return nil if @store.empty?
    @store.pop
  end

  def peek
    return nil if @store.empty?
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
  def to_s
    @store.join(", ")
  end
end
#object creation
stack = Stack.new
stack.push(12)
stack.push(23)
stack.push(3)
stack.push(10)
stack.push(98)
stack.push(63)
#printing the values
puts stack.to_s
puts "deleted element: #{stack.pop}"
puts "Peek element: #{stack.peek}"
puts stack.to_s