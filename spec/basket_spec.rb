require './lib/basket'
require './lib/receipt'
require './lib/item'

describe Basket do
  let(:basket) {Basket.new}

  describe '.initialize' do
    it "sets the contents attribute to an empty array" do
      expect(basket.contents).to eq []
    end
  end

  describe '#add_to_basket' do
    it "should add an item to the basket contents" do
      item = Item.new(1, "Candy Bar", 1.20)
      basket.add_to_basket(item)
      expect(basket.contents).to include item
    end
  end
end