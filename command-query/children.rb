require 'pry'
require_relative 'child'
class Children
  attr_accessor :children

  def initialize
    @children = []
  end

  def eldest
    children.max_by { |child| child.age }
  end

  def << (child)
    children << child
  end
end

children = Children.new
children << Child.new("Robert", 2)
children << Child.new("Fran", 8)
children << Child.new("Hilbert", 4)
