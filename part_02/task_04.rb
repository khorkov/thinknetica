# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

abc = ('a'..'z')
vowels = {}

abc.each_with_index do |key, index|
  vowels[key] = index + 1 if %w(a e i o u y).include?(key)
end

p vowels
