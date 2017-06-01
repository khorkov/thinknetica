# Подключаем файлы

require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'

# Создадим станции

station1 = Station.new('Планерная')
station2 = Station.new('Сходненская')
station3 = Station.new('Тушинская')

# Создадим маршрут 

route1 = Route.new(station1, station3)
route1.add_station(station2)
route1.list_station

# Создадим поезд

train1 = Train.new(10, 'пассажирский', 7)

# Назначим маршрут

train1.take_route(route1)

# Полный вперед 

train1.speed_up(50)
train1.current_speed
train1.go_forward

# Станция принимает поезд

station2.take_train(train1)

# Отцепим вагоны

train1.unhook_wagon
train1.list

# Станция отправляет поезд

station2.send_train(train1)

# Полный вперед!
train1.speed_up(110)
train1.go_back

# Пытаемся на ходу прицепить вагон
train1.attach_wagon

# Не получилось, придется тормозить
train1.stop

# Забираем вагоны
train1.attach_wagon
train1.list

# И снова вперед!
train1.speed_up(220)
train1.go_forward
train1.go_forward

# Приехали!
station3.take_train(train1)
