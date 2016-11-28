class Node

  attr_reader :object
  attr_accessor :next

  def initialize(object)
    @object = object
    @next = nil
  end

end