class Node

  attr_reader :object
  attr_accessor :next

  def initialize(object, next_node = nil)
    @object = object
    @next = next_node
  end

end
