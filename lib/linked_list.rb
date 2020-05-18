class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  private

  attr_accessor :head, :tail, :size

  def tail_node
    unless head.nil?
      current_node = head

      until (current_node.next_node).nil?
        current_node = current_node.next_node
      end

      self.tail = current_node
    end
  end

  def create_node(element)
    element = Node.new(element) unless element.instance_of?(Node)
    element
  end

  def valid(index)
    index = size - index.abs if index < 0
    index > size || index < 0 ? nil : index
  end

  def get_nodes_at(index)
    index = valid(index)

    unless head.nil? || index.nil?
      previous_node = nil
      current_node = head
      current_index = 0

      until current_index == index
        previous_node = current_node
        current_node = current_node.next_node
        current_index += 1
      end

      return previous_node, current_node
    end
  end

  public

  attr_reader :head, :tail, :size

  def append(element)
    element = create_node(element)

    if head.nil?
      self.head = element
    else
      tail_node.next_node = element
    end

    self.size += 1
    self
  end

  def prepend(element)
    element = create_node(element)
    element.next_node = head
    self.head  = element

    self.size += 1
    self
  end

  def at(index)
    index = valid(index)

    unless head.nil? || index.nil?
      current_index = 0
      current_node = head

      until current_index == index
        current_index += 1
        current_node = current_node.next_node
      end
      current_node
    else
      nil
    end
  end

  def pop
    unless head.nil?
      previous_node = nil
      current_node = head

      until (current_node.next_node).nil?
        previous_node = current_node
        current_node = current_node.next_node
      end

      unless previous_node.nil?
        previous_node.next_node = nil
        tail_node
      else
        self.head = nil
        self.tail = nil
      end

      self.size -= 1
      current_node
    end
  end

  def contains?(value)
    find(value) ? true : false
  end

  def find(value)
    unless head.nil?
      current_node = head
      current_index = 0

      until current_node.nil?
        return current_index if current_node.value == value
        current_node = current_node.next_node
        current_index += 1
      end
    end
  end

  def insert_at(value, index)
    value = create_node(value)

    previous_node, current_node = get_nodes_at(index)

    unless previous_node.nil? && current_node.nil?
      if previous_node.nil?
        value.next_node = head
        self.head = value
      else
        previous_node.next_node = value
        value.next_node = current_node
      end

      self.size += 1
    end
    self
  end

  def remove_at(index)
    previous_node, current_node = get_nodes_at(index)

    unless previous_node.nil? && current_node.nil?
      if previous_node.nil?
        self.head = head.next_node
      else
        previous_node.next_node = current_node.next_node
      end

      self.size -= 1
    end
    self
  end

  def reverse!
    unless head.nil?
      previous_node = nil
      current_node = head
      next_node = nil

      until (current_node).nil?
        next_node = current_node.next_node
        current_node.next_node = previous_node

        previous_node = current_node
        current_node = next_node
      end
      self.head = previous_node
    end
    self
  end

  def to_a
    output = []

    unless head.nil?
      current_node = head

      until (current_node).nil?
        output << current_node.value
        current_node = current_node.next_node
      end
    end
    output
  end

  def to_s
    output = ""

    unless head.nil?
      current_node = head

      until (current_node).nil?
        output << "( #{current_node.value} ) -> "
        current_node = current_node.next_node
      end
    else
      output << "( ) ->"
    end
    output
  end
end

class Node
  def initialize(value)
    @value = value
    @next_node = nil
  end

  public
  attr_reader :value
  attr_accessor :next_node
end
