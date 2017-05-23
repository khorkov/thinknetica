# Заполнить массив числами фибоначчи до 100

fibonacci = []
fibonacci[0] = 0
fibonacci[1] = 1

i = 1

while fibonacci[i] < 100 - fibonacci[i - 1]
  i += 1
  fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2]
end

p fibonacci
