require 'pry'

class List
  include Enumerable

  def initialize(options={})
    @options = options
    @node = nil
    @size = 0
  end

  # add object to list based on list type
  def add(object)
    @size == 0 ? next_node = nil : next_node = @node
    @size += 1

    @node = Node.new(object, next_node)
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
    @options[:sorted] == 1 ? sort(entries) : entries.reverse
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

    @node = @node.next
  end

private

  # returns sorted list, in the future we may want to add additional arguments
  # for more complicated sorting
  def sort(list)
    list.sort
  end

end
