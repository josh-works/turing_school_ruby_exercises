require 'Pry'
require_relative 'child'

class Children
  attr_accessor :children

  def initialize
    @children = []
  end

  def eldest
    @children.max_by { |child| child.age }
  end

  def << (child)
    @children << child
  end
end
