require './lib/receipt'
require './lib/basket'
require './lib/item'

describe Receipt do
  let(:receipt) {Receipt.new}
  let(:item) {Item.new(1, 'imported bottle of perfume', 27.99)}

  describe '.initialize' do
    it "sets the attributes to the correct values" do
      expect(receipt.itemized_receipt).to eq []
      expect(receipt.sales_tax_total).to eq 0   
      expect(receipt.receipt_total).to eq 0
    end
  end

  describe '#generate_receipt' do
    it "sets itemized_receipt with the correct item information" do
      item_1 = Item.new(1, "cook book", 21.99)
      item_2 = Item.new(1, "hand soap", 3.99)
      basket = Basket.new
      basket.add_to_basket(item_1)
      basket.add_to_basket(item_2)

      receipt.generate_receipt(basket)

      expect(receipt.itemized_receipt.count).to eq 2
    end
  end

  describe '#calculate_total_item_surcharges' do
    it "calculate total surcharge of an item including taxes and import duty" do
      total = receipt.calculate_total_item_surcharges(item)

      expect(total).to eq 4.20
    end
  end

  describe '#calculate_total_item_cost' do
    it "returns the total cost of an item including taxes and import duty" do
      surcharges = receipt.calculate_total_item_surcharges(item)
      total = receipt.calculate_total_item_cost(item, surcharges)

      expect(total).to eq 32.19
    end
  end
end