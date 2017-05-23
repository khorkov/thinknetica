# Заполнить массив числами Фибоначчи до 100

#fibonacci = []
#fibonacci[0] = 0
#fibonacci[1] = 1

fibonacci = [0,1]

i = 1

while fibonacci[i] < 100 - fibonacci[-1]
  i += 1
  fibonacci[i] = fibonacci[-1] + fibonacci[-2]
end

p fibonacci
