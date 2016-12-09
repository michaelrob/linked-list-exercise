class List
  include Enumerable

  def initialize(options={})
    @options = options
    @node = nil
    @size = 0
  end

  # add object to list based on list type
  def add(object)

    node = Node.new(object)

    if @size == 0
      @node = node
    else
      current = @node
      while !current.next.nil?
        current = current.next
      end
      current.next = node
    end
    @size += 1

    return node
  end

  # enumerable mixin method
  def each
    return enum_for(:each) unless block_given?

    current = @node
    while current != nil
      yield current.object
      current = current.next
    end
  end

  # returns all elements in list
  def elements
    @options[:sorted] == 1 ? sort(entries) : entries
  end

  # returns true if the list is empty, false otherwise
  def empty?
    @size == 0 ? true : false
  end

  # returns length of list
  def length
    @size
  end

  # returns true if object is a member of the list, false otherwise
  def member?(object)
    any? { |o| o == object }
  end

  # returns and removes the first element of the list; or nil if the list is empty
  def pop
    return nil if @node.nil?

    popped = first
    @size -= 1
    @node = @node.next

    return popped
  end

private

  # returns sorted list, in the future we may want to add additional arguments
  # for more complicated sorting
  def sort(list)
    list.sort
  end

end
