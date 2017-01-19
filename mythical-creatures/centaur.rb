require 'pry'
class Centaur
attr_accessor :name, :breed

  def initialize(name, breed)
    @name = name
    @breed = breed
    @cranky = false
    @standing = true
    @laying = false
    @shots = 0
  end

  def shoot
    @shots += 1
    if @shots >= 3 || @laying == true
      @cranky = true
      return "NO!"
    end
    p "Twang!!!"
  end

  def run
    if @laying == false && @cranky == false
      @cranky = true
      p "Clop clop clop clop!!!"
    else
      p "NO!"
    end
  end

  def cranky?
    @cranky
  end

  def standing?
    @standing
  end

  def laying?
    @laying
  end

  def sleep
    if @standing == true
      return "NO!"
    end
    @cranky = false
    @shots = 0
  end

  def lay_down
    @standing = false
    @laying = true
  end

  def stand_up
    @standing = true
    @laying = false
  end

  def standing?
    @standing
  end


end
