require 'pry'
class Wallet
  attr_accessor :cents, :contents

  CHANGE = {
    penny: 1,
    nickel: 5,
    dime: 10,
    quarter: 25,
    dollar: 100
  }

  def initialize
    @cents = 0
    @wallet = []
    @contents = []
  end

  def << (coin_type)
      @cents += CHANGE[coin_type]
      @contents << coin_type

  end

  def take (*coins)
    coins.each do |change|
      if index = @contents.index(change)
        @cents -= CHANGE[change]
        @contents.delete_at(index)
      else
        puts "yo' poor, you cannot spend #{change}"
      end
    end
  end

  def test (*change)
    change.each do |arg|
      @cents += CHANGE[arg]
    end
  end
  binding.pry
end
