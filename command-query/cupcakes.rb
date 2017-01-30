require 'pry'
require_relative 'cupcake'
class Cupcakes
  attr_accessor :cupcakes

  def initialize
    @cupcakes = []
  end

  def sweetest
    @cupcakes.max_by(&:sugar)

  end

  def << (cupcake)
    @cupcakes << cupcake
  end
end
