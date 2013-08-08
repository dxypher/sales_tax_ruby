class Basket
  attr_reader :contents

  def initialize
    @contents = []
    @receipt = Receipt.new
  end

  def process(file_name)
    lines = File.readlines("input_files/#{file_name}")
    lines.each do |line|
      line_array = line.split(" ")
      item_quantity = line_array.shift.to_i
      item_price = line_array.pop.to_f
      line_array.pop #removes 'at'
      item_name = line_array.join(' ')
      item = Item.new(item_quantity, item_name, item_price)
      add_to_basket(item)
    end
    @receipt.get_receipt(self)
  end

  def add_to_basket(item)
    contents << item
  end
end