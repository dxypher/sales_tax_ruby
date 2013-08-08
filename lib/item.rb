class Item
  attr_reader :name, :price, :quantity, :sales_tax, :import_duty

  def initialize(quantity, name, price)
    @name = name
    @price = price
    @quantity = quantity
    @sales_tax = sales_tax
    @import_duty = import_duty    
  end 

  def is_imported?
    name.match /imported/i
  end

  def is_exempt?
    name.match /pills|book|chocolate|chips/i
  end

  def sales_tax
    is_exempt? ? 0 : 0.10
  end
  
  def import_duty
    is_imported? ? 0.05 : 0
  end
end