gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require_relative 'werewolf'
require_relative 'victim'

class WerewolfTest < Minitest::Test
  def test_it_has_a_name
    werewolf = Werewolf.new("David")
    assert_equal "David", werewolf.name
  end

  def test_it_has_a_location
    werewolf = Werewolf.new("David","London")
    assert_equal "London", werewolf.location
  end

  def test_it_is_by_default_in_human_form
    werewolf = Werewolf.new("David","London")
    assert werewolf.human?
  end

  def test_when_starting_as_a_human_changing_means_it_is_no_longer_human
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    refute werewolf.human?
  end

  def test_when_starting_as_a_human_changing_turns_it_into_a_werewolf
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    assert werewolf.wolf?
  end

  def test_when_starting_as_a_human_changing_a_second_time_it_becomes_human_again
    werewolf = Werewolf.new("David","London")
    assert werewolf.human?
    werewolf.change!
    werewolf.change!
    assert werewolf.human?
  end

  def test_when_starting_as_a_werewolf_changing_a_second_time_it_becomes_werewolf_again
    werewolf = Werewolf.new("David","London")
    werewolf.change!
    assert werewolf.wolf?
    werewolf.change!
    werewolf.change!
    assert werewolf.wolf?
  end

  def test_is_not_hungry_by_default
    werewolf = Werewolf.new("Josh", "Colorado")
    refute werewolf.hungry?
  end

  def test_becomes_hungry_after_changing_to_a_werewolf
    werewolf = Werewolf.new("Josh", "Colorado")
    werewolf.change!
    assert werewolf.hungry?
  end
  # I can skip this stuff by using require_relative 'victim' and using victim.rb
  # class Victim
  #   attr_accessor :status
  #
  #   def initialize
  #     @status = :alive
  #   end
  # end

  def test_consumes_a_victim
    werewolf = Werewolf.new("Josh")
    victim = Victim.new
    assert_equal :alive, victim.status
    assert_equal 0, werewolf.victims
    werewolf.change!
    werewolf.feed(victim)
    assert_equal 1, werewolf.victims
    assert_equal :dead, victim.status

  end

  def test_cannot_consume_victim_if_in_human_form
    werewolf = Werewolf.new("Josh")
    victim = Victim.new
    assert werewolf.human?
    refute werewolf.feed(victim)
  end

  def test_a_werewolf_who_has_consumed_a_victim_is_no_longer_hungry
    werewolf = Werewolf.new("Josh")
    victim = Victim.new
    werewolf.change!
    werewolf.feed(victim)
    refute werewolf.hungry?
  end

  def test_a_werewolf_who_has_consumed_a_victim_makes_the_victim_dead
    werewolf = Werewolf.new("Josh")
    victim = Victim.new
    assert_equal :alive, victim.status
    werewolf.change!
    werewolf.feed(victim)
    assert_equal :dead, victim.status
  end

end
