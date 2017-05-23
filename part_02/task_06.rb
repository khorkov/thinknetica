# Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). # Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.

puts "Если хотите выйти, в название товара введите 'stop' "
puts "----------------------------------------------------"

product_cart_name = Hash.new
product_cart_sum = Hash.new
total_price = []

loop do
  
  print "Введите название товара: "
  product = gets.chomp
  break if product == "stop"

  print "Введите цену за единицу товара: "
  product_cost = gets.chomp.to_f

  print "Введите количество купленного товара: "
  total_count = gets.chomp.to_f

  product_cart_name.store(product, [product_cost,total_count])

end

sum = 0

product_cart_name.each  {|item, (x1, x2) |
  puts "#{item}: #{x1} руб. #{x2} шт. Итого: #{x1 * x2} руб."

total_price << x1*x2

}

print "Итоговая стоимость покупки: #{total_price.inject(:+)} руб."
