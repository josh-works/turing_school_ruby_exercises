class Drops
  attr_accessor :count
  def initialize
    @count = 0
  end

  def drip
    @count += 1
  end
end
