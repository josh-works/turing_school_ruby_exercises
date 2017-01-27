require 'pry'

class Floor
  attr_accessor :dirty

  def initialize
    @dirty = true
  end

  def dirty?
    @dirty
  end
binding.pry
  def wash
    @dirty = false
  end
end
