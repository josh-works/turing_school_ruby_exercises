gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/homework'

class BlockTest < Minitest::Homework
  be_gentle!

  def test_default_return_value
    assert_equal nil, Proc.new {}.call
    assert_equal nil, Proc.new { |arg| }.call(1)
    assert_equal 1, Proc.new { 1 }.call
    assert_equal :abc, Proc.new { |arg| :abc }.call(1)
    assert_equal 1, Proc.new { |arg| arg }.call(1)
  end

  def test_environment_visibility
    val = 1
    assert_equal 1, Proc.new { val }.call
    assert_equal 2, Proc.new { |val| val }.call(2)
  end

  def test_modifying_environment
    val = 1
    Proc.new { val = 2 }.call
    assert_equal 2, val
  end

  def test_passing_arguments
    assert_equal 2, Proc.new { |n| n + 1 }.call(1)
    assert_equal 13, Proc.new { |n1, n2| n1 + n2 }.call(10, 3)
    assert_equal 13, Proc.new { |n1, n2| n1 + n2 }.call([10, 3])
  end

  def test_passing_blocks_as_arguments_1
    loud = Proc.new { |string| string.upcase }
    assert_equal ["A", "B", "C"], ["a", "b", "c"].map { |string| string.upcase }
    assert_equal ["A", "B", "C"], ["a", "b", "c"].map(&loud)
  end

  def test_passing_and_receiving_blocks_as_arguments
    invoker1 = Proc.new { |proc| proc.call }
    invoker2 = Proc.new { |&proc| proc.call }
    return_a = Proc.new { 'a' }
    assert_equal "a", invoker1.call(return_a)
    assert_equal "a", invoker2.call(&return_a)
  end
end
