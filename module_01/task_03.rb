# Прямоугольный треугольник

puts "Введите сторону a: "
a = gets.chomp.to_f

puts "Введите сторону b: "
b = gets.chomp.to_f

puts "Введите сторону c: "
c = gets.chomp.to_f

if a == b && b == c
  puts "Треугольник равносторонний"
  else
    if a > b && b > c
      g =  a
      s =  b
      s2 = c
    elsif b > a && b > c
      g =  b
      s =  a
      s2 = c
    elsif c > a && c > b
      g =  c
      s =  b
      s2 = a
    end

    if s == s2
      isosceles_triangle = true
      else
        isosceles_triangle = false
    end

  if g ** 2 == s ** 2 + s2 ** 2
    formula = "прямоугольный!"
    else
      formula = "не прямоугольный!"
  end

  puts "Треугольник #{'равнобедренный и' if isosceles_triangle} #{formula}"

end
