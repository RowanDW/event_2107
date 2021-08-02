class Event

  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.sell?(item)
    end
  end

  def sorted_item_list
    @food_trucks.flat_map do |truck|
      truck.list_item_names
    end.sort.uniq
  end

  def total_inventory
    inventory = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if inventory[item].nil?
          inventory[item] = {:quantity => quantity, :food_trucks => [truck]}
        else
          inventory[item][:quantity] += quantity
          inventory[item][:food_trucks] << truck
        end
      end
    end
    inventory
  end

  def overstocked_items
    overstocked = []
    total_inventory.each do |item, info|
      overstocked << item if info[:quantity] > 50 && info[:food_trucks].length > 1
    end
    overstocked
  end
end
