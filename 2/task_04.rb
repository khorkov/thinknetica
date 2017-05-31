# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

abc = ('a'..'z')
vowels = {}

abc.each.with_index(1) do |key, index|
  vowels[key] = index if %w(a e i o u y).include?(key)
end

p vowels
