class FoodTruck

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def sell?(item)
    @inventory.include?(item)
  end

  def potential_revenue
    @inventory.sum do |item, quan|
      item.price * quan
    end
  end

  def list_item_names
    @inventory.map do |item, quant|
      item.name
    end.sort
  end
  
end
