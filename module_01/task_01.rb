#Идеальный вес

puts "Как вас зовут?"
name= gets.chomp

puts "Какой у вас рост?"
height = gets.chomp

result = height.to_i - 110

if result < -1
  puts "Ваш вес уже оптимальный"
else
  puts "#{name} ваш идеальный вес составляет #{result} кг."
end
