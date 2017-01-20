class Human
  attr_accessor :name
  attr_accessor :encounter_counter
  attr_accessor :notices_ogre
  attr_accessor :knocked_out


  def initialize(name="Jane")
    @name = name
    @encounter_counter = 0
    @notices_ogre = false
    @knocked_out = false
  end

  def notices_ogre?
    @notices_ogre
  end

  def knocked_out?
    @knocked_out
  end


end
