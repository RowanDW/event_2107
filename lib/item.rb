class Item

  attr_reader :name, :price
  def initialize(info)
    @name = info[:name]
    @price = price_to_float(info[:price])
  end

  def price_to_float(str)
    str[0] = ''
    str.to_f
  end
end
