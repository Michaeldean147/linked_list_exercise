class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @value = value
  end
end

# first = Node.new(37)
# first.next_node = Node.new(50)
# first.next_node.next_node = Node.new(99)
# first.next_node.next_node.next_node = Node.new(3)
#
# puts first.next_node.value

class LinkedList
  attr_accessor :tail
  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
  end

  def append(value)
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    @head = node
  end

  def to_s(current_node=@head)
    if current_node.next_node.nil?
      return current_node.value
    else
      return "#{current_node.value} > #{to_s(current_node.next_node)}"
    end
    # return current_node.value if current_node.next_node.nil?
    # return "#{current_node.value} > #{to_s(current_node.next_node)}"
  end

  def find(node,current_node=@head)
    if current_node.value == node
      p current_node
    elsif current_node.next_node.nil?
      p "Sorry, that value is not here"
    else
      current_node = current_node.next_node
      find(node,current_node)
    end
  end

  def length(len = 0,node = @head)
    if node.next_node.nil?
      len += 1
      p len
    else
      node = node.next_node
      len += 1
      length(len,node)
    end
  end

  def insert_after(looking_for,value, node = @head)
    if node.value == looking_for
      swap = node.next_node
      node.next_node = Node.new(value)
      node.next_node.next_node = swap
    elsif node.next_node.nil?
      p "Sorry, #{looking_for} is not included in this list"
    else
      node = node.next_node
      insert_after(looking_for,value,node)
    end
  end

  def find_before(value, current_node = @head)
    if @head.value == value
      nil
    elsif current_node.next_node.value == value
      return current_node
    else
      find_before(value,current_node.next_node)
    end
  end

  def delete(td)
    before_node = find_before(td)
     if before_node.nil?
        swap = @head.next_node
        @head.next_node = nil
        @head = swap
    else
      before_node.next_node = before_node.next_node.next_node
    end
    # if node.value == td
    #   # node = node.next_node
    #   node.next_node = node.next_node.next_node
    #   node = node.next_node
    # else
    #   node = node.next_node
    #   delete(td,node)
    # end

  end

  def reverse(node = @head, rev = [])
    if node
      rev.unshift(node)
      node = node.next_node
      reverse(node,rev)
    end

    rev.each_with_index do |node, i|
      node.next_node = rev[i+1]
    end

    @head = rev.first
  end
end

  numbers = LinkedList.new(37)
  numbers.append(50)
  numbers.append(99)
  numbers.append(102)
  puts numbers.to_s
  numbers.prepend(-8)
  puts numbers.to_s
  numbers.find(99)
  numbers.length
  numbers.insert_after(24,900)
  numbers.delete(37)
  numbers.reverse
  p numbers.to_s
