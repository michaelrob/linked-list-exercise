class List
  include Enumerable

  def initialize(options={})
    @options = options
    @head = nil
  end

  # add object to list based on list type
  def add(object)
    node = Node.new(object)

    return node
  end

  # enumerable mixin method
  def each
  end

  # returns all elements in list
  def elements
  end

  # returns true if the list is empty, false otherwise
  def empty?
    true
  end

  # returns length of list
  def length
    0
  end

  # returns true if object is a member of the list, false otherwise
  def member?(object)
  end

  # returns and removes the first element of the list; or nil if the list is empty
  def pop
    nil
  end

end
