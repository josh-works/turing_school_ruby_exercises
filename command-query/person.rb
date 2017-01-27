class Person
  attr_accessor :age

  def initialize
    @age = 0
  end

  def happy_birthday
    @age += 1
  end
end
