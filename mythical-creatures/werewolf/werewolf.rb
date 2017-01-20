require_relative 'victim'

class Werewolf
  attr_accessor :name, :location, :form, :human, :werewolf
  attr_reader :victims

  def initialize(name, location="earth", form="human")
    @name = name
    @location = location
    @form = form
    @human = true
    @werewolf = false
    @hungry = false
    @victims = 0
  end

  def human?
    @human
  end

  def wolf?
    @werewolf
  end

  def hungry?
    @hungry
  end

  def change!
    @human = !@human
    @werewolf = !@werewolf
    @hungry = true
  end

  def feed(victim)
    if @werewolf == false
      p "Hey dude. Why are you nibbling on me?"
      return false
    end
    victim.status = :dead
    @victims += 1
    @hungry = false
    return "'AooOOoo' *chomp* 'AAUGHHH' *snarl* AAAH!!!"
  end





end
