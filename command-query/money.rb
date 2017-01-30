class Money
  attr_accessor :amount

  def initialize(amount = 0)
    @amount = amount
  end

  def earn(amount)
    @amount += amount
  end

  def spend(amount)
    if @amount - amount >= 0
      @amount -= amount
    else
      "You can't spend what you don't have"
    end
  end
end
