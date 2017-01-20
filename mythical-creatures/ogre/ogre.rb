require_relative 'human'


class Ogre
  attr_accessor :name
  attr_accessor :encounter_counter
  attr_accessor :home
  attr_accessor :swings

  def initialize(name, home="Swamp")
    @name = name
    @home = home
    @encounter_counter = 0
    @swings = 0
  end

  def encounter(human)
    human.encounter_counter += 1
    self.encounter_counter += 1
    if human.encounter_counter % 3 == 0
      human.notices_ogre = true
      swing_at(human)
    else
      human.notices_ogre = false
    end
  end

  def swing_at(human)
    @swings += 1
    @swings >= 2 ? human.knocked_out = true : human.knocked_out = false
  end

  def apologize(human)
    human.knocked_out = false
  end

end
