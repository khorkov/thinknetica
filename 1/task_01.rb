#Идеальный вес

puts "Как вас зовут?"
name= gets.chomp

puts "Какой у вас рост?"
height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight < -1
  puts "Ваш вес уже оптимальный"
else
  puts "#{name} ваш идеальный вес составляет #{ideal_weight} кг."
end
