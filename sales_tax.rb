#add rspec tests
require './lib/item.rb'
require './lib/basket.rb'
require './lib/receipt.rb'

output = 1
Dir.foreach('./input_files') do |item|
  next if item == '.' or item == '..' or item == 'test.txt'
  puts "Output #{output}:"
  basket = Basket.new
  basket.process(item)
  output += 1
  puts "\n"
end