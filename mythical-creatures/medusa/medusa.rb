require_relative 'person'

class Medusa
  attr_accessor :name, :statues

  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    if @statues.count >= 3
      @statues << victim && victim.stoned = true
      released_victim = @statues.shift
      released_victim.stoned = false
    else
      @statues << victim && victim.stoned = true
    end
  end
end
