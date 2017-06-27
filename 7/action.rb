class Action < Menu

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @menu_items = { 'Выход' => 'exit', 'Создать станцию' => 'create_station',
                    'Список станций и поездов на них' => 'stations_list',
                    'Создать маршрут' => 'create_route', 'Редактировать маршрут' => 'edit_route',
                    'Создать поезд' => 'create_train', 'Назначить поезду маршрут' => 'assign_route',
                    'Прицепить вагоны к поезду' => 'attach_wagon',
                    'Отцепить вагоны от поезда' => 'unhook_wagon',
                    'Переместить поезд по маршруту' => 'train_move' }

    super
    register_instance
  end
  # Все методы ниже в блоке private т.к. используются только из этого класса
  # и класс без наследников.

  private

  def create_station
    clear
    puts 'Введите название станции:'
    name = gets.strip.downcase.capitalize
    @stations << Station.new(name)
    puts "Создана станция: #{name}"
  end

  def stations_list
    clear
    @stations.each_with_index do |station, index|
      puts "#{index} #{station.name}"
      station.list
    end
  end

  def create_route
    stations_list
    puts 'Выберите начальную станцию:'
    from = @stations[gets.to_i]
    puts 'Выберите конечную станцию:'
    to = @stations[gets.to_i]
    @routes << Route.new(from, to)
    puts 'Маршрут создан'
  end

  def route_from_to(route)
    "#{route.stations.first.name} - #{route.stations.last.name}"
  end

  def edit_route_menu(route)
    puts 'Выберите действие:'
    puts '1 Добавить станцию'
    puts '2 Удалить станцию'
    choice = gets.to_i
    if choice == 1
      route_add_station(route)
    elsif choice == 2
      route_del_station(route)
    else
      puts 'Ошибка. Выберите 1 или 2'
    end
  end

  def route_add_station_list(route)
    clear
    @stations.each_with_index do |station, index|
      puts "#{index} #{station.name}" unless route.stations.include?(station)
    end
    puts 'Какую станцию добавить?'
  end

  def route_add_station(route)
    route_add_station_list(route)
    station = @stations[gets.to_i]
    route.add_station(station) unless station.nil?
    puts 'Станция добавлена'
  end

  def route_del_station(route)
    clear
    puts 'Какую станцию удалить?'
    route.list_station
    station = @stations[gets.to_i]
    route.remove_station(station) unless station.nil?
    puts 'Станция удалена'
  end

  def routes_list
    @routes.each_with_index { |route, index| puts "#{index} #{route_from_to(route)}" }
  end

  def choose_route
    clear
    routes_list
    puts 'Выберите маршрут:'
    @routes[gets.to_i]
  end

  def edit_route
    route = choose_route
    if route.nil?
      puts 'Маршрут не найден'
    else
      puts 'Станции маршрута:'
      route.list_station
      edit_route_menu(route)
    end
  end

  def create_train
    clear
    puts 'Введите номер поезда:'
    number = gets.strip
    puts '1 Грузовой поезд'
    puts '2 Пассажирский поезд'
    choice = gets.to_i
    create_cargo_train(number) if choice == 1
    create_passenger_train(number) if choice == 2
    puts 'Поезд создан'
  end

  def create_cargo_train(number)
    @trains << CargoTrain.new(number)
  end

  def create_passenger_train(number)
    @trains << PassengerTrain.new(number)
  end

  def list
    clear
    @trains.each_with_index do |train, index|
      train_route = route_from_to(train.route) unless train.route.nil?
      puts "#{index} #{train.number} #{train_route}"
    end
  end

  def choose_train
    list
    puts 'Выберите поезд:'
    @trains[gets.to_i]
  end

  def assign_route
    train = choose_train
    route = choose_route
    train.take_route(route)
    puts 'Маршрут назначен'
  end

  def wagon_count
    puts 'Сколько вагонов?'
    gets.to_i
  end

  def attach_wagon
    train = choose_train
    count = wagon_count
    wagon = PassengerWagon.new if train.type.eql?(:passenger)
    wagon = CargoWagon.new if train.type.eql?(:cargo)
    count.times { train.attach_wagon(wagon) }
    puts "Вагоны прицеплены. Текущее количество: #{train.list}"
  end

  def unhook_wagon
    train = choose_train
    count = wagon_count
    count.times { train.unhook_wagon }
    puts "Вагоны отцеплены. Текущее количество: #{train.list}"
  end

  def train_choose_direction(train)
    puts '0 Главное меню'
    puts '1 Двигаться вперёд по маршруту'
    puts '2 Двигаться назад по маршруту'
    train_position(train)
    direction = gets.to_i
    train.go_forward if direction == 1
    train.go_back if direction == 2
    main_menu if direction.zero?
    train_choose_direction(train)
  end

  def train_position(train)
    puts "\n\nТекущая станция: #{train.current_station.name}"
    puts "Следующая станция: #{train.next_station.name}"
    puts "Предыдущая станция: #{train.previous_station.name}"
  end

  def train_move
    train = choose_train
    train_choose_direction(train)
  end

end
