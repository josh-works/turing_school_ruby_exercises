class RollCall
  attr_accessor :names

  def initialize
    @names = []
  end

  def longest_name
    @names.max_by(&:length)
  end

  def <<(name)
    @names << name
  end

end
