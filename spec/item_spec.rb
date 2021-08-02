require './item'

RSpec.describe Item do
  it 'exists' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    expect(item1).to be_a(Item)
  end

  it 'has a name' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    expect(item1.name).to eq('Peach Pie (Slice)')
  end

  it 'has a float price' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    expect(item1.price).to eq(3.75)
  end

  it 'can convert a string price to a float' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    expect(item1.price_to_float("$3.75")).to eq(3.75)
  end
end
