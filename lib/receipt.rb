class Receipt
  attr_accessor :itemized_receipt, :sales_tax_total, :receipt_total

  def initialize
    @itemized_receipt = []
    @sales_tax_total = 0   
    @receipt_total = 0
  end

  def get_receipt(basket)
    generate_receipt(basket)
    print_receipt
  end

  def generate_receipt(basket)
    basket.contents.each do |item| 
      total_item_surcharges = calculate_total_item_surcharges(item)
      total_item_cost = calculate_total_item_cost(item, total_item_surcharges)

      self.sales_tax_total = self.sales_tax_total + (total_item_surcharges).round(2)

      itemized_receipt << "#{item.quantity} #{item.name}: #{"%.2f" % total_item_cost}"
      self.receipt_total = self.receipt_total + total_item_cost
    end
  end
  
  def calculate_total_item_surcharges(item)
    total = ((((item.sales_tax + item.import_duty) * item.price)*20).ceil/20.0) * item.quantity
  end

  def calculate_total_item_cost(item, total_item_surcharges)
    total = (item.price * item.quantity + (total_item_surcharges)).round(2)
  end

  def print_receipt
    puts itemized_receipt, "Sales Taxes: #{"%.2f" % sales_tax_total.round(2)}", "Total: #{"%.2f" % receipt_total.round(2)}"
  end
end