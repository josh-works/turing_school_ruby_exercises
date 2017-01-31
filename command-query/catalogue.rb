require_relative 'product'
class Catalogue
  attr_reader :products
  def initialize
    @products = []
  end

  def << (product)
    @products << product
  end

  def cheapest
    @products.min_by(&:price).item unless @products.empty?
  end
end
