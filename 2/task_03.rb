# Заполнить массив числами Фибоначчи до 100

fibonacci = [1, 1]

while (x = fibonacci[-1] + fibonacci[-2]) < 100
  fibonacci << x
end

p fibonacci
