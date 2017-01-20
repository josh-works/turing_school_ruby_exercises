class Pirate
  attr_accessor :name, :job, :booty, :rob_ship

  def initialize(name, job="Scallywag")
    @name = name
    @job = job
    @cursed = false
    @rob_ship = true
    @booty = 0
    @heinous_acts = 0
  end

  def cursed?
    @cursed
  end

  def commit_heinous_act
    @heinous_acts += 1
    @heinous_acts >= 3 ? @cursed = true : @cursed = false
  end

  def rob_ship
    @booty = 100
    @rob_ship 
  end

end
