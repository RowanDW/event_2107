require './item'
require './food_truck'

RSpec.describe FoodTruck do
  context "Initialize" do
    it 'exists' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      expect(food_truck).to be_a(FoodTruck)
    end

    it 'has a name' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      expect(food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'starts with no inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      expect(food_truck.inventory).to eq({})
    end
  end

  context "Methods" do
    it "the stock of an item is 0 when not in truck" do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq(0)
    end

    it "can stock items" do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      food_truck.stock(item1, 30)
      expect(food_truck.check_stock(item1)).to eq(30)
      expect(food_truck.inventory).to eq({item1 => 30})

      food_truck.stock(item1, 25)
      expect(food_truck.inventory).to eq({item1 => 55})
    end

    it "can determine if an item is sold by truck" do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      food_truck.stock(item1, 30)
      expect(food_truck.sell?(item1)).to eq(true)
      expect(food_truck.sell?(item2)).to eq(false)
    end

    it 'can determine potential_revenue' do
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      expect(food_truck1.potential_revenue).to eq(148.75)
      expect(food_truck2.potential_revenue).to eq(345.00)
      expect(food_truck3.potential_revenue).to eq(243.75)
    end

    it 'can list all item names' do
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      expect(food_truck1.list_item_names).to eq(['Apple Pie (Slice)','Peach Pie (Slice)'])
      expect(food_truck2.list_item_names).to eq(["Banana Nice Cream", "Peach-Raspberry Nice Cream"])
      expect(food_truck3.list_item_names).to eq(['Peach Pie (Slice)'])
    end
  end
end
