class Wizard
  attr_accessor :name, :bearded

  def initialize(name, bearded: true)
    @name = name
    @bearded = bearded
    @rested = true
    @spells_count = 0
  end

  def bearded?
    @bearded
  end

  def incantation(phrase)
    return "sudo " + phrase
  end

  def rested?
    @rested
  end

  def cast
    @spells_count += 1
    @spells_count == 3 ? @rested = false : @rested = true
    return "MAGIC MISSILE!"
  end
end
