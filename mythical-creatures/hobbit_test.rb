gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require_relative 'hobbit'

class HobbitTest < Minitest::Test
  def test_it_has_a_name
    hobbit = Hobbit.new("Bilbo")
    assert_equal "Bilbo", hobbit.name
  end

  def test_it_is_named_something_else
    hobbit = Hobbit.new("Peregrin")
    assert_equal "Peregrin", hobbit.name
  end

  def test_disposition_is_unadventurous
    hobbit = Hobbit.new("Samwise")
    assert_equal "homebody", hobbit.disposition
  end

  def test_can_have_a_different_disposition
    hobbit = Hobbit.new("Frodo", "adventurous")
    assert_equal "adventurous", hobbit.disposition
  end

  def test_grows_older_when_celebrating_birthdays
    hobbit = Hobbit.new('Meriadoc')
    assert_equal 0, hobbit.age
    5.times do
      hobbit.celebrate_birthday
    end
    assert_equal 5, hobbit.age
  end

  def test_is_considered_a_child_at_32
    hobbit = Hobbit.new('Gerontius')
    32.times do
      hobbit.celebrate_birthday
    end
    refute hobbit.adult?
  end

  def test_comes_of_age_at_33
    hobbit = Hobbit.new('Otho')
    33.times do
      hobbit.celebrate_birthday
    end
    assert hobbit.adult?

    # still adult, one year later
    hobbit.celebrate_birthday
    assert hobbit.adult?
  end

  def test_is_not_old_at_age_of_100
    hobbit = Hobbit.new("Josh")
    100.times do
      hobbit.celebrate_birthday
    end
    refute hobbit.old?
  end

  def test_is_old_at_age_of_101
    # create a hobbit
    hobbit = Hobbit.new("Josh")
    101.times do
      hobbit.celebrate_birthday
    end
    assert hobbit.old?
    # have hobbit age 101 years
    # check that hobbit.old? returns true
  end

  def test_hobbit_has_the_ring_if_its_name_is_frodo
    # create a hobbit named Frodo
    frodo = Hobbit.new("Frodo")
    # create a second hobbit named Sam
    sam = Hobbit.new("Sam")
    # check that .has_ring? for Frodo returns true
    assert frodo.has_ring?
    # check that .has_ring? for Sam returns false
    refute sam.has_ring?
  end

  def test_hobbits_are_short
    # create a hobbit
    hobbit = Hobbit.new("Josh")
    # check that .is_short? returns true
    assert hobbit.is_short?

  end

end
