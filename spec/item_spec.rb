require './lib/item'

describe Item do
  describe '.initialize' do
    it "should set the item attributes to the correct values" do
      item = Item.new(1, "hand soap", 3.95)
      expect(item.name).to eq 'hand soap'
      expect(item.price).to eq 3.95
      expect(item.quantity).to eq 1
      expect(item.sales_tax).to eq 0.10
      expect(item.import_duty).to eq  0
    end

    it "should set the sales_tax to 0 for exempt items" do
      item = Item.new(1, "cook Book", 23.94)
      expect(item.sales_tax).to eq 0
    end

    it "should set the import_duty to 0.05" do
      item = Item.new(2, 'Imported leather jacket', 400)
      expect(item.import_duty).to eq 0.05
    end
  end
end