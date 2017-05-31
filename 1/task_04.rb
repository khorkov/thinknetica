# Квадратное уравнение

puts "Введите коэффицент a: "
a = gets.chomp.to_f

puts "Введите коэффицент b: "
b = gets.chomp.to_f

puts "Введите коэффицент c: "
c = gets.chomp.to_f

d = (b ** 2) - (4 * a * c)
k = 2 * a

puts "Дискриминант #{d}"

if d > 0
  sqrt = Math.sqrt(d)

  r = (-b + sqrt) / k
  r2 = (-b - sqrt) /k

  puts "Корень 1: #{r}"
  puts "Корень 2: #{r2}"

  elsif
    r = -b / k

    puts "Корень: #{r}"
  else
    puts "Уравнение не имеет корней!"
end
