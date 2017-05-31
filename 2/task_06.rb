# Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). # Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.

puts "Если хотите выйти, в название товара введите 'stop' "
puts "----------------------------------------------------"

goods = {}
total_price = []

loop do
  
  print "Введите название товара: "
  product = gets.chomp
  break if product == "stop"

  print "Введите цену за единицу товара: "
  product_price = gets.chomp.to_f

  print "Введите количество купленного товара: "
  product_quantity = gets.chomp.to_f

  goods.store(product, [product_price, product_quantity])

end

goods.each do |item, (x1, x2)|
  puts "#{item}: #{x1} руб. #{x2} шт. Итого: #{x1 * x2} руб."

total_price << x1 * x2

end

print "Итоговая стоимость покупки: #{total_price.inject(:+)} руб."
